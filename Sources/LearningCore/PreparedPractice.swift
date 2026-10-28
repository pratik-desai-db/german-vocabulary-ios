public struct PracticeTurn: Identifiable, Sendable, Equatable {
    public let id: String
    public let title: String
    public let partner: String
    public let partnerTranslation: String
    public let task: String
    public let hint: String
    public let suggestions: [String]

    public init(
        id: String, title: String, partner: String, partnerTranslation: String = "",
        task: String, hint: String, suggestions: [String]
    ) {
        self.id = id
        self.title = title
        self.partner = partner
        self.partnerTranslation = partnerTranslation
        self.task = task
        self.hint = hint
        self.suggestions = suggestions
    }
}

public struct PracticePath: Identifiable, Sendable, Equatable {
    public let id: String
    public let title: String
    public let turns: [PracticeTurn]

    public init(id: String, title: String, turns: [PracticeTurn]) {
        self.id = id
        self.title = title
        self.turns = turns
    }
}

/// Fixed practice scripts. Suggestions are optional models, not graded answers.
public enum PreparedPractice {
    public static func paths(for lessonID: Int) -> [PracticePath] {
        switch lessonID {
        case 1:
            return [PracticePath(id: "introductions.meet", title: "Meet a new neighbour", turns: [
                PracticeTurn(
                    id: "introductions.meet.repeat", title: "Repeat a greeting",
                    partner: "Hallo! Ich heiße Max.",
                    partnerTranslation: "Hello! My name is Max.",
                    task: "Say aloud: “Hallo! Ich heiße Anna.” (Hello! My name is Anna.)",
                    hint: "Repeat the model first; you can use your own name later.",
                    suggestions: ["Hallo! Ich heiße Anna.", "Hallo, ich bin Anna."]),
                PracticeTurn(
                    id: "introductions.meet.guided", title: "Build your introduction",
                    partner: "Wie heißt du?",
                    partnerTranslation: "What is your name?",
                    task: "Complete “Ich heiße …” with your name.",
                    hint: "Ich heiße means “My name is”.",
                    suggestions: ["Ich heiße Anna.", "Ich heiße Sam."]),
                PracticeTurn(
                    id: "introductions.meet.recall", title: "Recall your origin",
                    partner: "Woher kommst du?",
                    partnerTranslation: "Where are you from?",
                    task: "Without opening a suggestion, say that you come from Canada.",
                    hint: "Use the pattern for “I come from …”; reveal a suggestion only if needed.",
                    suggestions: ["Ich komme aus Kanada.", "Ich komme aus Kanada. Und du?"]),
                PracticeTurn(
                    id: "introductions.meet.roleplay", title: "Introduce yourself independently",
                    partner: "Hallo! Ich bin Max. Ich komme aus Berlin.",
                    partnerTranslation: "Hello! I'm Max. I'm from Berlin.",
                    task: "Greet Max, give your name and origin, and say “Nice to meet you”. Use your own details.",
                    hint: "Try the whole introduction before looking at an optional model.",
                    suggestions: [
                        "Hallo! Ich heiße Anna. Ich komme aus Kanada. Freut mich!",
                        "Hallo, ich bin Sam. Ich komme aus England. Freut mich!"
                    ])
            ])]
        case 2:
            return [PracticePath(id: "routine.day", title: "Describe a typical day", turns: [
                PracticeTurn(
                    id: "routine.day.repeat", title: "Repeat your morning",
                    partner: "Ich stehe um sieben Uhr auf.",
                    partnerTranslation: "I get up at seven o'clock.",
                    task: "Repeat “Ich stehe um sieben Uhr auf.” aloud.",
                    hint: "The separable verb aufstehen puts auf at the end.",
                    suggestions: ["Ich stehe um sieben Uhr auf.", "Ich stehe jeden Tag um sieben Uhr auf."]),
                PracticeTurn(
                    id: "routine.day.guided", title: "Build your routine",
                    partner: "Was machst du am Morgen?",
                    partnerTranslation: "What do you do in the morning?",
                    task: "Complete “Ich stehe um … Uhr auf. Dann frühstücke ich.” with a time.",
                    hint: "Dann frühstücke ich means “Then I have breakfast”.",
                    suggestions: [
                        "Ich stehe um sieben Uhr auf. Dann frühstücke ich.",
                        "Ich stehe um acht Uhr auf. Dann frühstücke ich."
                    ]),
                PracticeTurn(
                    id: "routine.day.recall", title: "Recall a daily habit",
                    partner: "Lernst du oft Deutsch?",
                    partnerTranslation: "Do you study German often?",
                    task: "From memory, say “I study German every day”.",
                    hint: "Recall the phrase for “every day” before opening a suggestion.",
                    suggestions: ["Ich lerne jeden Tag Deutsch.", "Ja, ich lerne jeden Tag Deutsch."]),
                PracticeTurn(
                    id: "routine.day.roleplay", title: "Tell a friend about your day",
                    partner: "Wie sieht dein Tag aus?",
                    partnerTranslation: "What is your day like?",
                    task: "Describe when you get up, when you work, and what you do in the evening. Choose your own routine.",
                    hint: "Connect two or three sentences; am Abend means “in the evening”.",
                    suggestions: [
                        "Ich stehe um sieben Uhr auf. Ich arbeite bis fünf. Am Abend lese ich ein Buch.",
                        "Ich stehe um acht Uhr auf. Ich arbeite bis sechs. Am Abend lerne ich Deutsch."
                    ])
            ])]
        case 3:
            return [PracticePath(id: "shopping.bakery", title: "Buy bread at a bakery", turns: [
                PracticeTurn(
                    id: "shopping.bakery.repeat", title: "Repeat a polite order",
                    partner: "Guten Tag! Was hätten Sie gern?",
                    partnerTranslation: "Hello! What would you like?",
                    task: "Repeat “Ich hätte gern ein Brot.” (I would like a loaf of bread.)",
                    hint: "Ich hätte gern is a polite way to ask for something.",
                    suggestions: ["Ich hätte gern ein Brot.", "Ich hätte gerne ein Brot, bitte."]),
                PracticeTurn(
                    id: "shopping.bakery.guided", title: "Build your order",
                    partner: "Möchten Sie noch etwas?",
                    partnerTranslation: "Would you like anything else?",
                    task: "Use “Ich hätte gern …” to ask for a bag as well.",
                    hint: "A bag is eine Tüte; noch means “also / additionally” here.",
                    suggestions: ["Ich hätte gern noch eine Tüte.", "Eine Tüte, bitte."]),
                PracticeTurn(
                    id: "shopping.bakery.recall", title: "Recall the price question",
                    partner: "Hier ist Ihr Brot.",
                    partnerTranslation: "Here is your bread.",
                    task: "Without a model, ask “How much does that cost?”",
                    hint: "Recall the question beginning with “How much”; use a suggestion if stuck.",
                    suggestions: ["Wie viel kostet das?", "Entschuldigung, wie viel kostet das?"]),
                PracticeTurn(
                    id: "shopping.bakery.roleplay", title: "Pay and finish the purchase",
                    partner: "Das kostet vier Euro. Möchten Sie den Kassenbon?",
                    partnerTranslation: "That costs four euros. Would you like the receipt?",
                    task: "Ask to pay by card, say whether you want the receipt, and thank the shop assistant.",
                    hint: "Make your own response first. Mit Karte bezahlen means “to pay by card”.",
                    suggestions: [
                        "Kann ich mit Karte bezahlen? Ja, den Kassenbon bitte. Vielen Dank!",
                        "Kann ich mit Karte bezahlen? Nein danke, ich brauche keinen Kassenbon."
                    ])
            ])]
        case 4:
            return [
                PracticePath(id: "appointments.make", title: "Make an appointment", turns: [
                    PracticeTurn(
                        id: "appointments.make.repeat", title: "Repeat the appointment request",
                        partner: "Guten Tag, Praxis Müller.",
                        partnerTranslation: "Hello, Dr Müller's practice.",
                        task: "Repeat “Ich möchte einen Termin vereinbaren.” (I would like to arrange an appointment.)",
                        hint: "Einen Termin vereinbaren means “to arrange an appointment”.",
                        suggestions: [
                            "Ich möchte einen Termin vereinbaren.",
                            "Guten Tag! Ich möchte einen Termin vereinbaren."
                        ]),
                    PracticeTurn(
                        id: "appointments.make.guided", title: "Build a time question",
                        partner: "An welchem Tag haben Sie Zeit?",
                        partnerTranslation: "On which day do you have time?",
                        task: "Complete “Ich habe am … Zeit.” using Dienstag (Tuesday) or Donnerstag (Thursday).",
                        hint: "Zeit haben means “to have time”; use am before the weekday.",
                        suggestions: ["Ich habe am Dienstag Zeit.", "Ich habe am Donnerstag Zeit."]),
                    PracticeTurn(
                        id: "appointments.make.recall", title: "Recall the request",
                        partner: "Was möchten Sie vereinbaren?",
                        partnerTranslation: "What would you like to arrange?",
                        task: "From memory, say that you would like to arrange an appointment.",
                        hint: "Try without a model first; the noun for “appointment” is Termin.",
                        suggestions: ["Ich möchte einen Termin vereinbaren.", "Ich hätte gern einen Termin."]),
                    PracticeTurn(
                        id: "appointments.make.receptionist", title: "Speak to the receptionist",
                        partner: "Praxis Müller, guten Tag. Was kann ich für Sie tun?",
                        partnerTranslation: "Dr Müller's practice, hello. What can I do for you?",
                        task: "Begin a fresh phone call: greet the receptionist, give your name, and ask to make an appointment.",
                        hint: "Combine your introduction with the appointment request in your own words.",
                        suggestions: [
                            "Guten Tag, ich heiße Anna. Ich möchte einen Termin vereinbaren.",
                            "Guten Tag, hier ist Sam. Ich hätte gern einen Termin."
                        ]),
                    PracticeTurn(
                        id: "appointments.make.choose-time", title: "Choose an offered time",
                        partner: "Haben Sie am Dienstag um zehn Uhr oder am Donnerstag um elf Uhr Zeit?",
                        partnerTranslation: "Are you free on Tuesday at ten or Thursday at eleven?",
                        task: "Choose one offered time and say that it works for you.",
                        hint: "Es passt mir means “That works for me”. Name the day and time you choose.",
                        suggestions: [
                            "Dienstag um zehn Uhr passt mir.",
                            "Donnerstag um elf Uhr passt mir."
                        ]),
                    PracticeTurn(
                        id: "appointments.make.confirm", title: "Confirm your appointment",
                        partner: "Gut, ich trage den gewählten Termin ein.",
                        partnerTranslation: "Good, I'll book the appointment you chose.",
                        task: "Repeat the day and time you chose, thank the receptionist, and say goodbye.",
                        hint: "Keep the same time as your previous answer; these models show both options.",
                        suggestions: [
                            "Also am Dienstag um zehn Uhr. Vielen Dank! Auf Wiedersehen!",
                            "Also am Donnerstag um elf Uhr. Vielen Dank! Auf Wiedersehen!"
                        ])
                ]),
                PracticePath(id: "appointments.change", title: "Change an appointment", turns: [
                    PracticeTurn(
                        id: "appointments.change.repeat", title: "Repeat the change request",
                        partner: "Sie haben am Dienstag um zehn Uhr einen Termin.",
                        partnerTranslation: "You have an appointment on Tuesday at ten.",
                        task: "Repeat “Ich möchte meinen Termin verschieben.” (I would like to reschedule my appointment.)",
                        hint: "Verschieben means “to postpone / reschedule”, not to cancel.",
                        suggestions: [
                            "Ich möchte meinen Termin verschieben.",
                            "Können wir meinen Termin verschieben?"
                        ]),
                    PracticeTurn(
                        id: "appointments.change.guided", title: "Build a new-day request",
                        partner: "Wann haben Sie Zeit?",
                        partnerTranslation: "When do you have time?",
                        task: "Complete “Können wir den Termin auf … verschieben?” with Freitag (Friday).",
                        hint: "Auf Freitag means “to Friday” when rescheduling.",
                        suggestions: [
                            "Können wir den Termin auf Freitag verschieben?",
                            "Ich möchte den Termin auf Freitag verschieben."
                        ]),
                    PracticeTurn(
                        id: "appointments.change.recall", title: "Recall the change request",
                        partner: "Möchten Sie Ihren Termin behalten?",
                        partnerTranslation: "Would you like to keep your appointment?",
                        task: "From memory, say no and ask to reschedule your appointment.",
                        hint: "Recall the verb for rescheduling before opening a suggestion.",
                        suggestions: [
                            "Nein, ich möchte meinen Termin verschieben.",
                            "Nein. Können wir den Termin verschieben?"
                        ]),
                    PracticeTurn(
                        id: "appointments.change.receptionist", title: "Explain to the receptionist",
                        partner: "Praxis Müller, guten Tag. Was kann ich für Sie tun?",
                        partnerTranslation: "Dr Müller's practice, hello. What can I do for you?",
                        task: "Start a new call. Give your name, identify your Tuesday ten o'clock appointment, and ask to move it to Friday.",
                        hint: "Identify the existing appointment before asking for the change.",
                        suggestions: [
                            "Guten Tag, ich heiße Anna. Ich habe am Dienstag um zehn Uhr einen Termin. Können wir den Termin auf Freitag verschieben?",
                            "Guten Tag, hier ist Sam. Ich möchte meinen Termin am Dienstag um zehn Uhr auf Freitag verschieben."
                        ]),
                    PracticeTurn(
                        id: "appointments.change.choose-time", title: "Choose a replacement time",
                        partner: "Am Freitag haben wir um neun Uhr oder um elf Uhr einen Termin frei.",
                        partnerTranslation: "On Friday we have an appointment available at nine or eleven.",
                        task: "Choose one of the Friday times and say that it works for you.",
                        hint: "Use passt mir with the time you choose.",
                        suggestions: ["Freitag um neun Uhr passt mir.", "Freitag um elf Uhr passt mir."]),
                    PracticeTurn(
                        id: "appointments.change.confirm", title: "Confirm the changed appointment",
                        partner: "Ihr Termin ist jetzt am Freitag zur gewählten Uhrzeit, nicht mehr am Dienstag.",
                        partnerTranslation: "Your appointment is now on Friday at the chosen time, no longer on Tuesday.",
                        task: "Confirm Friday and the time you chose, then thank the receptionist and say goodbye.",
                        hint: "Repeat your replacement time, not the original Tuesday appointment.",
                        suggestions: [
                            "Also am Freitag um neun Uhr. Vielen Dank! Auf Wiedersehen!",
                            "Also am Freitag um elf Uhr. Vielen Dank! Auf Wiedersehen!"
                        ])
                ])
            ]
        case 5:
            return [PracticePath(id: "transport.journey", title: "Take a train to Berlin", turns: [
                PracticeTurn(
                    id: "transport.journey.repeat", title: "Repeat a ticket request",
                    partner: "Wohin möchten Sie fahren?",
                    partnerTranslation: "Where would you like to travel?",
                    task: "Repeat “Ich brauche eine Fahrkarte nach Berlin.” (I need a ticket to Berlin.)",
                    hint: "Eine Fahrkarte is a travel ticket; nach introduces the city.",
                    suggestions: ["Ich brauche eine Fahrkarte nach Berlin.", "Eine Fahrkarte nach Berlin, bitte."]),
                PracticeTurn(
                    id: "transport.journey.guided", title: "Build a platform question",
                    partner: "Hier ist Ihre Fahrkarte.",
                    partnerTranslation: "Here is your ticket.",
                    task: "Complete “Von welchem … fährt der Zug ab?” with Gleis (platform / track).",
                    hint: "Von welchem Gleis means “from which platform”.",
                    suggestions: ["Von welchem Gleis fährt der Zug ab?", "Entschuldigung, von welchem Gleis fährt der Zug ab?"]),
                PracticeTurn(
                    id: "transport.journey.recall", title: "Recall a change question",
                    partner: "Der Zug fährt von Gleis drei ab.",
                    partnerTranslation: "The train departs from platform three.",
                    task: "From memory, ask “Do I have to change trains?”",
                    hint: "Use the verb for changing trains; reveal a suggestion only if needed.",
                    suggestions: ["Muss ich umsteigen?", "Muss ich in Köln umsteigen?"]),
                PracticeTurn(
                    id: "transport.journey.roleplay", title: "Handle a delayed train",
                    partner: "Sie müssen nicht umsteigen. Der Zug hat zehn Minuten Verspätung.",
                    partnerTranslation: "You don't have to change. The train is ten minutes late.",
                    task: "Ask the staff member to repeat the information, then confirm that the train to Berlin leaves from platform three and is ten minutes late.",
                    hint: "Try your own response first. Verspätung means “delay”.",
                    suggestions: [
                        "Können Sie das bitte wiederholen? Der Zug nach Berlin fährt von Gleis drei ab und hat zehn Minuten Verspätung, richtig?",
                        "Bitte noch einmal. Also nach Berlin, Gleis drei, zehn Minuten Verspätung. Vielen Dank!"
                    ])
            ])]
        case 6:
            return [PracticePath(id: "requests.help", title: "Ask for help and clarification", turns: [
                PracticeTurn(
                    id: "requests.help.repeat", title: "Repeat a polite request",
                    partner: "Guten Tag!",
                    partnerTranslation: "Hello!",
                    task: "Repeat “Entschuldigung, können Sie mir helfen?” (Excuse me, can you help me?)",
                    hint: "Use Sie when speaking politely to someone you do not know.",
                    suggestions: ["Entschuldigung, können Sie mir helfen?", "Können Sie mir bitte helfen?"]),
                PracticeTurn(
                    id: "requests.help.guided", title: "Build a clarification request",
                    partner: "Ja, natürlich. Was brauchen Sie?",
                    partnerTranslation: "Yes, of course. What do you need?",
                    task: "Complete “Können Sie das bitte …?” with wiederholen (repeat).",
                    hint: "Das refers to what the other person just said.",
                    suggestions: ["Können Sie das bitte wiederholen?", "Entschuldigung, können Sie das wiederholen?"]),
                PracticeTurn(
                    id: "requests.help.recall", title: "Recall a slower-speech request",
                    partner: "Ich erkläre es Ihnen gern.",
                    partnerTranslation: "I'll gladly explain it to you.",
                    task: "Without a model, ask the person to speak more slowly.",
                    hint: "Recall the phrase for “Please speak more slowly” before opening a suggestion.",
                    suggestions: ["Bitte sprechen Sie langsamer.", "Sprechen Sie bitte langsamer."]),
                PracticeTurn(
                    id: "requests.help.roleplay", title: "Get directions you understand",
                    partner: "Zum Bahnhof gehen Sie geradeaus und dann nach links.",
                    partnerTranslation: "To reach the station, go straight ahead and then left.",
                    task: "Imagine you did not understand. Say so, ask for repetition or slower speech, and thank the person for helping.",
                    hint: "Combine the requests you need; there is no need to use every model.",
                    suggestions: [
                        "Ich verstehe nicht. Können Sie das bitte wiederholen? Vielen Dank!",
                        "Entschuldigung, bitte sprechen Sie langsamer. Vielen Dank für Ihre Hilfe!"
                    ])
            ])]
        case 7:
            return [PracticePath(id: "review.errands", title: "Run errands before an appointment", turns: [
                PracticeTurn(
                    id: "review.errands.repeat", title: "Repeat a polite opening",
                    partner: "Guten Morgen!",
                    partnerTranslation: "Good morning!",
                    task: "Repeat “Guten Morgen! Ich hätte gern ein Brot.” (Good morning! I would like a loaf of bread.)",
                    hint: "You are buying bread before travelling to your appointment.",
                    suggestions: ["Guten Morgen! Ich hätte gern ein Brot.", "Guten Morgen! Ein Brot, bitte."]),
                PracticeTurn(
                    id: "review.errands.guided", title: "Build a payment question",
                    partner: "Das kostet vier Euro.",
                    partnerTranslation: "That costs four euros.",
                    task: "Complete “Kann ich mit … bezahlen?” to ask to pay by card.",
                    hint: "Use Karte in the gap.",
                    suggestions: ["Kann ich mit Karte bezahlen?", "Kann ich bitte mit Karte bezahlen?"]),
                PracticeTurn(
                    id: "review.errands.recall", title: "Recall the way to the station",
                    partner: "Vielen Dank! Auf Wiedersehen!",
                    partnerTranslation: "Thank you! Goodbye!",
                    task: "Now outside the bakery, ask a passer-by how to get to the train station, from memory.",
                    hint: "Recall Bahnhof and the question “How do I get to …?”",
                    suggestions: ["Wie komme ich zum Bahnhof?", "Entschuldigung, wie komme ich zum Bahnhof?"]),
                PracticeTurn(
                    id: "review.errands.transport", title: "Buy your travel ticket",
                    partner: "Wohin möchten Sie fahren?",
                    partnerTranslation: "At the station: Where would you like to travel?",
                    task: "Your appointment is in Berlin. Ask for a ticket to Berlin and ask whether you must change trains.",
                    hint: "Combine the ticket request with a question using umsteigen.",
                    suggestions: [
                        "Ich brauche eine Fahrkarte nach Berlin. Muss ich umsteigen?",
                        "Eine Fahrkarte nach Berlin, bitte. Muss ich umsteigen?"
                    ]),
                PracticeTurn(
                    id: "review.errands.requests", title: "Clarify the travel information",
                    partner: "Der Zug fährt von Gleis drei ab und hat zehn Minuten Verspätung.",
                    partnerTranslation: "The train departs from platform three and is ten minutes late.",
                    task: "Ask the station staff to repeat the information or speak more slowly. Then thank them.",
                    hint: "Choose a polite request that would help you understand.",
                    suggestions: [
                        "Können Sie das bitte wiederholen? Vielen Dank!",
                        "Bitte sprechen Sie langsamer. Vielen Dank für Ihre Hilfe!"
                    ]),
                PracticeTurn(
                    id: "review.errands.appointment", title: "Move the appointment after the delay",
                    partner: "Praxis Müller, guten Tag.",
                    partnerTranslation: "On the phone: Dr Müller's practice, hello.",
                    task: "The delay means you cannot reach your ten o'clock appointment today. Introduce yourself, explain the delay, and ask to reschedule for Friday.",
                    hint: "Use your name and combine Verspätung with den Termin verschieben.",
                    suggestions: [
                        "Guten Tag, ich heiße Anna. Ich habe heute um zehn Uhr einen Termin. Mein Zug hat Verspätung. Können wir den Termin auf Freitag verschieben?",
                        "Guten Tag, hier ist Sam. Mein Zug hat Verspätung. Ich möchte meinen Termin heute um zehn Uhr auf Freitag verschieben."
                    ]),
                PracticeTurn(
                    id: "review.errands.confirm", title: "Confirm the new plan independently",
                    partner: "Am Freitag um elf Uhr ist ein Termin frei. Passt Ihnen das?",
                    partnerTranslation: "An appointment is available on Friday at eleven. Does that work for you?",
                    task: "Accept the offered time, repeat the new day and time, thank the receptionist, and say goodbye.",
                    hint: "Finish the conversation in your own words before checking an optional model.",
                    suggestions: [
                        "Ja, Freitag um elf Uhr passt mir. Vielen Dank! Auf Wiedersehen!",
                        "Das passt mir. Also am Freitag um elf Uhr. Danke schön! Auf Wiedersehen!"
                    ])
            ])]
        default:
            return Course.day(lessonID)?.paths ?? []
        }
    }
}
