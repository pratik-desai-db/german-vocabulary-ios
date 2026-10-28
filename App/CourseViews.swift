import SwiftUI
import LearningCore

struct TodayView: View {
    @EnvironmentObject private var model: LearningModel

    var body: some View {
        let plan = model.plan
        List {
            Section {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Small steps.\nUseful German.").font(.largeTitle.bold())
                    Text("Your \(model.state.targetMinutes)-minute plan").font(.headline)
                    Text("A calm return to everyday German, with B1 as your direction.")
                        .foregroundStyle(.secondary)
                }.padding(.vertical, 12)
            }
            Section("1 · Recall • about 8–10 minutes") {
                NavigationLink {
                    RecallView(items: plan.due)
                } label: {
                    Label("\(plan.due.count) due reviews", systemImage: "arrow.clockwise")
                }
                if plan.backlogCount > 0 {
                    Text("\(plan.backlogCount) more waiting. We start with the oldest and reduce new words. No streak penalty; stop when you need to.")
                        .font(.callout)
                }
            }
            Section("2 · Learn • about 10 minutes") {
                NavigationLink {
                    LessonView(lesson: plan.lesson)
                } label: {
                    Label(plan.lesson.title, systemImage: "book")
                }
                Text("\(plan.newItems.count) new items available now. Familiar items remain accessible in Course.")
                    .font(.callout).foregroundStyle(.secondary)
            }
            Section("3 · Use it • about 10 minutes") {
                NavigationLink("\(plan.lesson.title) speaking practice") {
                    DialogueView(lessonID: plan.lesson.id)
                }
                Text("Repeat, answer with hints, then try a prepared role-play. Typing works everywhere.")
            }
            Section("4 · Connect • 5–10 minutes") {
                Text("Write three sentences about your day using phrases from your lesson. Read them aloud and add a useful association to a word card.")
                Text("The time target is a flexible guide, not a timer or a promise. This starter week has a small vocabulary set: spend extra time reusing phrases.")
                    .font(.caption).foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Heute · Today")
    }
}

struct CourseView: View {
    @EnvironmentObject private var model: LearningModel

    var body: some View {
        List {
            Section {
                Text("Your first week").font(.title2.bold())
                Text("Days are learning steps, not calendar deadlines. Return whenever you can.")
            }
            ForEach(Course.lessons) { lesson in
                NavigationLink {
                    LessonView(lesson: lesson)
                } label: {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Day \(lesson.id) · \(lesson.title)").font(.headline)
                        Text(lesson.goal).font(.subheadline).foregroundStyle(.secondary)
                        if model.state.completedLessons.contains(lesson.id) {
                            Label("Completed", systemImage: "checkmark.circle.fill").font(.caption)
                        }
                    }.padding(.vertical, 4)
                }
            }
            Section("Beyond the prototype") {
                Text("This is a seven-step starter course, not a three-month B1 syllabus. Use official telc model tests and broader listening, reading, writing and speaking practice alongside it.")
            }
        }.navigationTitle("Course")
    }
}

struct LessonView: View {
    let lesson: Lesson
    @EnvironmentObject private var model: LearningModel

    private var encountered: [Vocabulary] {
        lesson.items.filter { model.state.records[$0.id]?.encountered == true }
    }

    var body: some View {
        List {
            Section {
                Text(lesson.goal).font(.title3.bold())
                Text("Learn the phrase in context, then close the card and try recalling it.")
            }
            Section("Vocabulary & associations") {
                ForEach(lesson.items) { item in
                    let available = model.state.records[item.id]?.encountered == true
                        || model.plan.remainingNewItemBudget > 0
                    NavigationLink { WordView(item: item) } label: {
                        VStack(alignment: .leading) {
                            Text(item.german).font(.headline)
                            Text(item.english).foregroundStyle(.secondary)
                            if !available {
                                Label("Next daily allowance", systemImage: "lock")
                                    .font(.caption).foregroundStyle(.secondary)
                            }
                        }
                    }.disabled(!available)
                }
            }
            Section("Recall & use") {
                NavigationLink("Practice \(encountered.count) encountered items") {
                    RecallView(items: encountered)
                }.disabled(encountered.isEmpty)
                NavigationLink("Prepared speaking practice") {
                    DialogueView(lessonID: lesson.id)
                }
                Text("Try a sentence about your own life. Nouns include their article and plural; learn verbs inside useful phrases.")
                Button(model.state.completedLessons.contains(lesson.id) ? "Lesson completed" : "Mark lesson completed") {
                    model.update { $0.completeLesson(lesson.id) }
                }
                .disabled(encountered.count < lesson.items.count || model.state.completedLessons.contains(lesson.id))
                Text("Completion records that you visited all cards, not mastery. Successful recalls are tracked separately.")
                    .font(.caption).foregroundStyle(.secondary)
            }
        }.navigationTitle(lesson.title)
    }
}

