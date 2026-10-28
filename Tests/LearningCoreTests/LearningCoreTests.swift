import Foundation
import XCTest
@testable import LearningCore

final class LearningCoreTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_798_459_200)

    func testDefaults() {
        let state = LearnerState()
        XCTAssertFalse(state.onboardingComplete)
        XCTAssertEqual(state.newItemsPerDay, 5)
        XCTAssertEqual(state.targetMinutes, 35)
        XCTAssertTrue(state.records.isEmpty)
        XCTAssertTrue(state.completedLessons.isEmpty)
        XCTAssertTrue(state.activity.isEmpty)
        XCTAssertTrue(state.reviewHistory.isEmpty)
        XCTAssertEqual(ItemProgress(), ItemProgress(encountered: false, successfulRecalls: 0, lapses: 0, note: "", due: nil, intervalDays: 0))
    }

    func testEncounterIsNotSuccessfulRecallAndIsIdempotent() throws {
        let id = Course.items[0].id
        var state = LearnerState()
        state.encounter(id, now: now)
        let initial = state
        state.encounter(id, now: now.addingTimeInterval(60))
        XCTAssertEqual(state, initial)
        let progress = try XCTUnwrap(state.records[id])
        XCTAssertTrue(progress.encountered)
        XCTAssertEqual(progress.successfulRecalls, 0)
        XCTAssertEqual(progress.lapses, 0)
        XCTAssertEqual(progress.due, now)
        XCTAssertEqual(progress.firstEncounteredAt, now)
        XCTAssertEqual(state.activity[LearningCalendar.dayKey(now)], 1)
        XCTAssertEqual(DailyPlan(state: state, now: now).due.map(\.id), [id])
    }

    func testGoodRecallGrowsIntervalsAndAgainResetsWithoutErasingHistory() throws {
        let id = Course.items[0].id
        var state = LearnerState()
        var reviewTime = now
        for expected in [1, 3, 7, 17] {
            state.rate(id, rating: .good, now: reviewTime)
            let progress = try XCTUnwrap(state.records[id])
            XCTAssertEqual(progress.intervalDays, expected)
            XCTAssertEqual(progress.due, LearningCalendar.addDays(expected, to: reviewTime))
            reviewTime = try XCTUnwrap(progress.due)
        }
        state.rate(id, rating: .again, now: reviewTime)
        let failed = try XCTUnwrap(state.records[id])
        XCTAssertEqual(failed.successfulRecalls, 4)
        XCTAssertEqual(failed.lapses, 1)
        XCTAssertEqual(failed.intervalDays, 0)
        XCTAssertEqual(failed.due, reviewTime.addingTimeInterval(600))
        state.rate(id, rating: .good, now: reviewTime.addingTimeInterval(600))
        XCTAssertEqual(state.records[id]?.intervalDays, 1)
    }

    func testHardRecallDoesNotGrowInterval() {
        let id = Course.items[0].id
        var state = LearnerState()
        state.rate(id, rating: .hard, now: now)
        XCTAssertEqual(state.records[id]?.successfulRecalls, 1)
        XCTAssertEqual(state.records[id]?.intervalDays, 1)
        state.rate(id, rating: .good, now: now)
        state.rate(id, rating: .hard, now: now)
        XCTAssertEqual(state.records[id]?.intervalDays, 3)
        XCTAssertEqual(state.records[id]?.due, LearningCalendar.addDays(3, to: now))
    }

    func testIntervalIsCapped() {
        let id = Course.items[0].id
        var state = LearnerState()
        for _ in 0..<20 { state.rate(id, rating: .good, now: now) }
        XCTAssertEqual(state.records[id]?.intervalDays, 365)
    }

    func testDayBudgetSurvivesRepeatedPlansAndStateRoundTrip() throws {
        var state = LearnerState()
        let first = DailyPlan(state: state, now: now)
        XCTAssertEqual(first.newItems.count, 5)
        state.encounter(first.newItems[0].id, now: now)
        state.encounter(first.newItems[1].id, now: now)
        let restored = try JSONDecoder().decode(LearnerState.self, from: JSONEncoder().encode(state))
        let second = DailyPlan(state: restored, now: now)
        XCTAssertEqual(second.newItems.count, 3)
        XCTAssertTrue(Set(second.newItems.map(\.id)).isDisjoint(with: Set(first.newItems.prefix(2).map(\.id))))
        XCTAssertEqual(DailyPlan(state: restored, now: now).newItems, second.newItems)
        for item in second.newItems { state.encounter(item.id, now: now) }
        XCTAssertTrue(DailyPlan(state: state, now: now).newItems.isEmpty)
    }

    func testBudgetResetsOnNextDayWithoutAccumulatingMissedDays() {
        var state = LearnerState(newItemsPerDay: 4)
        for item in Course.items.prefix(4) { state.encounter(item.id, now: now) }
        XCTAssertTrue(DailyPlan(state: state, now: now).newItems.isEmpty)
        let later = LearningCalendar.addDays(10, to: now)
        XCTAssertEqual(DailyPlan(state: state, now: later).remainingNewItemBudget, 4)
        XCTAssertEqual(DailyPlan(state: state, now: later).newItems.count, 1)
        XCTAssertEqual(state.records[Course.items[0].id]?.lapses, 0)
        XCTAssertEqual(state.records[Course.items[0].id]?.intervalDays, 0)
    }

    func testNegativeBudgetIsZero() {
        XCTAssertTrue(DailyPlan(state: LearnerState(newItemsPerDay: -5), now: now).newItems.isEmpty)
    }

    func testRatingAnUnseenItemConsumesOnlyOneNewItemAllowance() {
        let id = Course.items[0].id
        var state = LearnerState()
        state.rate(id, rating: .good, now: now)
        state.rate(id, rating: .hard, now: now)
        state.rate(id, rating: .again, now: now)
        XCTAssertEqual(DailyPlan(state: state, now: now).newItems.count, 4)
        XCTAssertEqual(state.records[id]?.firstEncounteredAt, now)
    }

    func testReviewHistoryRecordsEveryRatingButNotExposureOrNotes() {
        let id = Course.items[0].id
        var state = LearnerState()
        state.encounter(id, now: now)
        state.setNote("A note is not a review", for: id)
        XCTAssertTrue(state.reviewHistory.isEmpty)
        let ratings: [RecallRating] = [.again, .hard, .good]
        for (index, rating) in ratings.enumerated() {
            state.rate(id, rating: rating, now: now.addingTimeInterval(Double(index * 600)))
        }
        XCTAssertEqual(state.reviewHistory.map(\.itemID), [id, id, id])
        XCTAssertEqual(state.reviewHistory.map(\.rating), ["again", "hard", "good"])
        XCTAssertEqual(state.reviewHistory.map(\.date), [now, now.addingTimeInterval(600), now.addingTimeInterval(1_200)])
    }

    func testHistorySupportsLegacyStateAndRejectsMalformedEvents() throws {
        let data = try JSONEncoder().encode(LearnerState())
        var object = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
        object.removeValue(forKey: "reviewHistory")
        let legacy = try JSONSerialization.data(withJSONObject: object)
        XCTAssertTrue(try JSONDecoder().decode(LearnerState.self, from: legacy).reviewHistory.isEmpty)
        object["reviewHistory"] = [["itemID": "bad-event"]]
        let malformed = try JSONSerialization.data(withJSONObject: object)
        XCTAssertThrowsError(try JSONDecoder().decode(LearnerState.self, from: malformed))
    }

    func testNewItemsComeFromNextIncompleteLessonOnly() {
        var state = LearnerState(newItemsPerDay: 20)
        XCTAssertEqual(DailyPlan(state: state, now: now).newItems, Course.lessons[0].items)
        state.completeLesson(1)
        let plan = DailyPlan(state: state, now: now)
        XCTAssertEqual(plan.lesson.id, 2)
        XCTAssertEqual(plan.newItems, Course.lessons[1].items)
        XCTAssertEqual(plan.remainingNewItemBudget, 20)
    }

    func testAppointmentPreviewRecognitionConsumesBudgetWithoutSuccessfulRecalls() {
        var state = LearnerState()
        for item in Course.lessons[3].items {
            state.encounter(item.id, now: now)
            state.records[item.id]?.due = LearningCalendar.addDays(1, to: now)
        }
        let plan = DailyPlan(state: state, now: now)
        XCTAssertEqual(plan.lesson.id, 1)
        XCTAssertEqual(plan.remainingNewItemBudget, 0)
        XCTAssertTrue(plan.newItems.isEmpty)
        XCTAssertTrue(plan.due.isEmpty)
        XCTAssertTrue(state.reviewHistory.isEmpty)
        XCTAssertEqual(state.records.values.map(\.successfulRecalls), Array(repeating: 0, count: 5))
    }

    func testPreviewBudgetDoesNotDependOnUnfinishedLessonHavingUnseenItems() {
        var state = LearnerState()
        let yesterday = LearningCalendar.addDays(-1, to: now)
        for item in Course.lessons[0].items { state.encounter(item.id, now: yesterday) }
        let plan = DailyPlan(state: state, now: now)
        XCTAssertEqual(plan.lesson.id, 1)
        XCTAssertTrue(plan.newItems.isEmpty)
        XCTAssertEqual(plan.remainingNewItemBudget, 5)
    }

    func testBudgetChangesAtLocalMidnight() throws {
        let start = LearningCalendar.calendar.startOfDay(for: now)
        let nextDay = LearningCalendar.addDays(1, to: start)
        let beforeMidnight = nextDay.addingTimeInterval(-1)
        var state = LearnerState(newItemsPerDay: 1)
        state.encounter(Course.items[0].id, now: beforeMidnight)
        XCTAssertTrue(DailyPlan(state: state, now: beforeMidnight).newItems.isEmpty)
        XCTAssertEqual(DailyPlan(state: state, now: nextDay).newItems.count, 1)
        XCTAssertEqual(state.activity[LearningCalendar.dayKey(beforeMidnight)], 1)
        XCTAssertNil(state.activity[LearningCalendar.dayKey(nextDay)])
    }

    func testMissedReviewsDoNotEraseKnowledgeOrCreateLapses() throws {
        let id = Course.items[0].id
        var state = LearnerState()
        state.rate(id, rating: .good, now: now)
        state.rate(id, rating: .good, now: LearningCalendar.addDays(1, to: now))
        let oldProgress = try XCTUnwrap(state.records[id])
        let later = LearningCalendar.addDays(60, to: now)
        XCTAssertEqual(DailyPlan(state: state, now: later).due.map(\.id), [id])
        XCTAssertEqual(state.records[id], oldProgress)
        state.rate(id, rating: .good, now: later)
        XCTAssertEqual(state.records[id]?.intervalDays, 7)
        XCTAssertEqual(state.records[id]?.successfulRecalls, 3)
        XCTAssertEqual(state.records[id]?.lapses, 0)
        XCTAssertEqual(state.records[id]?.due, LearningCalendar.addDays(7, to: later))
    }

    func testBacklogIsCappedOldestFirstWithOverflowCount() {
        var state = LearnerState()
        for (index, item) in Course.items.prefix(25).enumerated() {
            state.records[item.id] = ItemProgress(encountered: true, due: now.addingTimeInterval(Double(-index * 100)))
        }
        let plan = DailyPlan(state: state, now: now)
        XCTAssertEqual(plan.due.map(\.id), Course.items.prefix(25).reversed().prefix(20).map(\.id))
        XCTAssertEqual(plan.backlogCount, 5)
        XCTAssertTrue(plan.newItems.isEmpty)
    }

    func testExactlyFullQueueReducesNewBudget() {
        var state = LearnerState()
        for item in Course.items.prefix(20) {
            state.records[item.id] = ItemProgress(encountered: true, due: now)
        }
        XCTAssertEqual(DailyPlan(state: state, now: now).backlogCount, 0)
        XCTAssertTrue(DailyPlan(state: state, now: now).newItems.isEmpty)
        state.records.removeValue(forKey: Course.items[0].id)
        XCTAssertEqual(DailyPlan(state: state, now: now).remainingNewItemBudget, 5)
        XCTAssertEqual(DailyPlan(state: state, now: now).newItems.count, 1)
    }

    func testDueFilteringAndStableTieOrder() {
        var state = LearnerState()
        let items = Array(Course.items.prefix(5))
        state.records[items[0].id] = ItemProgress(encountered: true, due: now)
        state.records[items[1].id] = ItemProgress(encountered: true, due: now)
        state.records[items[2].id] = ItemProgress(encountered: true, due: now.addingTimeInterval(1))
        state.records[items[3].id] = ItemProgress(encountered: true)
        state.records[items[4].id] = ItemProgress(encountered: false, due: now)
        state.records["unknown"] = ItemProgress(encountered: true, due: now)
        XCTAssertEqual(DailyPlan(state: state, now: now).due.map(\.id), items.prefix(2).map(\.id).sorted())
    }

    func testLessonsAdvanceIdempotentlyAndFallBackToReview() {
        var state = LearnerState()
        XCTAssertEqual(DailyPlan(state: state, now: now).lesson.id, 1)
        state.completeLesson(1)
        state.completeLesson(1)
        XCTAssertEqual(state.completedLessons, [1])
        XCTAssertEqual(DailyPlan(state: state, now: now).lesson.id, 2)
        for lesson in Course.lessons { state.completeLesson(lesson.id) }
        XCTAssertEqual(DailyPlan(state: state, now: now).lesson.id, 7)
    }

    func testNotesDoNotEncounterAndSurviveReview() throws {
        let id = Course.items[0].id
        var state = LearnerState()
        state.setNote("Remember: Grüße 👋", for: id)
        XCTAssertFalse(try XCTUnwrap(state.records[id]).encountered)
        XCTAssertTrue(state.activity.isEmpty)
        XCTAssertEqual(DailyPlan(state: state, now: now).newItems.count, 5)
        state.rate(id, rating: .good, now: now)
        state.rate(id, rating: .again, now: now)
        XCTAssertEqual(state.records[id]?.note, "Remember: Grüße 👋")
        state.setNote("", for: id)
        XCTAssertEqual(state.records[id]?.note, "")
        XCTAssertEqual(state.records[id]?.successfulRecalls, 1)
    }

    func testPersistenceCreatesDirectoryAndRoundTripsUpdates() throws {
        let directory = scratchDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = LocalStore(directory: directory.appendingPathComponent("nested"))
        XCTAssertEqual(try store.load(), LearnerState())
        var state = LearnerState(onboardingComplete: true, newItemsPerDay: 3, targetMinutes: 20)
        state.rate(Course.items[0].id, rating: .good, now: now)
        state.setNote("Übermorgen", for: Course.items[0].id)
        state.completeLesson(1)
        try store.save(state)
        XCTAssertEqual(try store.load(), state)
        XCTAssertEqual(try store.load().reviewHistory, [
            ReviewEvent(itemID: Course.items[0].id, date: now, rating: "good")
        ])
        state.targetMinutes = 40
        try store.save(state)
        XCTAssertEqual(try store.load(), state)
        let files = try FileManager.default.contentsOfDirectory(atPath: store.directory.path)
        XCTAssertEqual(files, ["learner-state.json"])
    }

    func testCorruptPersistenceThrowsAndCannotBeOverwritten() throws {
        let directory = scratchDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        let data = Data("{ corrupt".utf8)
        let file = directory.appendingPathComponent("learner-state.json")
        try data.write(to: file)
        let store = LocalStore(directory: directory)
        XCTAssertThrowsError(try store.load())
        XCTAssertThrowsError(try store.save(LearnerState()))
        XCTAssertEqual(try Data(contentsOf: file), data)
    }

    func testStructurallyInvalidPersistenceThrows() throws {
        let directory = scratchDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        try Data(#"{"newItemsPerDay":"five"}"#.utf8)
            .write(to: directory.appendingPathComponent("learner-state.json"))
        XCTAssertThrowsError(try LocalStore(directory: directory).load())
    }

    func testSavingToAFileInsteadOfADirectoryThrows() throws {
        let directory = scratchDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        let file = directory.appendingPathComponent("not-a-directory")
        try Data("keep this file".utf8).write(to: file)
        XCTAssertThrowsError(try LocalStore(directory: file).save(LearnerState()))
        XCTAssertEqual(try String(contentsOf: file, encoding: .utf8), "keep this file")
    }

    func testVocabularyAndLessonsRoundTripThroughCodable() throws {
        let encoded = try JSONEncoder().encode(Course.lessons)
        XCTAssertEqual(try JSONDecoder().decode([Lesson].self, from: encoded), Course.lessons)
    }

    func testAnswerMatcherAcceptsGermanEquivalentsAndFormatting() {
        XCTAssertTrue(AnswerMatcher.matches("  KÖNNEN   Sie mir helfen?!\n", accepted: ["Können Sie mir helfen?"]))
        XCTAssertTrue(AnswerMatcher.matches("Koennen Sie mir helfen", accepted: ["Können Sie mir helfen?"]))
        XCTAssertTrue(AnswerMatcher.matches("STRASSE", accepted: ["Straße"]))
        XCTAssertTrue(AnswerMatcher.matches("gro\u{308}sser", accepted: ["größer"]))
        XCTAssertTrue(AnswerMatcher.matches("FUESSE", accepted: ["Füße"]))
        XCTAssertTrue(AnswerMatcher.matches("Ich heisse Anna.", accepted: ["Ich heiße Anna"]))
    }

    func testAnswerMatcherRejectsSubstringsWrongWordsAndEmptyInput() {
        XCTAssertFalse(AnswerMatcher.matches("Termin", accepted: ["der Termin"]))
        XCTAssertFalse(AnswerMatcher.matches("Ich habe einen Termin", accepted: ["Termin"]))
        XCTAssertFalse(AnswerMatcher.matches("konnen Sie helfen", accepted: ["können Sie helfen"]))
        XCTAssertFalse(AnswerMatcher.matches("Zeit", accepted: ["Zeit haben"]))
        XCTAssertFalse(AnswerMatcher.matches("  ?! ", accepted: [""]))
        XCTAssertFalse(AnswerMatcher.matches("Hallo", accepted: []))
        XCTAssertFalse(AnswerMatcher.matches("Z e i t", accepted: ["Zeit"]))
    }

    func testContentHasSixThemedLessonsAndReviewReusesCanonicalItems() {
        XCTAssertEqual(Course.lessons.map(\.id), Array(1...7))
        XCTAssertEqual(Course.items.count, 30)
        XCTAssertEqual(Set(Course.items.map(\.id)).count, Course.items.count)
        for lesson in Course.lessons.prefix(6) {
            XCTAssertTrue((4...6).contains(lesson.items.count))
            XCTAssertFalse(lesson.title.isEmpty)
            XCTAssertFalse(lesson.goal.isEmpty)
        }
        let required = ["der Termin (die Termine)", "einen Termin vereinbaren", "verschieben", "Zeit haben", "Es passt mir."]
        XCTAssertEqual(Course.lessons[3].items.map(\.german), required)
        let originals = Dictionary(uniqueKeysWithValues: Course.items.map { ($0.id, $0) })
        XCTAssertFalse(Course.lessons[6].items.isEmpty)
        for item in Course.lessons[6].items { XCTAssertEqual(item, originals[item.id]) }
        for item in Course.items {
            for value in [item.id, item.german, item.english, item.example, item.translation, item.cue] {
                XCTAssertFalse(value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            XCTAssertFalse(item.answers.isEmpty)
            for answer in item.answers {
                XCTAssertTrue(AnswerMatcher.matches(answer, accepted: item.answers))
            }
        }
    }

    private func scratchDirectory() -> URL {
        URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            .appendingPathComponent(".build/test-data/\(UUID().uuidString)", isDirectory: true)
    }
}
