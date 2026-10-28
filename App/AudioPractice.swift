import AVFoundation
import Speech
import SwiftUI
import UIKit

@MainActor
final class AudioPractice: ObservableObject {
    @Published var transcript = ""
    @Published var message = ""
    @Published var recording = false
    private let synthesizer = AVSpeechSynthesizer()
    private let engine = AVAudioEngine()
    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "de-DE"))
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    private var installedTap = false
    private var sessionID = UUID()

    func speak(_ text: String) {
        stop()
        guard let voice = AVSpeechSynthesisVoice(language: "de-DE") else {
            message = "German audio is unavailable. Install a German system voice in iPhone Accessibility settings. You can still read and type."
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio)
            try AVAudioSession.sharedInstance().setActive(true)
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = voice
            utterance.rate = 0.43
            synthesizer.speak(utterance)
        } catch {
            message = "Audio playback is unavailable. Read the German text instead."
        }
    }

    func start() async {
        stop()
        let attempt = sessionID
        guard let recognizer, recognizer.supportsOnDeviceRecognition, recognizer.isAvailable else {
            message = "On-device German recognition is unavailable on this iPhone. Nothing is sent to a server. Please type your response."
            return
        }
        let speechAllowed = await withCheckedContinuation { continuation in
            SFSpeechRecognizer.requestAuthorization { status in
                continuation.resume(returning: status == .authorized)
            }
        }
        guard attempt == sessionID else { return }
        guard speechAllowed else {
            message = "Speech permission is off. Type instead, or enable Speech Recognition in Settings."
            return
        }
        let microphoneAllowed = await withCheckedContinuation { continuation in
            AVAudioSession.sharedInstance().requestRecordPermission { allowed in
                continuation.resume(returning: allowed)
            }
        }
        guard attempt == sessionID else { return }
        guard microphoneAllowed else {
            message = "Microphone permission is off. Type instead, or enable it in Settings."
            return
        }
        guard recognizer.supportsOnDeviceRecognition, recognizer.isAvailable else {
            message = "On-device recognition became unavailable. Please type instead."
            return
        }
        guard UIApplication.shared.applicationState == .active else {
            message = "Permissions are set. Tap Record again when the app is active, or type instead."
            return
        }
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.record, mode: .measurement, options: .duckOthers)
            try session.setActive(true)
            let request = SFSpeechAudioBufferRecognitionRequest()
            request.requiresOnDeviceRecognition = true
            request.shouldReportPartialResults = true
            self.request = request
            transcript = ""
            let input = engine.inputNode
            let format = input.outputFormat(forBus: 0)
            guard format.sampleRate > 0, format.channelCount > 0 else {
                stop()
                message = "No microphone input is available. Please type instead."
                return
            }
            input.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
                request.append(buffer)
            }
            installedTap = true
            task = recognizer.recognitionTask(with: request) { [weak self] result, error in
                let text = result?.bestTranscription.formattedString
                let finished = result?.isFinal == true
                Task { @MainActor [weak self] in
                    guard let self, self.sessionID == attempt else { return }
                    if let text { self.transcript = text }
                    if finished || error != nil {
                        self.stop()
                        self.message = error == nil
                            ? "Check and edit the transcript before using it."
                            : "Recognition stopped. Edit the transcript or type instead; no server fallback was used."
                    }
                }
            }
            engine.prepare()
            try engine.start()
            recording = true
            message = "Listening on device. Tap Stop when finished, then correct the transcript."
        } catch {
            stop()
            message = "On-device recording could not start. Please type instead."
        }
    }

    func stop() {
        sessionID = UUID()
        synthesizer.stopSpeaking(at: .immediate)
        engine.stop()
        if installedTap {
            engine.inputNode.removeTap(onBus: 0)
            installedTap = false
        }
        request?.endAudio()
        task?.cancel()
        task = nil
        request = nil
        recording = false
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }

    func pauseForInactivity() {
        // Permission alerts make the scene inactive before recording has begun.
        if recording || synthesizer.isSpeaking { stop() }
    }
}

struct AudioButton: View {
    let text: String
    @StateObject private var audio = AudioPractice()
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        VStack(alignment: .leading) {
            Button { audio.speak(text) } label: {
                Label("Listen in German", systemImage: "speaker.wave.2")
            }
            if !audio.message.isEmpty { Text(audio.message).font(.caption) }
        }
        .onDisappear { audio.stop() }
        .onChange(of: scenePhase) { phase in
            if phase == .background { audio.stop() }
            else if phase == .inactive { audio.pauseForInactivity() }
        }
    }
}