struct WordView: View {
    let item: Vocabulary
    @EnvironmentObject private var model: LearningModel

    var body: some View {
        Form {
            Section {
                Text(item.german).font(.largeTitle.bold()).accessibilityAddTraits(.isHeader)
                Text(item.english).font(.title3)
                AudioButton(text: item.german)
            }
            Section("In everyday life") {
                Text(item.example).font(.title3)
                Text(item.translation).foregroundStyle(.secondary)
                AudioButton(text: item.example)
            }
            Section("Memory connection") {
                Text(item.cue)
                TextField("Your own association or example", text: Binding(
                    get: { model.state.records[item.id]?.note ?? "" },
                    set: { note in model.update { $0.setNote(note, for: item.id) } }
                ), axis: .vertical)
                .lineLimit(3...8)
                Text("Saved only on this device. Avoid sensitive details.").font(.caption)
            }
            Section {
                Text("Now look away and say the German phrase. Seeing a card does not count as a successful recall.")
            }
        }
        .navigationTitle("Learn")
        .onAppear { model.update { $0.encounter(item.id, now: Date()) } }
    }
}

struct ProgressScreen: View {
    @EnvironmentObject private var model: LearningModel

    var body: some View {
        let records = Array(model.state.records.values)
        List {
            Section("Your vocabulary") {
                LabeledContent("Encountered", value: "\(records.filter(\.encountered).count)")
                LabeledContent("Recalled at least once", value: "\(records.filter { $0.successfulRecalls > 0 }.count)")
                LabeledContent("Successful recall attempts", value: "\(records.reduce(0) { $0 + $1.successfulRecalls })")
                LabeledContent("Lessons completed", value: "\(model.state.completedLessons.count) / 7")
                Text("A successful recall is your self-assessment after trying without the answer. Recognition and opening cards do not count. These numbers do not certify mastery or exam readiness.")
                    .font(.caption)
            }
            Section("Needs another try") {
                ForEach(Course.items.filter { (model.state.records[$0.id]?.lapses ?? 0) > 0 }) { item in
                    NavigationLink(item.german) { WordView(item: item) }
                }
            }
            Section("Recent activity · learning actions") {
                if model.state.activity.isEmpty { Text("Your activity will appear as you learn.") }
                ForEach(model.state.activity.keys.sorted().suffix(7).reversed(), id: \.self) { date in
                    LabeledContent(date, value: "\(model.state.activity[date] ?? 0)")
                }
                Text("No streaks to lose. Missed days simply leave reviews waiting.").font(.caption)
            }
            Section("Latest review ratings") {
                if model.state.reviewHistory.isEmpty { Text("No recall ratings yet.") }
                ForEach(Array(model.state.reviewHistory.suffix(10).reversed().enumerated()), id: \.offset) { entry in
                    let event = entry.element
                    VStack(alignment: .leading) {
                        Text(Course.items.first { $0.id == event.itemID }?.german ?? event.itemID)
                        Text("\(event.rating.capitalized) · \(event.date.formatted(date: .abbreviated, time: .shortened))")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
        }.navigationTitle("Progress")
    }
}

struct SettingsView: View {
    @EnvironmentObject private var model: LearningModel

    var body: some View {
        Form {
            Section("A pace you can keep") {
                Stepper("New items per day: \(model.state.newItemsPerDay)", value: Binding(
                    get: { model.state.newItemsPerDay },
                    set: { value in model.update { $0.newItemsPerDay = value } }
                ), in: 0...10)
                Stepper("Daily target: \(model.state.targetMinutes) minutes", value: Binding(
                    get: { model.state.targetMinutes },
                    set: { value in model.update { $0.targetMinutes = value } }
                ), in: 15...60, step: 5)
                Text("Set new items to zero for a review-only day. Backlogs reduce new material automatically.")
            }
            Section("Private by design") {
                Text("No account, analytics, ads or external APIs. Notes, progress and review history are stored in this app’s local Application Support folder.")
                Text("Apple device backups may include this data depending on your settings. Losing the phone or deleting the app can lose progress. There is no app-managed cloud sync.")
                Text("Microphone and speech permissions are requested only after you tap Record. Speech requires on-device German recognition; otherwise use typing. Recordings and transcripts are not saved.")
            }
            Section("What this can and cannot do") {
                Text("German system-voice audio, spaced vocabulary recall and prepared dialogues. No unconstrained AI conversation and no reliable pronunciation scoring.")
                Text("B1 exam support, not an official telc course or a guarantee of readiness. Use official practice tests and human speaking feedback.")
            }
        }.navigationTitle("Settings")
    }
}
