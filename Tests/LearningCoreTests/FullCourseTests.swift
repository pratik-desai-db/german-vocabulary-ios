import Foundation
import XCTest
@testable import LearningCore

final class FullCourseTests: XCTestCase {
    func testSpokenGermanExcludesDisplayOnlyUsageAndPluralMetadata() {
        for (display, spoken) in [
            ("die Eltern (plural only)", "die Eltern"),
            ("das Öl (oils: Öle; usually uncountable)", "das Öl"),
            ("der Termin (die Termine)", "der Termin"),
            ("Ich hätte gern …", "Ich hätte gern …")
        ] {
            let item = Vocabulary(id: "test", german: display, english: "test", example: "test",
                                  translation: "test", cue: "test", answers: [spoken])
            XCTAssertEqual(item.spokenGerman, spoken)
            XCTAssertEqual(item.german, display)
            XCTAssertFalse(item.spokenGerman.contains("("))
        }
        for item in Course.items { XCTAssertFalse(item.spokenGerman.contains("(")) }
    }

    func testNinetyOrderedDaysAndThirteenWeeks() {
        XCTAssertEqual(Course.totalDays, 90)
        XCTAssertEqual(Course.lessons.map(\.id), Array(1...90))
        XCTAssertEqual(Course.weeks.map(\.id), Array(1...13))
        XCTAssertEqual(Course.weeks.flatMap(\.days), Course.lessons)
        XCTAssertEqual(Course.weeks.dropLast().map { $0.days.count }, Array(repeating: 7, count: 12))
        XCTAssertEqual(Course.weeks.last?.days.map(\.id), Array(85...90))
        for week in Course.weeks { XCTAssertFalse(week.title.isEmpty) }
        XCTAssertEqual(CourseWeek(id: 1, title: "Week 1", days: Array(Course.lessons.prefix(7))),
                       Course.weeks[0])
    }

    func testCanonicalInventoryAndReviewSchedule() {
        XCTAssertEqual(Course.items.count, 385)
        XCTAssertEqual(Set(Course.items.map(\.id)).count, 385)
        var known = [String: Vocabulary]()
        var ordered = [Vocabulary]()
        for lesson in Course.lessons {
            XCTAssertEqual(Set(lesson.items.map(\.id)).count, lesson.items.count)
            if lesson.id.isMultiple(of: 7) || lesson.id == 90 {
                XCTAssertFalse(lesson.items.isEmpty, "Empty review day \(lesson.id)")
                for item in lesson.items {
                    XCTAssertEqual(item, known[item.id], "Review introduced or changed \(item.id)")
                }
            } else {
                XCTAssertEqual(lesson.items.count, 5, "Day \(lesson.id) needs five new items")
                for item in lesson.items {
                    XCTAssertNil(known[item.id], "Learning day reused \(item.id)")
                }
            }
            for item in lesson.items where known[item.id] == nil {
                known[item.id] = item
                ordered.append(item)
            }
        }
        XCTAssertEqual(Course.items, ordered)
    }

    func testFoundationIDsAndCanonicalContentStayStable() {
        let expected = [
            "intro.hallo", "intro.name", "intro.origin", "intro.pleased", "intro.goodbye",
            "routine.get-up", "routine.breakfast", "routine.work", "routine.everyday", "routine.evening",
            "shopping.want", "shopping.cost", "shopping.bag", "shopping.card", "shopping.receipt",
            "appointments.termin", "appointments.arrange", "appointments.reschedule", "appointments.time", "appointments.suits",
            "transport.station", "transport.ticket", "transport.change", "transport.platform", "transport.delay",
            "requests.help", "requests.repeat", "requests.slow", "requests.understand", "requests.thanks"
        ]
        XCTAssertEqual(Course.items.prefix(30).map(\.id), expected)
        XCTAssertEqual(Course.lessons[6].items.map(\.id), [
            "intro.name", "routine.everyday", "shopping.want", "appointments.arrange",
            "transport.change", "requests.help"
        ])
        XCTAssertEqual(Course.items[0], Vocabulary(
            id: "intro.hallo", german: "Hallo!", english: "Hello!",
            example: "Hallo! Wie geht es dir?", translation: "Hello! How are you?",
            cue: "Greet someone informally.", answers: ["Hallo"]))
        XCTAssertEqual(Course.items[29], Vocabulary(
            id: "requests.thanks", german: "Vielen Dank!", english: "Thank you very much!",
            example: "Vielen Dank für Ihre Hilfe!", translation: "Thank you very much for your help!",
            cue: "Say: Thank you very much!", answers: ["Vielen Dank", "Danke schön", "Dankeschön"]))
    }

