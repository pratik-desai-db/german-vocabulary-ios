import SwiftUI
import LearningCore

struct DialogueView: View {
    let lessonID: Int
    @EnvironmentObject private var model: LearningModel
    @StateObject private var audio = AudioPractice()
    @Environment(\.scenePhase) private var scenePhase
    @State private var stage = 0
    @State private var selectedPath = 0
    @State private var hintVisible = false
    @State private var compared = false

    private var paths: [PracticePath] { PreparedPractice.paths(for: lessonID) }
    private var turns: [PracticeTurn] {
        guard paths.indices.contains(selectedPath) else { return [] }
        return paths[selectedPath].turns
    }

    var body: some View {
        Form {
            Section {
                Text("Prepared paths, real-life phrases").font(.title2.bold())
                Text("Not an AI conversation or a pronunciation test. The next line follows the path you choose, not an interpretation of your voice. Responses are not saved.")
                    .font(.callout)
            }
            if paths.count > 1 {
                Section("Choose a prepared path") {
                    Picker("Your goal", selection: $selectedPath) {
                        ForEach(paths.indices, id: \.self) { index in
                            Text(paths[index].title).tag(index)
                        }
                    }
                    .onChange(of: selectedPath) { _ in
                        stage = 0
                        resetTurn()
                    }
                    Text("Changing paths restarts this practice.").font(.caption)
                }
            }
            if stage < turns.count {
                turnView(turns[stage])
            } else {
                Section {
                    Label("You’ve finished the dialogue", systemImage: "checkmark.circle")
                    Text("Try it once more without hints, or choose the other path. Independent vocabulary recalls are recorded in Recall, not inferred from speech.")
                    Text("This practice is recorded as participation in your lesson checklist, not successful vocabulary recall.")
                    Button("Practice again") {
                        stage = 0
                        resetTurn()
                    }
                }
            }
        }
        .navigationTitle("Speaking practice")
        .onDisappear { audio.stop() }
        .onChange(of: scenePhase) { phase in
            if phase == .background { audio.stop() }
            else if phase == .inactive { audio.pauseForInactivity() }
        }
    }

    private func turnView(_ turn: PracticeTurn) -> some View {
        Group {
            Section(turn.title) {
                if !turn.partner.isEmpty {
                    Text(turn.partner).font(.title3.bold())
                    Text(turn.partnerTranslation).foregroundStyle(.secondary)
                    Button { audio.speak(turn.partner) } label: {
                        Label("Listen to the prepared line", systemImage: "speaker.wave.2")
                    }
                }
                Text(turn.task)
                Button("Show hint") { hintVisible = true }
                if hintVisible { Text(turn.hint).foregroundStyle(.secondary) }
            }
            Section("Say it or type it") {
                TextField("German response / editable transcript", text: $audio.transcript, axis: .vertical)
                    .lineLimit(3...8)
                    .autocorrectionDisabled()
                    .accessibilityLabel("Your German response. Correct the transcript here.")
                    .onChange(of: audio.transcript) { _ in compared = false }
                Button {
                    if audio.recording {
                        audio.stop()
                        audio.message = "Recording stopped. Correct the transcript before comparing."
                    } else {
                        Task { await audio.start() }
                    }
                } label: {
                    Label(audio.recording ? "Stop recording" : "Record on device", systemImage: audio.recording ? "stop.circle" : "mic")
                }
                if !audio.message.isEmpty { Text(audio.message).font(.callout) }
                Text("Recording replaces the text above. Typing needs no permissions. Stop recording before comparing.")
                    .font(.caption)
                Button("Compare my response") { compared = true }
                    .disabled(audio.recording || audio.transcript.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            if compared {
                Section("Suggested responses · not the only valid answers") {
                    Text(AnswerMatcher.matches(audio.transcript, accepted: turn.suggestions)
                         ? "Your wording matches a prepared response."
                         : "Your wording differs. Compare the intent below; this limited check cannot judge all valid German.")
                    ForEach(turn.suggestions, id: \.self) { Text($0) }
                    Text("Did you convey the requested meaning? Adjust your response or continue. No pronunciation score is calculated.")
                    Button("Continue along this prepared path") {
                        stage += 1
                        resetTurn()
                        if stage == turns.count {
                            var work = model.state.workbook[lessonID] ?? LessonWork()
                            work.speakingPracticed = true
                            model.update { $0.updateWork(work, for: lessonID) }
                        }
                    }.buttonStyle(.borderedProminent)
                }
            }
        }
    }

    private func resetTurn() {
        audio.stop()
        audio.transcript = ""
        audio.message = ""
        compared = false
        hintVisible = false
    }
}
