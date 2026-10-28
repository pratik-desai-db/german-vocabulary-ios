import Foundation

public struct Vocabulary: Identifiable, Codable, Sendable, Equatable {
    public let id: String
    public let german: String
    public let english: String
    public let example: String
    public let translation: String
    public let cue: String
    public let answers: [String]

    public init(
        id: String, german: String, english: String, example: String,
        translation: String, cue: String, answers: [String]
    ) {
        self.id = id
        self.german = german
        self.english = english
        self.example = example
        self.translation = translation
        self.cue = cue
        self.answers = answers
    }
}

public struct Lesson: Identifiable, Codable, Sendable, Equatable {
    public let id: Int
    public let title: String
    public let goal: String
    public let items: [Vocabulary]

    public init(id: Int, title: String, goal: String, items: [Vocabulary]) {
        self.id = id
        self.title = title
        self.goal = goal
        self.items = items
    }
}

public enum Course {
    public static let lessons: [Lesson] = {
        let introductions = [
            Vocabulary(id: "intro.hallo", german: "Hallo!", english: "Hello!",
                       example: "Hallo! Wie geht es dir?", translation: "Hello! How are you?",
                       cue: "Greet someone informally.", answers: ["Hallo"]),
            Vocabulary(id: "intro.name", german: "Ich heiße …", english: "My name is …",
                       example: "Ich heiße Anna.", translation: "My name is Anna.",
                       cue: "Say: My name is Anna.", answers: ["Ich heiße Anna", "Ich heisse Anna"]),
            Vocabulary(id: "intro.origin", german: "Ich komme aus …", english: "I come from …",
                       example: "Ich komme aus Kanada.", translation: "I come from Canada.",
                       cue: "Say: I come from Canada.", answers: ["Ich komme aus Kanada"]),
            Vocabulary(id: "intro.pleased", german: "Freut mich!", english: "Nice to meet you!",
                       example: "Ich bin Max. – Freut mich!", translation: "I'm Max. – Nice to meet you!",
                       cue: "Say: Nice to meet you!", answers: ["Freut mich", "Es freut mich"]),
            Vocabulary(id: "intro.goodbye", german: "Auf Wiedersehen!", english: "Goodbye!",
                       example: "Auf Wiedersehen, Frau Müller!", translation: "Goodbye, Ms. Müller!",
                       cue: "Say goodbye politely.", answers: ["Auf Wiedersehen"])
        ]
        let routine = [
            Vocabulary(id: "routine.get-up", german: "aufstehen", english: "to get up",
                       example: "Ich stehe um sieben Uhr auf.", translation: "I get up at seven o'clock.",
                       cue: "Give the infinitive: to get up.", answers: ["aufstehen"]),
            Vocabulary(id: "routine.breakfast", german: "frühstücken", english: "to have breakfast",
                       example: "Wir frühstücken zusammen.", translation: "We have breakfast together.",
                       cue: "Give the infinitive: to have breakfast.", answers: ["frühstücken"]),
            Vocabulary(id: "routine.work", german: "arbeiten", english: "to work",
                       example: "Ich arbeite heute bis fünf.", translation: "I work until five today.",
                       cue: "Give the infinitive: to work.", answers: ["arbeiten"]),
            Vocabulary(id: "routine.everyday", german: "jeden Tag", english: "every day",
                       example: "Ich lerne jeden Tag Deutsch.", translation: "I study German every day.",
                       cue: "Say: every day.", answers: ["jeden Tag"]),
            Vocabulary(id: "routine.evening", german: "am Abend", english: "in the evening",
                       example: "Am Abend lese ich ein Buch.", translation: "In the evening I read a book.",
                       cue: "Say: in the evening.", answers: ["am Abend", "abends"])
        ]
        let shopping = [
            Vocabulary(id: "shopping.want", german: "Ich hätte gern …", english: "I would like …",
                       example: "Ich hätte gern ein Brot.", translation: "I would like a loaf of bread.",
                       cue: "Ask politely: I would like a loaf of bread.", answers: ["Ich hätte gern ein Brot", "Ich hätte gerne ein Brot"]),
            Vocabulary(id: "shopping.cost", german: "Wie viel kostet das?", english: "How much does that cost?",
                       example: "Entschuldigung, wie viel kostet das?", translation: "Excuse me, how much does that cost?",
                       cue: "Ask: How much does that cost?", answers: ["Wie viel kostet das"]),
            Vocabulary(id: "shopping.bag", german: "die Tüte (die Tüten)", english: "the bag",
                       example: "Brauchen Sie eine Tüte?", translation: "Do you need a bag?",
                       cue: "Name a shopping bag, with its definite article.", answers: ["die Tüte"]),
            Vocabulary(id: "shopping.card", german: "mit Karte bezahlen", english: "to pay by card",
                       example: "Kann ich mit Karte bezahlen?", translation: "Can I pay by card?",
                       cue: "Say the phrase: to pay by card.", answers: ["mit Karte bezahlen"]),
            Vocabulary(id: "shopping.receipt", german: "der Kassenbon (die Kassenbons)", english: "the receipt",
                       example: "Möchten Sie den Kassenbon?", translation: "Would you like the receipt?",
                       cue: "Name a shop receipt, with its definite article.", answers: ["der Kassenbon"])
        ]
        let appointments = [
            Vocabulary(id: "appointments.termin", german: "der Termin (die Termine)", english: "the appointment",
                       example: "Ich habe morgen einen Termin beim Arzt.", translation: "I have a doctor's appointment tomorrow.",
                       cue: "Name an appointment, with its definite article.", answers: ["der Termin"]),
            Vocabulary(id: "appointments.arrange", german: "einen Termin vereinbaren", english: "to arrange an appointment",
                       example: "Ich möchte einen Termin vereinbaren.", translation: "I would like to arrange an appointment.",
                       cue: "Say the phrase: to arrange an appointment.", answers: ["einen Termin vereinbaren"]),
            Vocabulary(id: "appointments.reschedule", german: "verschieben", english: "to postpone / reschedule",
                       example: "Können wir den Termin auf Freitag verschieben?", translation: "Can we reschedule the appointment for Friday?",
                       cue: "Give the infinitive: to postpone or reschedule.", answers: ["verschieben"]),
            Vocabulary(id: "appointments.time", german: "Zeit haben", english: "to have time",
                       example: "Haben Sie am Dienstag Zeit?", translation: "Do you have time on Tuesday?",
                       cue: "Say the phrase: to have time.", answers: ["Zeit haben"]),
            Vocabulary(id: "appointments.suits", german: "Es passt mir.", english: "That works for me.",
                       example: "Donnerstag um zehn? Ja, es passt mir.", translation: "Thursday at ten? Yes, that works for me.",
                       cue: "Say: That works for me.", answers: ["Es passt mir", "Das passt mir"])
        ]
        let transport = [
            Vocabulary(id: "transport.station", german: "der Bahnhof (die Bahnhöfe)", english: "the train station",
                       example: "Wie komme ich zum Bahnhof?", translation: "How do I get to the train station?",
                       cue: "Name a train station, with its definite article.", answers: ["der Bahnhof"]),
            Vocabulary(id: "transport.ticket", german: "die Fahrkarte (die Fahrkarten)", english: "the ticket",
                       example: "Ich brauche eine Fahrkarte nach Berlin.", translation: "I need a ticket to Berlin.",
                       cue: "Name a travel ticket, with its definite article.", answers: ["die Fahrkarte"]),
            Vocabulary(id: "transport.change", german: "umsteigen", english: "to change trains / buses",
                       example: "Sie müssen in Köln umsteigen.", translation: "You need to change in Cologne.",
                       cue: "Give the infinitive: to change trains.", answers: ["umsteigen"]),
            Vocabulary(id: "transport.platform", german: "das Gleis (die Gleise)", english: "the track / platform",
                       example: "Der Zug fährt von Gleis drei ab.", translation: "The train departs from platform three.",
                       cue: "Name a railway track, with its definite article.", answers: ["das Gleis"]),
            Vocabulary(id: "transport.delay", german: "die Verspätung (die Verspätungen)", english: "the delay",
                       example: "Der Zug hat zehn Minuten Verspätung.", translation: "The train is ten minutes late.",
                       cue: "Name a delay, with its definite article.", answers: ["die Verspätung"])
        ]
        let requests = [
            Vocabulary(id: "requests.help", german: "Können Sie mir helfen?", english: "Can you help me?",
                       example: "Entschuldigung, können Sie mir helfen?", translation: "Excuse me, can you help me?",
                       cue: "Ask politely: Can you help me?", answers: ["Können Sie mir helfen"]),
            Vocabulary(id: "requests.repeat", german: "Können Sie das wiederholen?", english: "Can you repeat that?",
                       example: "Können Sie das bitte wiederholen?", translation: "Can you please repeat that?",
                       cue: "Ask: Can you repeat that?", answers: ["Können Sie das wiederholen", "Können Sie das bitte wiederholen"]),
            Vocabulary(id: "requests.slow", german: "Bitte sprechen Sie langsamer.", english: "Please speak more slowly.",
                       example: "Bitte sprechen Sie langsamer. Ich lerne Deutsch.", translation: "Please speak more slowly. I'm learning German.",
                       cue: "Ask politely: Please speak more slowly.", answers: ["Bitte sprechen Sie langsamer", "Sprechen Sie bitte langsamer"]),
            Vocabulary(id: "requests.understand", german: "Ich verstehe nicht.", english: "I don't understand.",
                       example: "Entschuldigung, ich verstehe nicht.", translation: "Sorry, I don't understand.",
                       cue: "Say: I don't understand.", answers: ["Ich verstehe nicht", "Das verstehe ich nicht"]),
            Vocabulary(id: "requests.thanks", german: "Vielen Dank!", english: "Thank you very much!",
                       example: "Vielen Dank für Ihre Hilfe!", translation: "Thank you very much for your help!",
                       cue: "Say: Thank you very much!", answers: ["Vielen Dank", "Danke schön", "Dankeschön"])
        ]
        return [
            Lesson(id: 1, title: "Introductions", goal: "Greet someone and introduce yourself.", items: introductions),
            Lesson(id: 2, title: "Daily routine", goal: "Talk about a typical day.", items: routine),
            Lesson(id: 3, title: "Shopping", goal: "Ask for what you need and pay.", items: shopping),
            Lesson(id: 4, title: "Appointments", goal: "Arrange and reschedule an appointment.", items: appointments),
            Lesson(id: 5, title: "Transport", goal: "Find your way and travel by train.", items: transport),
            Lesson(id: 6, title: "Polite requests", goal: "Ask for help and clarification.", items: requests),
            Lesson(id: 7, title: "Review", goal: "Recall useful phrases from all six lessons.",
                   items: [introductions[1], routine[3], shopping[0], appointments[1], transport[2], requests[0]])
        ]
    }()

    /// The unique teaching inventory; review references do not introduce new items.
    public static let items: [Vocabulary] = lessons.prefix(6).flatMap(\.items)
}
