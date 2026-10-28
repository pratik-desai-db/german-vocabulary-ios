import XCTest
import LearningCore

final class PreparedPracticeTests: XCTestCase {
    func testEveryFirstWeekLessonHasCompleteStablePractice() {
        var pathIDs = Set<String>()
        var turnIDs = Set<String>()

        for lessonID in 1...7 {
            let paths = PreparedPractice.paths(for: lessonID)
            XCTAssertFalse(paths.isEmpty, "Missing lesson \(lessonID)")
            XCTAssertEqual(paths, PreparedPractice.paths(for: lessonID))

            for path in paths {
                XCTAssertFalse(path.id.isEmpty)
                XCTAssertTrue(pathIDs.insert(path.id).inserted, "Duplicate path \(path.id)")
                assertNotBlank(path.title)
                XCTAssertGreaterThanOrEqual(path.turns.count, 4)
                XCTAssertTrue(path.turns[0].id.hasSuffix(".repeat"))
                XCTAssertTrue(path.turns[1].id.hasSuffix(".guided"))
                XCTAssertTrue(path.turns[2].id.hasSuffix(".recall"))

                for turn in path.turns {
                    XCTAssertFalse(turn.id.isEmpty)
                    XCTAssertTrue(turnIDs.insert(turn.id).inserted, "Duplicate turn \(turn.id)")
                    assertNotBlank(turn.title)
                    assertNotBlank(turn.partner)
                    assertNotBlank(turn.partnerTranslation)
                    XCTAssertFalse(turn.partner.contains("("), "Spoken line contains a translation: \(turn.id)")
                    XCTAssertFalse(turn.partner.contains("At the station:"))
                    XCTAssertFalse(turn.partner.contains("On the phone:"))
                    assertNotBlank(turn.task)
                    assertNotBlank(turn.hint)
                    XCTAssertGreaterThanOrEqual(turn.suggestions.count, 2)
                    for suggestion in turn.suggestions {
                        assertNotBlank(suggestion)
                    }
                }
            }
        }
    }

    func testEachNonAppointmentLessonEndsWithIndependentPractice() throws {
        for lessonID in [1, 2, 3, 5, 6] {
            let path = try XCTUnwrap(PreparedPractice.paths(for: lessonID).first)
            XCTAssertTrue(try XCTUnwrap(path.turns.last).id.hasSuffix(".roleplay"))
        }
    }

    func testAppointmentPathsHaveFullProgressionAndAccurateTerms() throws {
        let paths = PreparedPractice.paths(for: 4)
        XCTAssertEqual(paths.map(\.id), ["appointments.make", "appointments.change"])
        XCTAssertEqual(paths.map(\.title), ["Make an appointment", "Change an appointment"])

        for path in paths {
            XCTAssertEqual(
                path.turns.map { String($0.id.split(separator: ".").last!) },
                ["repeat", "guided", "recall", "receptionist", "choose-time", "confirm"]
            )
            XCTAssertTrue(path.turns[3].partner.contains("Praxis Müller"))
            XCTAssertTrue(path.turns[4].task.contains("Choose"))
            XCTAssertTrue(path.turns[5].task.contains("time you chose"))
            XCTAssertTrue(path.turns[5].task.contains("thank"))
        }

        let make = paths[0]
        XCTAssertTrue(make.turns[0].task.contains("einen Termin vereinbaren"))
        XCTAssertTrue(make.turns[0].task.contains("arrange an appointment"))
        XCTAssertTrue(make.turns[4].partner.contains("Dienstag um zehn Uhr"))
        XCTAssertTrue(make.turns[4].partner.contains("Donnerstag um elf Uhr"))
        XCTAssertEqual(make.turns[5].suggestions, [
            "Also am Dienstag um zehn Uhr. Vielen Dank! Auf Wiedersehen!",
            "Also am Donnerstag um elf Uhr. Vielen Dank! Auf Wiedersehen!"
        ])

        let change = paths[1]
        XCTAssertTrue(change.turns[0].task.contains("meinen Termin verschieben"))
        XCTAssertTrue(change.turns[0].task.contains("reschedule my appointment"))
        XCTAssertTrue(change.turns[1].suggestions.allSatisfy { $0.contains("auf Freitag verschieben") })
        XCTAssertTrue(change.turns[3].task.contains("Tuesday ten o'clock"))
        XCTAssertTrue(change.turns[4].partner.contains("Freitag"))
        XCTAssertTrue(change.turns[4].partner.contains("neun Uhr oder um elf Uhr"))
        XCTAssertTrue(change.turns[5].suggestions.allSatisfy { $0.contains("Freitag") && !$0.contains("Dienstag") })
    }

    func testReviewConnectsShoppingTravelAndRescheduling() throws {
        let review = try XCTUnwrap(PreparedPractice.paths(for: 7).first)
        XCTAssertGreaterThanOrEqual(review.turns.count, 5)
        XCTAssertTrue(review.turns[0].task.contains("ein Brot"))
        XCTAssertTrue(review.turns[1].task.contains("pay by card"))
        let transport = try XCTUnwrap(review.turns.first { $0.id.hasSuffix(".transport") })
        let requests = try XCTUnwrap(review.turns.first { $0.id.hasSuffix(".requests") })
        let appointment = try XCTUnwrap(review.turns.first { $0.id.hasSuffix(".appointment") })
        XCTAssertTrue(transport.task.contains("ticket to Berlin"))
        XCTAssertTrue(requests.partner.contains("Verspätung"))
        XCTAssertTrue(appointment.task.contains("delay"))
        XCTAssertTrue(appointment.task.contains("reschedule for Friday"))
        XCTAssertTrue(try XCTUnwrap(review.turns.last).partner.contains("Freitag um elf Uhr"))
    }

    func testUnknownLessonsHaveNoPreparedPaths() {
        for lessonID in [Int.min, -1, 0, 91, Int.max] {
            XCTAssertTrue(PreparedPractice.paths(for: lessonID).isEmpty)
        }
    }

    func testExtendedLessonsUseCurriculumPaths() throws {
        for lessonID in 8...90 {
            let day = try XCTUnwrap(Course.day(lessonID))
            XCTAssertFalse(day.paths.isEmpty, "Missing practice for day \(lessonID)")
            XCTAssertEqual(PreparedPractice.paths(for: lessonID), day.paths)
        }
    }

    func testPublicValueTypesCanBeConstructed() {
        let turn = PracticeTurn(
            id: "custom.repeat", title: "Repeat", partner: "Hallo!",
            task: "Say hello.", hint: "Use a greeting.", suggestions: ["Hallo!", "Guten Tag!"]
        )
        let path = PracticePath(id: "custom", title: "Custom practice", turns: [turn])
        XCTAssertEqual(path.turns, [turn])
        XCTAssertEqual(path.id, "custom")
        XCTAssertEqual(turn.partnerTranslation, "")
        let translated = PracticeTurn(
            id: "custom.translated", title: "Repeat", partner: "Hallo!", partnerTranslation: "Hello!",
            task: "Say hello.", hint: "Use a greeting.", suggestions: ["Hallo!", "Guten Tag!"]
        )
        XCTAssertEqual(translated.partnerTranslation, "Hello!")
    }

    private func assertNotBlank(_ value: String, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertFalse(value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, file: file, line: line)
    }
}