    func testEveryDayHasSubstantialWorkbookAndPreparedSpeaking() throws {
        var pathIDs = Set<String>()
        var turnIDs = Set<String>()
        for lesson in Course.lessons {
            let day = try XCTUnwrap(Course.day(lesson.id))
            XCTAssertEqual(day.lesson, lesson)
            for text in [lesson.title, lesson.goal, day.grammar, day.reading.german, day.reading.english,
                         day.reading.question, day.reading.answer, day.writing.prompt, day.writing.model] {
                XCTAssertFalse(text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                               "Blank content for day \(lesson.id)")
            }
            XCTAssertGreaterThanOrEqual(sentenceCount(day.reading.german), 3, "Short reading on day \(lesson.id)")
            XCTAssertGreaterThanOrEqual(sentenceCount(day.reading.english), 3, "Short translation on day \(lesson.id)")
            XCTAssertGreaterThanOrEqual(day.writing.checklist.count, 3, "Short checklist on day \(lesson.id)")
            XCTAssertTrue(day.writing.checklist.allSatisfy { !$0.isEmpty })
            let paths = PreparedPractice.paths(for: lesson.id)
            XCTAssertFalse(paths.isEmpty, "Missing speaking on day \(lesson.id)")
            for path in paths {
                XCTAssertTrue(pathIDs.insert(path.id).inserted, "Duplicate path \(path.id)")
                XCTAssertGreaterThanOrEqual(path.turns.count, 4)
                for turn in path.turns {
                    XCTAssertTrue(turnIDs.insert(turn.id).inserted, "Duplicate turn \(turn.id)")
                    for text in [turn.title, turn.partner, turn.partnerTranslation, turn.task, turn.hint] {
                        XCTAssertFalse(text.isEmpty)
                    }
                    XCTAssertFalse(turn.suggestions.isEmpty)
                    XCTAssertTrue(turn.suggestions.allSatisfy { !$0.isEmpty })
                }
            }
        }
        for id in [Int.min, -1, 0, 91, Int.max] { XCTAssertNil(Course.day(id)) }
    }

    func testWorkbookRoundTripPreservesAllProgressAndOtherDays() throws {
        let now = Date(timeIntervalSince1970: 1_798_459_200)
        var state = LearnerState(onboardingComplete: true, newItemsPerDay: 3, targetMinutes: 25)
        let itemID = Course.items[0].id
        state.rate(itemID, rating: .good, now: now)
        state.setNote("Remember the greeting", for: itemID)
        state.completeLesson(1)
        let before = state
        let first = LessonWork(readingResponse: "Anna kommt aus Kanada.", writingDraft: "Hallo! Ich heiße Zoë.",
                               readingChecked: true, writingChecked: true, speakingPracticed: true)
        let last = LessonWork(readingResponse: "Meine Antwort", writingDraft: "Mein Entwurf")
        state.updateWork(first, for: 1)
        state.updateWork(last, for: 90)
        XCTAssertEqual(state.workbook, [1: first, 90: last])
        XCTAssertEqual(state.records, before.records)
        XCTAssertEqual(state.activity, before.activity)
        XCTAssertEqual(state.reviewHistory, before.reviewHistory)
        XCTAssertEqual(state.completedLessons, before.completedLessons)
        XCTAssertEqual(state.onboardingComplete, before.onboardingComplete)
        XCTAssertEqual(state.newItemsPerDay, before.newItemsPerDay)
        XCTAssertEqual(state.targetMinutes, before.targetMinutes)
        let restored = try JSONDecoder().decode(LearnerState.self, from: JSONEncoder().encode(state))
        XCTAssertEqual(restored, state)
        state.updateWork(LessonWork(), for: 1)
        XCTAssertEqual(state.workbook[90], last)
        XCTAssertEqual(state.records[itemID]?.successfulRecalls, 1)
        XCTAssertEqual(state.records[itemID]?.lapses, 0)
    }

    func testLegacyStateMigrationWithAndWithoutReviewHistory() throws {
        let oldRecord = ItemProgress(encountered: true, successfulRecalls: 2, lapses: 1, note: "Keep me",
                                     due: Date(timeIntervalSince1970: 1_798_459_200), intervalDays: 3)
        let original = LearnerState(onboardingComplete: true, records: ["intro.hallo": oldRecord],
                                    completedLessons: [1, 7], activity: ["2026-10-28": 2],
                                    reviewHistory: [ReviewEvent(itemID: "intro.hallo", date: oldRecord.due!, rating: "good")])
        var object = try XCTUnwrap(JSONSerialization.jsonObject(with: JSONEncoder().encode(original)) as? [String: Any])
        object.removeValue(forKey: "workbook")
        let migrated = try JSONDecoder().decode(LearnerState.self, from: JSONSerialization.data(withJSONObject: object))
        XCTAssertEqual(migrated, original)
        XCTAssertTrue(migrated.workbook.isEmpty)
        object.removeValue(forKey: "reviewHistory")
        let older = try JSONDecoder().decode(LearnerState.self, from: JSONSerialization.data(withJSONObject: object))
        var expected = original
        expected.reviewHistory = []
        XCTAssertEqual(older, expected)
        object["workbook"] = ["1": ["writingDraft": 7]]
        XCTAssertThrowsError(try JSONDecoder().decode(LearnerState.self, from: JSONSerialization.data(withJSONObject: object)))
    }

