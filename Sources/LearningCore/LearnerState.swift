import Foundation

public struct ItemProgress: Codable, Sendable, Equatable {
    public var encountered: Bool
    public var successfulRecalls: Int
    public var lapses: Int
    public var note: String
    public var due: Date?
    public var intervalDays: Int
    public var firstEncounteredAt: Date?

    public init(
        encountered: Bool = false, successfulRecalls: Int = 0, lapses: Int = 0,
        note: String = "", due: Date? = nil, intervalDays: Int = 0,
        firstEncounteredAt: Date? = nil
    ) {
        self.encountered = encountered
        self.successfulRecalls = successfulRecalls
        self.lapses = lapses
        self.note = note
        self.due = due
        self.intervalDays = intervalDays
        self.firstEncounteredAt = firstEncounteredAt
    }
}

public enum RecallRating: String, Codable, Sendable {
    case again, hard, good
}

public struct ReviewEvent: Codable, Sendable, Equatable {
    public let itemID: String
    public let date: Date
    public let rating: String

    public init(itemID: String, date: Date, rating: String) {
        self.itemID = itemID
        self.date = date
        self.rating = rating
    }
}

public struct LearnerState: Codable, Sendable, Equatable {
    public var onboardingComplete: Bool
    public var newItemsPerDay: Int
    public var targetMinutes: Int
    public var records: [String: ItemProgress]
    public var completedLessons: [Int]
    public var activity: [String: Int]
    public var reviewHistory: [ReviewEvent]

    public init(
        onboardingComplete: Bool = false, newItemsPerDay: Int = 5, targetMinutes: Int = 35,
        records: [String: ItemProgress] = [:], completedLessons: [Int] = [],
        activity: [String: Int] = [:], reviewHistory: [ReviewEvent] = []
    ) {
        self.onboardingComplete = onboardingComplete
        self.newItemsPerDay = newItemsPerDay
        self.targetMinutes = targetMinutes
        self.records = records
        self.completedLessons = completedLessons
        self.activity = activity
        self.reviewHistory = reviewHistory
    }

    private enum CodingKeys: String, CodingKey {
        case onboardingComplete, newItemsPerDay, targetMinutes, records, completedLessons, activity, reviewHistory
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        onboardingComplete = try container.decode(Bool.self, forKey: .onboardingComplete)
        newItemsPerDay = try container.decode(Int.self, forKey: .newItemsPerDay)
        targetMinutes = try container.decode(Int.self, forKey: .targetMinutes)
        records = try container.decode([String: ItemProgress].self, forKey: .records)
        completedLessons = try container.decode([Int].self, forKey: .completedLessons)
        activity = try container.decode([String: Int].self, forKey: .activity)
        reviewHistory = try container.decodeIfPresent([ReviewEvent].self, forKey: .reviewHistory) ?? []
    }

    /// Exposure is not retrieval: it starts scheduling without awarding a successful recall.
    public mutating func encounter(_ id: String, now: Date = Date()) {
        var progress = records[id] ?? ItemProgress()
        guard !progress.encountered else { return }
        progress.encountered = true
        progress.firstEncounteredAt = now
        progress.due = now
        records[id] = progress
        activity[LearningCalendar.dayKey(now), default: 0] += 1
    }

    /// Supported practice delays review without awarding independent recall or recording a lapse.
    public mutating func practice(_ id: String, now: Date = Date()) {
        encounter(id, now: now)
        records[id]!.due = now.addingTimeInterval(10 * 60)
        reviewHistory.append(ReviewEvent(itemID: id, date: now, rating: "practice"))
        activity[LearningCalendar.dayKey(now), default: 0] += 1
    }

    /// Award hard/good only for independent retrieval; supported failed attempts may use again.
    public mutating func rate(_ id: String, rating: RecallRating, now: Date = Date()) {
        encounter(id, now: now)
        var progress = records[id]!
        switch rating {
        case .again:
            progress.lapses += 1
            progress.intervalDays = 0
            progress.due = now.addingTimeInterval(10 * 60)
        case .hard:
            progress.successfulRecalls += 1
            progress.intervalDays = max(1, min(365, progress.intervalDays))
            progress.due = LearningCalendar.addDays(progress.intervalDays, to: now)
        case .good:
            progress.successfulRecalls += 1
            switch progress.intervalDays {
            case ...0: progress.intervalDays = 1
            case 1: progress.intervalDays = 3
            default: progress.intervalDays = min(365, Int((Double(min(progress.intervalDays, 365)) * 2.4).rounded()))
            }
            progress.due = LearningCalendar.addDays(progress.intervalDays, to: now)
        }
        records[id] = progress
        reviewHistory.append(ReviewEvent(itemID: id, date: now, rating: rating.rawValue))
        activity[LearningCalendar.dayKey(now), default: 0] += 1
    }

    public mutating func setNote(_ note: String, for id: String) {
        var progress = records[id] ?? ItemProgress()
        progress.note = note
        records[id] = progress
    }

    public mutating func completeLesson(_ id: Int) {
        guard !completedLessons.contains(id) else { return }
        completedLessons.append(id)
    }
}

enum LearningCalendar {
    static var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .current
        return calendar
    }

    static func dayKey(_ date: Date) -> String {
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return String(format: "%04d-%02d-%02d", components.year!, components.month!, components.day!)
    }

    static func addDays(_ days: Int, to date: Date) -> Date {
        calendar.date(byAdding: .day, value: days, to: date)!
    }
}

public struct DailyPlan: Sendable {
    public let due: [Vocabulary]
    /// Due items left after the twenty-item review cap.
    public let backlogCount: Int
    public let newItems: [Vocabulary]
    /// Available encounters today, independent of which lesson is being previewed.
    public let remainingNewItemBudget: Int
    public let lesson: Lesson

    public init(state: LearnerState, now: Date = Date()) {
        let dueItems = Course.items.filter { item in
            guard let progress = state.records[item.id], progress.encountered,
                  let due = progress.due else { return false }
            return due <= now
        }.sorted { lhs, rhs in
            let left = state.records[lhs.id]!.due!
            let right = state.records[rhs.id]!.due!
            return left == right ? lhs.id < rhs.id : left < right
        }
        due = Array(dueItems.prefix(20))
        backlogCount = max(0, dueItems.count - 20)
        lesson = Course.lessons.first { !state.completedLessons.contains($0.id) } ?? Course.lessons[6]

        let today = LearningCalendar.dayKey(now)
        let encountersToday = state.records.values.filter { progress in
            guard progress.encountered, let first = progress.firstEncounteredAt else { return false }
            return LearningCalendar.dayKey(first) == today
        }.count
        // A full review queue takes priority; missed days never multiply the new-item allowance.
        let budget = dueItems.count >= 20 ? 0 : max(0, max(0, state.newItemsPerDay) - encountersToday)
        remainingNewItemBudget = budget
        let remaining = lesson.items.filter { state.records[$0.id]?.encountered != true }
        newItems = Array(remaining.prefix(budget))
    }
}
