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
                    Text("Day \(plan.lesson.id) of \(Course.totalDays) · Week \((plan.lesson.id - 1) / 7 + 1)")
                    Text("Everyday German, with B1 as your direction. Learning days are flexible steps, not deadlines.")
                        .foregroundStyle(.secondary)
                    if model.state.completedLessons.count >= Course.totalDays {
                        Label("Course completed · keep your reviews going", systemImage: "checkmark.seal")
                        Text("Use the final reflection to choose your next practice. Completion does not certify B1 readiness.")
                    }
                }.padding(.vertical, 12)
            }
            Section("1 · Recall • about \(max(4, model.state.targetMinutes / 4)) minutes") {
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
            Section("2 · Learn • about \(max(4, model.state.targetMinutes / 4)) minutes") {
                NavigationLink {
                    LessonView(lesson: plan.lesson)
                } label: {
                    Label(plan.lesson.title, systemImage: "book")
                }
                Text("\(plan.newItems.count) new items available now. Familiar items remain accessible in Course.")
                    .font(.callout).foregroundStyle(.secondary)
            }
            Section("3 · Use it • about \(max(4, model.state.targetMinutes / 4)) minutes") {
                NavigationLink("\(plan.lesson.title) speaking practice") {
                    DialogueView(lessonID: plan.lesson.id)
                }
                Text("Repeat, answer with hints, then try a prepared role-play. Typing works everywhere.")
            }
            Section("4 · Read & write • remaining time") {
                NavigationLink("Day \(plan.lesson.id) workbook") {
                    WorkbookView(lessonID: plan.lesson.id)
                }
                Text("Read a short everyday text, notice a grammar pattern, then write your own response. Your drafts and self-checks stay on this phone.")
                Text("The time target is a flexible guide, not a timer. If reviews need longer, pause new material and continue the workbook another day.")
                    .font(.caption).foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Heute · Today")
    }
}

struct CourseView: View {
    @EnvironmentObject private var model: LearningModel
    @State private var search = ""

