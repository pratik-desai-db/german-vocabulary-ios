import Foundation
import XCTest
@testable import LearningCore

final class SupportedPracticeTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_798_459_200)

    func testPracticeEncountersNewItemWithoutSuccessfulRecallOrLapse() throws {
        let id = Course.items[0].id
        var state = LearnerState()

        state.practice(id, now: now)

        let progress = try XCTUnwrap(state.records[id])
        XCTAssertTrue(progress.encountered)
        XCTAssertEqual(progress.firstEncounteredAt, now)
        XCTAssertEqual(progress.successfulRecalls, 0)
        XCTAssertEqual(progress.lapses, 0)
        XCTAssertEqual(progress.intervalDays, 0)
        XCTAssertEqual(progress.due, now.addingTimeInterval(600))
        XCTAssertEqual(state.activity[LearningCalendar.dayKey(now)], 2)
        XCTAssertEqual(DailyPlan(state: state, now: now).remainingNewItemBudget, 4)
        XCTAssertTrue(DailyPlan(state: state, now: now.addingTimeInterval(599)).due.isEmpty)
        XCTAssertEqual(DailyPlan(state: state, now: now.addingTimeInterval(600)).due.map(\.id), [id])
    }

    func testPracticeDelaysOldLearnedItemWithoutChangingKnowledge() throws {
        let id = Course.items[0].id
        let firstEncounter = LearningCalendar.addDays(-90, to: now)
        let original = ItemProgress(
            encountered: true, successfulRecalls: 8, lapses: 2,
            note: "Keep this note", due: LearningCalendar.addDays(-30, to: now),
            intervalDays: 17, firstEncounteredAt: firstEncounter
        )
        var state = LearnerState(records: [id: original])
        XCTAssertEqual(DailyPlan(state: state, now: now).due.map(\.id), [id])

        state.practice(id, now: now)

        var expected = original
        expected.due = now.addingTimeInterval(600)
        XCTAssertEqual(state.records[id], expected)
        XCTAssertEqual(state.activity[LearningCalendar.dayKey(now)], 1)
        XCTAssertTrue(DailyPlan(state: state, now: now).due.isEmpty)
        XCTAssertEqual(DailyPlan(state: state, now: now.addingTimeInterval(600)).due.map(\.id), [id])
    }

    func testRepeatedPracticeRecordsHistoryAndActivityWithoutInflatingKnowledge() {
        let id = Course.items[0].id
        let later = now.addingTimeInterval(120)
        var state = LearnerState()
        state.encounter(id, now: now)

        state.practice(id, now: now)
        state.practice(id, now: later)

        XCTAssertEqual(state.records[id]?.firstEncounteredAt, now)
        XCTAssertEqual(state.records[id]?.successfulRecalls, 0)
        XCTAssertEqual(state.records[id]?.lapses, 0)
        XCTAssertEqual(state.records[id]?.intervalDays, 0)
        XCTAssertEqual(state.records[id]?.due, later.addingTimeInterval(600))
        XCTAssertEqual(state.reviewHistory, [
            ReviewEvent(itemID: id, date: now, rating: "practice"),
            ReviewEvent(itemID: id, date: later, rating: "practice")
        ])
        XCTAssertEqual(state.activity[LearningCalendar.dayKey(now)], 3)
    }

    func testPracticePreservesExistingIndependentRatingBehavior() {
        let id = Course.items[0].id
        var state = LearnerState()
        state.rate(id, rating: .good, now: now)
        state.practice(id, now: now)
        state.rate(id, rating: .hard, now: now)
        XCTAssertEqual(state.records[id]?.successfulRecalls, 2)
        XCTAssertEqual(state.records[id]?.intervalDays, 1)
        state.rate(id, rating: .again, now: now)
        XCTAssertEqual(state.records[id]?.successfulRecalls, 2)
        XCTAssertEqual(state.records[id]?.lapses, 1)
        XCTAssertEqual(state.records[id]?.intervalDays, 0)
        XCTAssertEqual(state.records[id]?.due, now.addingTimeInterval(600))
        XCTAssertEqual(state.reviewHistory.map(\.rating), ["good", "practice", "hard", "again"])
    }

    func testPracticeRoundTripsUsingExistingPersistedFields() throws {
        let id = Course.items[0].id
        var state = LearnerState()
        state.rate(id, rating: .good, now: now)
        state.practice(id, now: now.addingTimeInterval(60))

        let data = try JSONEncoder().encode(state)
        let restored = try JSONDecoder().decode(LearnerState.self, from: data)

        XCTAssertEqual(restored, state)
        XCTAssertEqual(restored.reviewHistory.last?.rating, "practice")
        let object = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
        XCTAssertEqual(Set(object.keys), [
            "onboardingComplete", "newItemsPerDay", "targetMinutes", "records",
            "completedLessons", "activity", "reviewHistory"
        ])
    }

    func testPracticeSupportsLegacyStateWithoutReviewHistory() throws {
        let data = try JSONEncoder().encode(LearnerState())
        var object = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
        object.removeValue(forKey: "reviewHistory")
        var state = try JSONDecoder().decode(
            LearnerState.self, from: JSONSerialization.data(withJSONObject: object)
        )

        state.practice(Course.items[0].id, now: now)

        XCTAssertEqual(state.reviewHistory, [
            ReviewEvent(itemID: Course.items[0].id, date: now, rating: "practice")
        ])
    }

    func testRepeatedEncounterDoesNotDelayReviewOrRecordPractice() {
        let id = Course.items[0].id
        var state = LearnerState()
        state.encounter(id, now: now)
        let encountered = state

        state.encounter(id, now: now.addingTimeInterval(300))

        XCTAssertEqual(state, encountered)
        XCTAssertEqual(state.records[id]?.due, now)
        XCTAssertTrue(state.reviewHistory.isEmpty)

        state.practice(id, now: now)
        let practiced = state
        state.encounter(id, now: now.addingTimeInterval(900))
        XCTAssertEqual(state, practiced)
    }
}
