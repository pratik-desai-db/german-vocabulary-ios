import SwiftUI
import LearningCore

private struct DialogueTurn {
    let title: String
    let partner: String
    let task: String
    let hint: String
    let suggestions: [String]
}

struct DialogueView: View {
    @StateObject private var audio = AudioPractice()
    @Environment(\.scenePhase) private var scenePhase
    @State private var stage = 0
    @State private var reschedule = false
    @State private var hintVisible = false
    @State private var compared = false

    private var turns: [DialogueTurn] {
        [
            DialogueTurn(title: "1 · Repeat", partner: "Ich möchte einen Termin vereinbaren.",
                         task: "Listen, then repeat: I’d like to arrange an appointment.",
                         hint: "Ich möchte …", suggestions: ["Ich möchte einen Termin vereinbaren."]),
            DialogueTurn(title: "2 · Guided answer", partner: "Haben Sie morgen Zeit?",
                         task: "Say that tomorrow works for you.",
                         hint: "Ja … morgen … passt …", suggestions: ["Ja, morgen passt mir.", "Ja, ich habe morgen Zeit."]),
            DialogueTurn(title: "3 · Recall", partner: "",
                         task: "Tomorrow no longer works. Ask to reschedule your appointment.",
                         hint: "Ich möchte meinen Termin …", suggestions: ["Ich möchte meinen Termin verschieben.", "Kann ich meinen Termin verschieben?"]),
            DialogueTurn(title: "4 · Receptionist", partner: "Guten Tag. Wie kann ich Ihnen helfen?",
                         task: reschedule ? "Explain that you need to change your appointment." : "Ask to make an appointment.",
                         hint: reschedule ? "Könnte ich … verschieben?" : "Ich hätte gern …",
                         suggestions: reschedule
                            ? ["Könnte ich meinen Termin verschieben?", "Ich möchte meinen Termin verschieben."]
                            : ["Ich hätte gern einen Termin.", "Ich möchte einen Termin vereinbaren."]),
            DialogueTurn(title: "5 · Choose a time", partner: "Passt Ihnen Freitag um zehn Uhr?",
                         task: reschedule ? "Friday does not work. Ask about Monday." : "Say Friday at ten works for you.",
                         hint: reschedule ? "Freitag passt mir leider nicht. … Montag?" : "Ja … passt mir …",
                         suggestions: reschedule
                            ? ["Freitag passt mir leider nicht. Haben Sie am Montag einen Termin frei?", "Haben Sie am Montag Zeit?"]
                            : ["Ja, Freitag um zehn passt mir.", "Ja, das passt mir."]),
            DialogueTurn(title: "6 · Confirm", partner: reschedule
                         ? "Am Montag um neun Uhr ist noch ein Termin frei."
                         : "Gut, dann bis Freitag um zehn Uhr.",
                         task: reschedule ? "Accept Monday at nine and say thank you." : "Thank the receptionist and say goodbye.",
                         hint: "Vielen Dank … Auf Wiedersehen.",
                         suggestions: reschedule
                            ? ["Montag um neun passt mir. Vielen Dank. Auf Wiedersehen."]
                            : ["Vielen Dank. Auf Wiedersehen.", "Danke, bis Freitag."])
        ]
    }

    var body: some View {
        Form {
            Section {
                Text("Prepared paths, real-life phrases").font(.title2.bold())
                Text("Not an AI conversation or a pronunciation test. The next line follows the path you choose, not an interpretation of your voice. Responses are not saved.")
                    .font(.callout)
            }
            if stage < turns.count {
                turnView(turns[stage])
            } else {
                Section {
                    Label("You’ve finished the dialogue", systemImage: "checkmark.circle")
                    Text("Try it once more without hints, or choose the other path. Independent vocabulary recalls are recorded in Recall, not inferred from speech.")
                    Button("Practice again") {
                        stage = 0
                        resetTurn()
                    }
                }
            }
        }
        .navigationTitle("Appointment practice")
        .onDisappear { audio.stop() }
        .onChange(of: scenePhase) { phase in
            if phase == .background { audio.stop() }
            else if phase == .inactive { audio.pauseForInactivity() }
        }
    }

    private func turnView(_ turn: DialogueTurn) -> some View {
        Group {
            if stage == 3 {
                Section("Choose the prepared role-play") {
                    Picker("Your goal", selection: $reschedule) {
                        Text("Make an appointment").tag(false)
                        Text("Change an appointment").tag(true)
                    }
                    .onChange(of: reschedule) { _ in resetTurn() }
                }
            }
            Section(turn.title) {
                if !turn.partner.isEmpty {
                    Text(turn.partner).font(.title3.bold())
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