    func testCompletionRequiresEncounterAndEachWorkbookCheckWithoutAwardingRecall() {
        let now = Date(timeIntervalSince1970: 1_798_459_200)
        var state = LearnerState()
        XCTAssertFalse(state.canCompleteLesson(1))
        var work = LessonWork(readingResponse: "Answer", writingDraft: "Draft",
                              readingChecked: true, writingChecked: true, speakingPracticed: true)
        state.updateWork(work, for: 1)
        XCTAssertFalse(state.canCompleteLesson(1))
        for item in Course.lessons[0].items.dropLast() { state.encounter(item.id, now: now) }
        XCTAssertFalse(state.canCompleteLesson(1))
        state.encounter(Course.lessons[0].items.last!.id, now: now)
        XCTAssertTrue(state.canCompleteLesson(1))
        work.readingResponse = " \n"
        state.updateWork(work, for: 1)
        XCTAssertFalse(state.canCompleteLesson(1))
        work.readingResponse = "Answer"
        work.writingDraft = "\t "
        state.updateWork(work, for: 1)
        XCTAssertFalse(state.canCompleteLesson(1))
        for unchecked in 0..<3 {
            work = LessonWork(readingResponse: "Answer", writingDraft: "Draft",
                              readingChecked: unchecked != 0, writingChecked: unchecked != 1,
                              speakingPracticed: unchecked != 2)
            state.updateWork(work, for: 1)
            XCTAssertFalse(state.canCompleteLesson(1))
        }
        XCTAssertTrue(state.completedLessons.isEmpty)
        XCTAssertTrue(state.reviewHistory.isEmpty)
        XCTAssertTrue(state.records.values.allSatisfy { $0.successfulRecalls == 0 && $0.lapses == 0 })
        for id in [0, 91] { XCTAssertFalse(state.canCompleteLesson(id)) }
        state.completeLesson(1)
        XCTAssertEqual(state.completedLessons, [1], "Planner callers can still force completion")
    }

    func testReviewCompletionReusesEncounteredCanonicalRecords() {
        var state = LearnerState()
        for item in Course.items { state.encounter(item.id) }
        let before = state.records
        for id in [7, 14, 90] {
            state.updateWork(LessonWork(readingResponse: "Answer", writingDraft: "Draft", readingChecked: true,
                                       writingChecked: true, speakingPracticed: true), for: id)
            XCTAssertTrue(state.canCompleteLesson(id))
        }
        XCTAssertEqual(state.records, before)
        XCTAssertTrue(state.reviewHistory.isEmpty)
    }

    func testDefaultPaceCanCompleteAndPersistAllNinetyDays() throws {
        let start = Date(timeIntervalSince1970: 1_798_459_200)
        var state = LearnerState()
        var firstWeekRecords = [String: ItemProgress]()
        for id in 1...90 {
            let now = LearningCalendar.addDays(id - 1, to: start)
            XCTAssertEqual(DailyPlan(state: state, now: now).lesson.id, id)
            while !DailyPlan(state: state, now: now).due.isEmpty {
                for item in DailyPlan(state: state, now: now).due {
                    state.rate(item.id, rating: .good, now: now)
                }
            }
            let plan = DailyPlan(state: state, now: now)
            let isReview = id.isMultiple(of: 7) || id == 90
            XCTAssertEqual(plan.newItems.count, isReview ? 0 : 5, "Unexpected new items on day \(id)")
            for item in plan.newItems { state.encounter(item.id, now: now) }
            XCTAssertFalse(state.canCompleteLesson(id))
            let day = try XCTUnwrap(Course.day(id))
            state.updateWork(LessonWork(readingResponse: day.reading.answer, writingDraft: day.writing.model,
                                       readingChecked: true, writingChecked: true, speakingPracticed: true), for: id)
            XCTAssertTrue(state.canCompleteLesson(id), "Cannot finish day \(id)")
            state.completeLesson(id)
            XCTAssertEqual(DailyPlan(state: state, now: now).lesson.id, min(id + 1, 90))
            if id == 7 {
                firstWeekRecords = state.records
                XCTAssertEqual(firstWeekRecords.count, 30)
            }
            state = try JSONDecoder().decode(LearnerState.self, from: JSONEncoder().encode(state))
            XCTAssertEqual(state.workbook.count, id)
            XCTAssertEqual(state.completedLessons, Array(1...id))
        }
        XCTAssertEqual(state.records.count, 385)
        XCTAssertEqual(Set(state.records.keys), Set(Course.items.map(\.id)))
        for (id, original) in firstWeekRecords {
            let restored = try XCTUnwrap(state.records[id])
            XCTAssertTrue(restored.encountered)
            XCTAssertEqual(restored.firstEncounteredAt, original.firstEncounteredAt)
            XCTAssertGreaterThanOrEqual(restored.successfulRecalls, original.successfulRecalls)
            XCTAssertEqual(restored.lapses, 0)
        }
        XCTAssertEqual(DailyPlan(state: state, now: LearningCalendar.addDays(90, to: start)).lesson.id, 90)
    }

    private func sentenceCount(_ text: String) -> Int {
        text.split(whereSeparator: { ".!?".contains($0) }).filter {
            !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }.count
    }
}
