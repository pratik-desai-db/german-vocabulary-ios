import Foundation

public struct ReadingPassage: Sendable, Equatable {
    public let german: String
    public let english: String
    public let question: String
    public let answer: String

    public init(_ german: String, _ english: String, question: String, answer: String) {
        self.german = german
        self.english = english
        self.question = question
        self.answer = answer
    }
}

public struct WritingTask: Sendable, Equatable {
    public let prompt: String
    public let checklist: [String]
    public let model: String

    public init(_ prompt: String, checklist: [String], model: String) {
        self.prompt = prompt
        self.checklist = checklist
        self.model = model
    }
}

public struct CurriculumDay: Identifiable, Sendable {
    public var id: Int { lesson.id }
    public let lesson: Lesson
    public let grammar: String
    public let reading: ReadingPassage
    public let writing: WritingTask
    public let paths: [PracticePath]

    public init(lesson: Lesson, grammar: String, reading: ReadingPassage,
                writing: WritingTask, paths: [PracticePath]) {
        self.lesson = lesson
        self.grammar = grammar
        self.reading = reading
        self.writing = writing
        self.paths = paths
    }
}

struct NewWord {
    let german: String
    let english: String
    let example: String
    let translation: String
    let answers: [String]

    init(_ german: String, _ english: String, _ example: String, _ translation: String,
         answers: [String] = []) {
        self.german = german
        self.english = english
        self.example = example
        self.translation = translation
        self.answers = answers.isEmpty
            ? [String(german.split(separator: "(").first ?? Substring(german)).trimmingCharacters(in: .whitespaces)]
            : answers
    }
}

enum CurriculumBuilder {
    static func day(_ id: Int, _ title: String, _ goal: String, words: [NewWord],
                    grammar: String, reading: ReadingPassage, writing: WritingTask,
                    partner: String, partnerEnglish: String, response: String, responseEnglish: String,
                    guided: String, independent: String) -> CurriculumDay {
        let items = words.enumerated().map { index, word in
            Vocabulary(id: "day\(id).\(index + 1)", german: word.german, english: word.english,
                       example: word.example, translation: word.translation,
                       cue: "Picture this situation: \(word.translation)", answers: word.answers)
        }
        let prefix = "day\(id).practice"
        let path = PracticePath(id: prefix, title: title, turns: [
            PracticeTurn(id: "\(prefix).repeat", title: "Listen and repeat", partner: response,
                         partnerTranslation: responseEnglish,
                         task: "Listen to the German model and repeat it. Compare its meaning with today's vocabulary and text.",
                         hint: response, suggestions: [response]),
            PracticeTurn(id: "\(prefix).guided", title: "Build your response", partner: partner,
                         partnerTranslation: partnerEnglish, task: guided,
                         hint: "Use today's phrases. A possible beginning: \(response.split(separator: ".").first ?? Substring(response))",
                         suggestions: [response]),
            PracticeTurn(id: "\(prefix).recall", title: "Try without the model", partner: partner,
                         partnerTranslation: partnerEnglish, task: independent,
                         hint: "Try first without hints. The example is one possible response, not the only correct answer.",
                         suggestions: [response]),
            PracticeTurn(id: "\(prefix).roleplay", title: "Make it your own", partner: partner,
                         partnerTranslation: partnerEnglish,
                         task: "\(independent) Add one detail or question of your own. The next screen does not interpret your answer.",
                         hint: "Use an imagined situation if you prefer not to share real details.",
                         suggestions: [response])
        ])
        return CurriculumDay(lesson: Lesson(id: id, title: title, goal: goal, items: items),
                             grammar: grammar, reading: reading, writing: writing, paths: [path])
    }

    static func review(_ id: Int, _ title: String, previous: [CurriculumDay],
                       grammar: String, reading: ReadingPassage, writing: WritingTask,
                       partner: String, partnerEnglish: String, response: String, responseEnglish: String) -> CurriculumDay {
        let shell = day(id, title, "Combine this week's language without adding new vocabulary.",
                        words: [], grammar: grammar, reading: reading, writing: writing,
                        partner: partner, partnerEnglish: partnerEnglish, response: response, responseEnglish: responseEnglish,
                        guided: "Plan a short response using the week's phrases, then say or type it.",
                        independent: "Respond to the situation in your own words, connecting at least three ideas.")
        let items = previous.suffix(6).compactMap { $0.lesson.items.first }
        return CurriculumDay(lesson: Lesson(id: id, title: title, goal: shell.lesson.goal, items: items),
                             grammar: grammar, reading: reading, writing: writing, paths: shell.paths)
    }
}
