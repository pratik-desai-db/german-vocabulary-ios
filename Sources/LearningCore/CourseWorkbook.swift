public struct CourseWeek: Identifiable, Sendable, Equatable {
    public let id: Int
    public let title: String
    public let days: [Lesson]

    public init(id: Int, title: String, days: [Lesson]) {
        self.id = id
        self.title = title
        self.days = days
    }
}

extension Course {
    static func foundationDay(for lesson: Lesson) -> CurriculumDay? {
        let grammar: String
        let reading: ReadingPassage
        let writing: WritingTask
        switch lesson.id {
        case 1:
            grammar = "In a statement, the conjugated verb comes second: Ich heiße Anna. With ich, heißen becomes heiße and kommen becomes komme. Ask a name with Wie heißt du? and an origin with Woher kommst du?"
            reading = ReadingPassage(
                "Hallo! Ich heiße Anna. Ich komme aus Kanada. Mein Nachbar heißt Max. Er kommt aus Berlin. Freut mich, Max!",
                "Hello! My name is Anna. I come from Canada. My neighbour's name is Max. He comes from Berlin. Nice to meet you, Max!",
                question: "Woher kommen Anna und Max? / Where are Anna and Max from?",
                answer: "Anna kommt aus Kanada. Max kommt aus Berlin. / Anna is from Canada. Max is from Berlin.")
            writing = WritingTask(
                "Write a short introduction to a new neighbour in German. Invent personal details if you prefer.",
                checklist: ["Greet your neighbour.", "Give your name and country of origin.", "Say that you are pleased to meet them."],
                model: "Hallo! Ich heiße Anna. Ich komme aus Kanada. Freut mich!")
        case 2:
            grammar = "Separable verbs place the prefix at the end: Ich stehe um sieben Uhr auf. A time phrase can come first, but the verb stays second: Am Abend lese ich. Use um for clock times. Say am Morgen, am Vormittag, am Mittag, am Nachmittag, and am Abend, but in der Nacht."
            reading = ReadingPassage(
                "Ich stehe jeden Tag um sieben Uhr auf. Dann frühstücke ich mit Max. Ich arbeite heute bis fünf. Am Abend lerne ich Deutsch. Danach lese ich ein Buch.",
                "I get up at seven o'clock every day. Then I have breakfast with Max. Today I work until five. In the evening I study German. Afterwards I read a book.",
                question: "Wann steht die Person auf, und was macht sie am Abend? / When does the person get up, and what do they do in the evening?",
                answer: "Sie steht um sieben Uhr auf und lernt am Abend Deutsch. / They get up at seven and study German in the evening.")
            writing = WritingTask(
                "Describe a typical day in at least three German sentences.",
                checklist: ["Say when you get up using aufstehen.", "Describe breakfast or work.", "Add an evening activity using am Abend."],
                model: "Ich stehe um sieben Uhr auf. Dann frühstücke ich. Ich arbeite bis fünf. Am Abend lerne ich Deutsch.")
        case 3:
            grammar = "Ich hätte gern is a polite request. A masculine direct object takes einen, while neuter ein stays ein: Ich hätte gern ein Brot und einen Kassenbon. Use mit Karte for paying by card. Ask a price with Wie viel kostet das?"
            reading = ReadingPassage(
                "Anna ist in der Bäckerei. Sie sagt: „Ich hätte gern ein Brot.“ Das Brot kostet vier Euro. Anna braucht auch eine Tüte. Sie bezahlt mit Karte und nimmt den Kassenbon.",
                "Anna is at the bakery. She says, 'I would like a loaf of bread.' The bread costs four euros. Anna also needs a bag. She pays by card and takes the receipt.",
                question: "Was kauft Anna, und wie bezahlt sie? / What does Anna buy, and how does she pay?",
                answer: "Anna kauft ein Brot und bezahlt mit Karte. / Anna buys a loaf of bread and pays by card.")
            writing = WritingTask(
                "Write a short bakery conversation in German.",
                checklist: ["Politely order bread with Ich hätte gern.", "Ask the price.", "Ask to pay by card and request a receipt."],
                model: "Guten Tag! Ich hätte gern ein Brot. Wie viel kostet das? Kann ich mit Karte bezahlen? Den Kassenbon bitte. Vielen Dank!")
        case 4:
            grammar = "With möchten and können, put the second verb in the infinitive at the end: Ich möchte einen Termin vereinbaren. Können wir den Termin verschieben? Use am for weekdays and um for clock times; auf Freitag specifies the new day when rescheduling."
            reading = ReadingPassage(
                "Anna hat am Dienstag um zehn Uhr einen Termin beim Arzt. Am Dienstag muss sie arbeiten. Sie ruft in der Praxis an und möchte den Termin verschieben. Am Freitag um elf Uhr hat sie Zeit. Die Mitarbeiterin bestätigt den neuen Termin.",
                "Anna has a doctor's appointment on Tuesday at ten. On Tuesday she has to work. She calls the practice and would like to reschedule the appointment. On Friday at eleven she has time. The employee confirms the new appointment.",
                question: "Warum verschiebt Anna den Termin, und wann ist der neue Termin? / Why does Anna reschedule, and when is the new appointment?",
                answer: "Sie muss am Dienstag arbeiten. Der neue Termin ist am Freitag um elf Uhr. / She has to work on Tuesday. The new appointment is Friday at eleven.")
            writing = WritingTask(
                "Write a message asking a medical practice to reschedule your appointment.",
                checklist: ["Give the original appointment day and time.", "Ask politely to reschedule for Friday.", "Suggest a new time and thank the practice."],
                model: "Guten Tag! Ich habe am Dienstag um zehn Uhr einen Termin. Können wir den Termin auf Freitag verschieben? Am Freitag um elf Uhr habe ich Zeit. Vielen Dank!")
        case 5:
            grammar = "Müssen expresses necessity and sends the other verb to the end: Sie müssen in Köln umsteigen. In a statement, the separable verb abfahren splits: Der Zug fährt um zehn Uhr ab. Nach marks a destination city: eine Fahrkarte nach Berlin."
            reading = ReadingPassage(
                "Max ist am Bahnhof. Er braucht eine Fahrkarte nach Berlin. Der Zug fährt von Gleis drei ab. Max muss in Köln umsteigen. Heute hat der Zug zehn Minuten Verspätung.",
                "Max is at the train station. He needs a ticket to Berlin. The train departs from platform three. Max has to change in Cologne. Today the train is ten minutes late.",
                question: "Wo muss Max umsteigen, und wie viel Verspätung hat der Zug? / Where must Max change, and how late is the train?",
                answer: "Er muss in Köln umsteigen. Der Zug hat zehn Minuten Verspätung. / He must change in Cologne. The train is ten minutes late.")
            writing = WritingTask(
                "Write a short message to a friend about your train journey.",
                checklist: ["Name your destination.", "Say where you must change trains.", "Give a platform or departure time and mention a delay."],
                model: "Ich fahre nach Berlin. Ich muss in Köln umsteigen. Der Zug fährt von Gleis drei ab. Er hat zehn Minuten Verspätung.")
        case 6:
            grammar = "Formal requests use Sie: Können Sie mir helfen? The infinitive goes at the end after können. A polite imperative uses verb + Sie: Sprechen Sie bitte langsamer. Nicht negates a statement: Ich verstehe nicht."
            reading = ReadingPassage(
                "Anna lernt Deutsch. Am Bahnhof versteht sie eine Ansage nicht. Sie fragt: „Können Sie mir helfen?“ Ein Mitarbeiter erklärt den Weg zum Gleis. Anna sagt: „Bitte sprechen Sie langsamer.“ Dann bedankt sie sich für die Hilfe.",
                "Anna is learning German. At the station she does not understand an announcement. She asks, 'Can you help me?' An employee explains the way to the platform. Anna says, 'Please speak more slowly.' Then she thanks him for the help.",
                question: "Warum bittet Anna um Hilfe, und worum bittet sie den Mitarbeiter? / Why does Anna ask for help, and what does she ask the employee to do?",
                answer: "Sie versteht die Ansage nicht und bittet ihn, langsamer zu sprechen. / She does not understand the announcement and asks him to speak more slowly.")
            writing = WritingTask(
                "Write a polite exchange asking for clarification in German.",
                checklist: ["Explain that you do not understand.", "Ask someone to repeat or speak more slowly.", "Thank them for helping."],
                model: "Entschuldigung, ich verstehe nicht. Können Sie das bitte wiederholen? Bitte sprechen Sie langsamer. Vielen Dank für Ihre Hilfe!")
        case 7:
            grammar = "Review verb-second statements, infinitives after modal verbs, and separable prefixes at the end. Compare Ich stehe früh auf with Ich muss früh aufstehen. Combine time expressions accurately: am Freitag um elf Uhr."
            reading = ReadingPassage(
                "Ich heiße Anna und komme aus Kanada. Heute kaufe ich ein Brot und bezahle mit Karte. Danach fahre ich mit dem Zug nach Berlin. Ich muss in Köln umsteigen, aber der Zug hat Verspätung. Deshalb rufe ich die Praxis an und verschiebe meinen Termin auf Freitag.",
                "My name is Anna and I come from Canada. Today I buy a loaf of bread and pay by card. Afterwards I travel to Berlin by train. I have to change in Cologne, but the train is late. For that reason I call the practice and reschedule my appointment for Friday.",
                question: "Warum ruft Anna die Praxis an, und auf welchen Tag verschiebt sie den Termin? / Why does Anna call the practice, and to which day does she move her appointment?",
                answer: "Ihr Zug hat Verspätung. Sie verschiebt den Termin auf Freitag. / Her train is late. She moves the appointment to Friday.")
            writing = WritingTask(
                "Write a connected German message about a day involving shopping, travel, and an appointment.",
                checklist: ["Introduce yourself and mention a purchase.", "Explain a train journey or delay.", "Politely request a new appointment day and time."],
                model: "Hallo! Ich heiße Anna. Heute kaufe ich ein Brot. Dann fahre ich nach Berlin und muss in Köln umsteigen. Mein Zug hat Verspätung. Können wir den Termin auf Freitag um elf Uhr verschieben? Vielen Dank!")
        default:
            return nil
        }
        return CurriculumDay(lesson: lesson, grammar: grammar, reading: reading, writing: writing, paths: [])
    }
}
