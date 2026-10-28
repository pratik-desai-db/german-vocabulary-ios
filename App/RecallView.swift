import SwiftUI
import LearningCore

struct RecallView: View {
    let items: [Vocabulary]
    @EnvironmentObject private var model: LearningModel
    @State private var index = 0
    @State private var answer = ""
    @State private var revealed = false
    @State private var usedHint = false
    @State private var hintVisible = false
    @State private var attempts = 0
    @State private var successes = 0

    var body: some View {
        Group {
            if index < items.count {
                activity(items[index])
            } else {
                List {
                    Section {
                        Label(items.isEmpty ? "Nothing due right now" : "Practice complete", systemImage: "checkmark.circle")
                            .font(.title2.bold())
                        Text(items.isEmpty
                             ? "Learn a phrase in Course, then return to recall it."
                             : "\(successes) successful recalls in \(attempts) attempts. Difficult items return sooner.")
                        Text("You can stop here. Your progress is saved after every answer.")
                        Text("Try one of today’s phrases in a real conversation.")
                    }
                }
            }
        }
        .navigationTitle("Recall")
    }

    private func activity(_ item: Vocabulary) -> some View {
        Form {
            Section("Item \(index + 1) of \(items.count)") {
                Text(prompt(item)).font(.title2.bold())
                if isListening(item) {
                    AudioButton(text: item.german)
                    Text("Listen, then write the English meaning. This is listening recognition, not a German recall.")
                        .font(.caption)
                }
                TextField("Your answer", text: $answer, axis: .vertical)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .disabled(revealed)
                if !revealed {
                    Button("Show a hint") {
                        hintVisible = true
                        usedHint = true
                    }
                    if hintVisible {
                        Text("Memory cue: \(item.cue)")
                        if let first = item.german.first {
                            Text("Starts with “\(first)”")
                        }
                    }
                    Button("Compare with suggested answer") { revealed = true }
                        .buttonStyle(.borderedProminent)
                }
            }
            if revealed {
                Section("Compare, then choose honest feedback") {
                    Text(item.german).font(.title2.bold())
                    Text(item.english)
                    Text(item.example)
                    Text(item.translation).foregroundStyle(.secondary)
                    if item.id == "appointments.arrange" {
                        Text("Missing word: vereinbaren")
                    }
                    AudioButton(text: item.german)
                    Text(feedback(item))
                    Text("Other natural wording can be correct. This check is not a grammar or pronunciation score. If unsure, choose Again.")
                        .font(.caption)
                    Button("Again · I could not recall it") { rate(item, .again) }
                    Button("Hard · I recalled it slowly") { rate(item, .hard) }
                        .disabled(answer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    Button("Good · I recalled it independently") { rate(item, .good) }
                        .disabled(usedHint || answer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    if usedHint {
                        Text("Hint used: choose Hard or Again. Hinted answers are practice, not independent recall.").font(.caption)
                    }
                }
            }
        }
    }

    private func prompt(_ item: Vocabulary) -> String {
        if item.id == "appointments.arrange" {
            return "Complete: Ich möchte einen Termin ____."
        }
        if isListening(item) { return "What does the audio mean?" }
        if item.id == "appointments.reschedule" {
            return "Which German verb could you use to move an appointment to another day?"
        }
        return "Say or write in German:\n\(item.english)"
    }

    private func isListening(_ item: Vocabulary) -> Bool {
        index % 3 == 1 && item.id != "appointments.arrange"
    }

    private func feedback(_ item: Vocabulary) -> String {
        let accepted = item.id == "appointments.arrange"
            ? ["vereinbaren", "Ich möchte einen Termin vereinbaren"]
            : (isListening(item) ? [item.english] : item.answers + [item.german])
        return AnswerMatcher.matches(answer, accepted: accepted)
            ? "Your wording matches a prepared answer. How well did you retrieve it?"
            : "Compare the meaning with the suggestion. Different valid wording may not be recognized by this simple offline check."
    }

    private func rate(_ item: Vocabulary, _ rating: RecallRating) {
        // Listening recognition and hinted attempts must not inflate independent recall.
        let independent = !isListening(item) && !usedHint
        if independent || rating == .again {
            model.update { $0.rate(item.id, rating: rating, now: Date()) }
        } else {
            model.update { $0.encounter(item.id, now: Date()) }
        }
        attempts += 1
        if independent && rating != .again { successes += 1 }
        index += 1
        answer = ""
        revealed = false
        usedHint = false
        hintVisible = false
    }
}