    private func matches(_ lesson: Lesson) -> Bool {
        let query = search.trimmingCharacters(in: .whitespacesAndNewlines)
        return query.isEmpty || ([lesson.title, lesson.goal] + lesson.items.flatMap { [$0.german, $0.english] })
            .contains { $0.localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        List {
            Section {
                Text("Your 90-day course").font(.title2.bold())
                Text("Month 1 · Refresh everyday foundations\nMonth 2 · Connect ideas and handle situations\nMonth 3 · Express yourself and prepare for broader B1 practice")
                Text("Days are learning steps, not calendar deadlines. Reviews reuse earlier vocabulary. Take longer whenever you need to.")
            }
            ForEach(Course.weeks) { week in
                let lessons = week.days.filter(matches)
                if !lessons.isEmpty {
                    Section(week.title) {
                        ForEach(lessons) { lesson in
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
                    }
                }
            }
            Section("Exam support, not certification") {
                Text("This original course supports vocabulary and everyday communication over roughly three months. It is not an official telc syllabus, full mock exam, or guarantee of B1 readiness. Add official practice tests, varied real-world listening, and human feedback.")
            }
        }
        .navigationTitle("Course")
        .searchable(text: $search, prompt: "Find a topic or phrase")
    }
}

struct LessonView: View {
    @State private var lesson: Lesson
    @EnvironmentObject private var model: LearningModel

    init(lesson: Lesson) {
        _lesson = State(initialValue: lesson)
    }

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
                NavigationLink("Reading, grammar & writing workbook") {
                    WorkbookView(lessonID: lesson.id)
                }
                let work = model.state.workbook[lesson.id] ?? LessonWork()
                Label("Vocabulary cards: \(encountered.count) / \(lesson.items.count)",
                      systemImage: encountered.count == lesson.items.count ? "checkmark.circle" : "circle")
                Label(work.readingChecked ? "Reading self-check done" : "Reading self-check remaining",
                      systemImage: work.readingChecked ? "checkmark.circle" : "circle")
                Label(work.writingChecked ? "Writing self-check done" : "Writing self-check remaining",
                      systemImage: work.writingChecked ? "checkmark.circle" : "circle")
                Label(work.speakingPracticed ? "Prepared dialogue practiced" : "Prepared dialogue remaining",
                      systemImage: work.speakingPracticed ? "checkmark.circle" : "circle")
                Button(model.state.completedLessons.contains(lesson.id) ? "Lesson completed" : "Mark lesson completed") {
                    model.update { $0.completeLesson(lesson.id) }
                }
                .disabled(!model.state.canCompleteLesson(lesson.id) || model.state.completedLessons.contains(lesson.id))
                Text("Complete the cards, workbook self-checks and prepared dialogue first. Completion records participation, not mastery. Independent recalls are counted separately.")
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
                AudioButton(text: item.spokenGerman)
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

struct WorkbookView: View {
    let lessonID: Int
    @EnvironmentObject private var model: LearningModel
    @State private var showTranslation = false
    @State private var showReadingAnswer = false
    @State private var showWritingModel = false

    private var work: LessonWork {
        model.state.workbook[lessonID] ?? LessonWork()
    }

    var body: some View {
        Group {
            if let day = Course.day(lessonID) {
                Form {
                    Section {
                        Text(day.lesson.title).font(.title2.bold())
                        Text("Read, notice, write, then compare. These original activities support your vocabulary; self-checks are not automated language grades.")
                    }
                    Section("Notice the pattern") {
                        Text(day.grammar)
                        Text("Say a new sentence using this pattern and a phrase from today's cards.")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                    reading(day.reading)
                    writing(day.writing)
                    Section("Keep it practical") {
                        NavigationLink("Practice the prepared dialogue") {
                            DialogueView(lessonID: lessonID)
                        }
                        Text("Your writing and reading responses are saved as you type. Invent names and details; you never need to record sensitive information.")
                            .font(.caption)
                    }
                }
            } else {
                ContentUnavailableView("Workbook unavailable", systemImage: "book.closed",
                                       description: Text("Return to the course and choose a learning day."))
            }
        }
        .navigationTitle("Day \(lessonID) workbook")
    }

    private func reading(_ passage: ReadingPassage) -> some View {
        Section("Read or listen") {
            Text(passage.german).font(.title3)
            AudioButton(text: passage.german)
            Button(showTranslation ? "Hide English support" : "Show English support") {
                showTranslation.toggle()
            }
            if showTranslation { Text(passage.english).foregroundStyle(.secondary) }
            Text(passage.question).font(.headline)
            TextField("Your answer in English or German", text: Binding(
                get: { work.readingResponse },
                set: { value in
                    editWork {
                        $0.readingResponse = value
                        $0.readingChecked = false
                    }
                }
            ), axis: .vertical)
            .lineLimit(2...6)
            .onChange(of: work.readingResponse) { _ in showReadingAnswer = false }
            Button("Compare the meaning") { showReadingAnswer = true }
                .disabled(work.readingResponse.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            if showReadingAnswer || work.readingChecked {
                Text("Suggested answer: \(passage.answer)")
                Text("Different wording is fine if it conveys the same information. Correct your answer if needed, then self-check.")
                    .font(.caption)
                Toggle("I checked my reading response", isOn: Binding(
                    get: { work.readingChecked },
                    set: { checked in editWork { $0.readingChecked = checked } }
                ))
            }
        }
    }

    private func writing(_ task: WritingTask) -> some View {
        Section("Write & connect") {
            Text(task.prompt).font(.headline)
            ForEach(task.checklist, id: \.self) { point in
                Label(point, systemImage: "square")
            }
            TextField("Your German draft", text: Binding(
                get: { work.writingDraft },
                set: { value in
                    editWork {
                        $0.writingDraft = value
                        $0.writingChecked = false
                    }
                }
            ), axis: .vertical)
            .lineLimit(5...16)
            .autocorrectionDisabled()
            Button(showWritingModel ? "Hide the example" : "Show a model after trying") {
                showWritingModel.toggle()
            }
            .disabled(work.writingDraft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            if showWritingModel || work.writingChecked {
                Text(task.model)
                AudioButton(text: task.model)
                Text("This is one possible text, not an exact answer key. Check that you covered each point, used a suitable greeting/register, and made your meaning clear. The app cannot reliably correct grammar; ask a teacher or partner for feedback.")
                    .font(.caption)
                Toggle("I compared my draft with the checklist", isOn: Binding(
                    get: { work.writingChecked },
                    set: { checked in editWork { $0.writingChecked = checked } }
                ))
                .disabled(work.writingDraft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }

    private func editWork(_ change: (inout LessonWork) -> Void) {
        var updated = work
        change(&updated)
        model.update { $0.updateWork(updated, for: lessonID) }
    }
}

struct ProgressScreen: View {
    @EnvironmentObject private var model: LearningModel

    var body: some View {
        let records = Array(model.state.records.values)
        List {
            Section("Your vocabulary") {
                LabeledContent("Encountered", value: "\(records.filter(\.encountered).count) / \(Course.items.count)")
                LabeledContent("Recalled at least once", value: "\(records.filter { $0.successfulRecalls > 0 }.count)")
                LabeledContent("Successful recall attempts", value: "\(records.reduce(0) { $0 + $1.successfulRecalls })")
                LabeledContent("Lessons completed", value: "\(model.state.completedLessons.count) / \(Course.totalDays)")
                Text("A successful recall is your self-assessment after trying without the answer. Recognition and opening cards do not count. These numbers do not certify mastery or exam readiness.")
                    .font(.caption)
            }
            Section("Three-month journey") {
                ForEach(Course.weeks) { week in
                    let completed = week.days.filter { model.state.completedLessons.contains($0.id) }.count
                    LabeledContent(week.title, value: "\(completed) / \(week.days.count)")
                }
                Text("Weekly consolidation and day 90 are reflection checkpoints, not exam pass scores. Slower progress is still progress.")
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
                Text("A 90-day guided course with German system-voice audio, spaced vocabulary recall, prepared dialogues and saved reading/writing workbooks. Grammar notes and model texts support self-checking; they do not automatically correct your German.")
                Text("No unconstrained AI conversation and no reliable pronunciation scoring.")
                Text("B1 exam support, not an official telc course or a guarantee of readiness. Use official practice tests and human speaking feedback.")
            }
        }.navigationTitle("Settings")
    }
}
