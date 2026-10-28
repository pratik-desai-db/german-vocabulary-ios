import SwiftUI
import LearningCore

struct StartingCheckView: View {
    @EnvironmentObject private var model: LearningModel
    @State private var step = 0
    @State private var answer = ""
    @State private var revealed = false
    @State private var samples: [Vocabulary] = []

    var body: some View {
        NavigationStack {
            Form {
                if step == 0 {
                    Section {
                        Text("Willkommen zurück.").font(.largeTitle.bold())
                        Text("Practical German, one useful phrase at a time.")
                        Text("Refresh your A1 foundations on your way toward B1. This short check adapts three items; it is not a placement test.")
                    }
                    Section("Your pace") {
                        Stepper("Daily target: \(model.state.targetMinutes) minutes", value: Binding(
                            get: { model.state.targetMinutes },
                            set: { value in model.update { $0.targetMinutes = value } }
                        ), in: 15...60, step: 5)
                        Stepper("New words or phrases: \(model.state.newItemsPerDay)", value: Binding(
                            get: { model.state.newItemsPerDay },
                            set: { value in model.update { $0.newItemsPerDay = value } }
                        ), in: 0...10)
                    }
                    Section {
                        Text("No account or tracking. Progress and notes stay in this app on your phone. Device backups may include them. Speaking is optional and requires on-device recognition.")
                        Text("The check uses up to three new items from today’s allowance. With zero new items, new samples are skipped.")
                            .font(.caption)
                        Button("Start the short check") { startCheck() }
                        Button("Skip check and start fresh") { finish() }
                    }
                } else if step <= samples.count {
                    check(samples[step - 1])
                } else {
                    Section {
                        Label("You’re ready to begin", systemImage: "sun.max")
                            .font(.title2.bold())
                        Text("Recognized items return tomorrow; uncertain items stay due. Only independent German recall counts as a successful recall.")
                        Button("See my daily plan") { finish() }
                    }
                }
            }
            .navigationTitle(step == 0 ? "Deutsch Daily" :
                                (step <= samples.count ? "Starting check \(step) / \(samples.count)" : "Ready"))
        }
    }

    private func startCheck() {
        var budget = model.plan.remainingNewItemBudget
        samples = Course.lessons.prefix(3).compactMap { $0.items.first }.filter { item in
            if model.state.records[item.id]?.encountered == true { return true }
            guard budget > 0 else { return false }
            budget -= 1
            return true
        }
        step = 1
    }

    private func check(_ item: Vocabulary) -> some View {
        Section {
            if step == 1 {
                Text("Listen, then choose the English meaning.").font(.headline)
                AudioButton(text: item.german)
                Button(item.english) { record(item, familiar: true, recall: false) }
                Button("Thank you.") { record(item, familiar: false, recall: false) }
                Button("Goodbye.") { record(item, familiar: false, recall: false) }
                Button("Not sure / I don’t recognize it") { record(item, familiar: false, recall: false) }
                Text("Choose the meaning you heard. Recognition helps schedule review; it does not count as an independent recall.")
                    .font(.caption)
            } else if step == 2 {
                Text("Do you recognize this phrase?").font(.headline)
                Text(item.german).font(.title)
                Button("Reveal meaning") { revealed = true }
                if revealed {
                    Text(item.english)
                    Button("Yes, I knew that meaning") { record(item, familiar: true, recall: false) }
                    Button("New or rusty") { record(item, familiar: false, recall: false) }
                }
            } else {
                Text("Recall in German: \(item.english)").font(.headline)
                TextField("Your German answer", text: $answer)
                    .autocorrectionDisabled()
                Button("Compare") { revealed = true }
                if revealed {
                    Text(item.german).font(.title2)
                    Text("Other natural wording may also be correct. Compare honestly.")
                    Button("I recalled this without help") { record(item, familiar: true, recall: true) }
                        .disabled(answer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    Button("I need practice") { record(item, familiar: false, recall: true) }
                }
            }
        }
    }

    private func record(_ item: Vocabulary, familiar: Bool, recall: Bool) {
        model.update { state in
            state.encounter(item.id, now: Date())
            if recall {
                state.rate(item.id, rating: familiar ? .good : .again, now: Date())
            } else if familiar {
                state.records[item.id]?.due = Calendar.current.date(byAdding: .day, value: 1, to: Date())
            }
        }
        step += 1
        answer = ""
        revealed = false
    }

    private func finish() { model.update { $0.onboardingComplete = true } }
}
