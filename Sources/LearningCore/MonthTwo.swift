enum MonthTwo {
    static let days: [CurriculumDay] = {
        var days: [CurriculumDay] = []

        days.append(CurriculumBuilder.day(
            29, "Last weekend", "Describe a past weekend using the Perfekt.",
            words: [
                NewWord("unternehmen", "to do; to undertake", "Am Samstag haben wir etwas zusammen unternommen.", "On Saturday we did something together."),
                NewWord("der Ausflug (plural: die Ausflüge)", "outing; excursion", "Unser Ausflug an den See hat mir gefallen.", "I enjoyed our outing to the lake."),
                NewWord("ausschlafen", "to sleep in", "Am Sonntag habe ich ausgeschlafen.", "On Sunday I slept in."),
                NewWord("spazieren gehen", "to go for a walk", "Wir sind nach dem Frühstück spazieren gegangen.", "We went for a walk after breakfast."),
                NewWord("gemütlich", "cozy; relaxed", "Der Abend bei unseren Freunden war gemütlich.", "The evening at our friends' place was relaxed.")
            ],
            grammar: "The Perfekt usually uses haben or sein plus a past participle at the end. Use sein with many verbs of movement: 'Wir sind zum See gefahren.' means 'We went to the lake.' A separable verb keeps its prefix before ge-: 'Ich habe ausgeschlafen.' means 'I slept in.'",
            reading: ReadingPassage(
                "Am Samstag ist Nora mit ihrem Bruder zum See gefahren. Sie haben Brot und Käse mitgenommen. Nach dem Essen sind sie am Wasser spazieren gegangen. Am Sonntag hat Nora ausgeschlafen, weil sie müde war.",
                "On Saturday Nora went to the lake with her brother. They took bread and cheese with them. After eating, they went for a walk by the water. On Sunday Nora slept in because she was tired.",
                question: "Why did Nora sleep in on Sunday?", answer: "She was tired."),
            writing: WritingTask("Write a message to a friend about an imagined weekend.",
                checklist: ["Name two completed activities.", "Say who was with you.", "Describe how the weekend felt."],
                model: "Am Samstag habe ich meine Schwester besucht. Wir sind im Park spazieren gegangen. Am Abend haben wir zusammen gekocht. Das Wochenende war sehr gemütlich."),
            partner: "Was hast du am Wochenende unternommen, und mit wem warst du unterwegs?",
            partnerEnglish: "What did you do at the weekend, and who were you out with?",
            response: "Ich bin mit meiner Schwester zum See gefahren. Wir sind spazieren gegangen und haben danach gekocht.",
            responseEnglish: "I went to the lake with my sister. We went for a walk and cooked afterward.",
            guided: "Use a haben sentence and a sein sentence to describe two weekend activities with a companion.",
            independent: "Tell a friend about an imagined weekend, including two activities and your opinion."
        ))

        days.append(CurriculumBuilder.day(
            30, "Travel experiences", "Recount a journey and explain a small travel problem.",
            words: [
                NewWord("die Reise (plural: die Reisen)", "trip; journey", "Die Reise nach Bremen hat drei Tage gedauert.", "The trip to Bremen lasted three days."),
                NewWord("umsteigen", "to change trains or buses", "In Hannover sind wir umgestiegen.", "We changed trains in Hanover."),
                NewWord("die Unterkunft (plural: die Unterkünfte)", "accommodation", "Unsere Unterkunft war direkt am Hafen.", "Our accommodation was right by the harbor."),
                NewWord("verpassen", "to miss", "Ich habe den letzten Bus verpasst.", "I missed the last bus."),
                NewWord("die Verspätung (plural: die Verspätungen)", "delay", "Wegen einer Verspätung sind wir spät angekommen.", "Because of a delay, we arrived late.")
            ],
            grammar: "In the Perfekt, separable verbs put ge- between prefix and stem: 'Wir sind umgestiegen.' means 'We changed trains.' Verbs with inseparable ver- have no ge-: 'Ich habe den Bus verpasst.' means 'I missed the bus.'",
            reading: ReadingPassage(
                "Malik ist im Mai nach Bremen gereist. In Hannover hat sein Zug zwanzig Minuten Verspätung gehabt. Trotzdem hat er den Anschluss nicht verpasst. Seine Unterkunft am Hafen hat er zu Fuß erreicht.",
                "Malik traveled to Bremen in May. In Hanover his train was twenty minutes late. Nevertheless, he did not miss his connection. He reached his accommodation by the harbor on foot.",
                question: "Did Malik miss his connecting train?", answer: "No, he caught his connection despite the delay."),
            writing: WritingTask("Describe an imagined short trip for a travel diary.",
                checklist: ["Give the destination.", "Describe one transport detail.", "Mention where you stayed."],
                model: "Letzten Monat bin ich nach Bremen gereist. Ich bin einmal umgestiegen. Mein Zug hat zehn Minuten Verspätung gehabt. Die Unterkunft am Hafen war ruhig."),
            partner: "Wie war deine letzte Reise? Hat unterwegs alles geklappt?",
            partnerEnglish: "How was your last trip? Did everything go smoothly on the way?",
            response: "Ich bin nach Bremen gefahren und einmal umgestiegen. Der Zug hatte Verspätung, aber ich habe den Anschluss erreicht.",
            responseEnglish: "I traveled to Bremen and changed trains once. The train was late, but I caught my connection.",
            guided: "Describe a destination and one travel event in the Perfekt, using umsteigen or verpassen.",
            independent: "Recount an imagined trip and explain how you handled a minor travel problem."
        ))

        days.append(CurriculumBuilder.day(
            31, "Work tasks", "Report completed work and identify the next priority.",
            words: [
                NewWord("die Aufgabe (plural: die Aufgaben)", "task", "Diese Aufgabe habe ich heute Morgen erledigt.", "I completed this task this morning."),
                NewWord("erledigen", "to complete; to take care of", "Ich erledige zuerst die Bestellung.", "I will take care of the order first."),
                NewWord("vorbereiten", "to prepare", "Wir haben die Besprechung vorbereitet.", "We prepared the meeting."),
                NewWord("die Frist (plural: die Fristen)", "deadline", "Die Frist endet am Donnerstag.", "The deadline is Thursday."),
                NewWord("zuständig", "responsible", "Für die Rechnung ist meine Kollegin zuständig.", "My colleague is responsible for the invoice.")
            ],
            grammar: "A separable verb splits in a main clause but stays together in its participle: 'Ich bereite die Sitzung vor.' means 'I prepare the meeting.' 'Ich habe die Sitzung vorbereitet.' means 'I prepared the meeting.' Put time words before the final participle.",
            reading: ReadingPassage(
                "Ella arbeitet in einer kleinen Werkstatt. Heute hat sie die Bestellungen geprüft und eine Lieferung vorbereitet. Für die Rechnungen ist ihr Kollege Ben zuständig. Beide wollen ihre Aufgaben vor der Frist am Donnerstag erledigen.",
                "Ella works in a small workshop. Today she checked the orders and prepared a delivery. Her colleague Ben is responsible for the invoices. Both want to complete their tasks before Thursday's deadline.",
                question: "Who is responsible for the invoices?", answer: "Ben is responsible for the invoices."),
            writing: WritingTask("Write a short update for a colleague at the end of a workday.",
                checklist: ["Report a completed task.", "Identify an unfinished task.", "Give a deadline or next step."],
                model: "Ich habe die Lieferung vorbereitet. Die Liste ist noch nicht fertig. Ich prüfe sie morgen früh. Vor der Frist am Donnerstag schicke ich dir alles."),
            partner: "Welche Aufgaben hast du schon erledigt, und was machst du als Nächstes?",
            partnerEnglish: "Which tasks have you already completed, and what will you do next?",
            response: "Ich habe die Lieferung vorbereitet. Als Nächstes prüfe ich die Liste, weil die Frist morgen endet.",
            responseEnglish: "I prepared the delivery. Next I will check the list because the deadline is tomorrow.",
            guided: "Name one completed task in the Perfekt and one next step with a time expression.",
            independent: "Give a realistic work update that distinguishes completed work, responsibility, and a deadline."
        ))

        days.append(CurriculumBuilder.day(
            32, "A job application", "Explain interest in a job and describe relevant experience.",
            words: [
                NewWord("die Bewerbung (plural: die Bewerbungen)", "job application", "Ich schicke meine Bewerbung heute ab.", "I am sending off my job application today."),
                NewWord("der Lebenslauf (plural: die Lebensläufe)", "résumé; CV", "Mein Lebenslauf ist zwei Seiten lang.", "My résumé is two pages long."),
                NewWord("die Erfahrung (plural: die Erfahrungen)", "experience", "Ich habe Erfahrung im Verkauf gesammelt.", "I gained experience in sales."),
                NewWord("zuverlässig", "reliable", "Unser neuer Mitarbeiter ist zuverlässig.", "Our new employee is reliable."),
                NewWord("sich bewerben", "to apply for a job", "Ich bewerbe mich um eine Stelle im Laden.", "I am applying for a position in the shop.")
            ],
            grammar: "Use sich bewerben um with a position: 'Ich bewerbe mich um die Stelle.' means 'I am applying for the position.' In a weil clause, the conjugated verb goes last: 'Ich passe gut ins Team, weil ich zuverlässig bin.' means 'I fit well into the team because I am reliable.'",
            reading: ReadingPassage(
                "Sofia möchte in einem Fahrradladen arbeiten. Sie hat zwei Jahre in einem Sportgeschäft gearbeitet. In ihrer Bewerbung beschreibt sie ihre Erfahrung mit Kunden. Den Lebenslauf hat sie gestern aktualisiert.",
                "Sofia would like to work in a bicycle shop. She worked in a sports shop for two years. In her application she describes her experience with customers. She updated her résumé yesterday.",
                question: "What experience does Sofia describe in her application?", answer: "She describes her experience with customers."),
            writing: WritingTask("Write a short application introduction for an imagined shop job.",
                checklist: ["Name the job you want.", "Describe relevant experience.", "Explain one useful personal strength."],
                model: "Ich bewerbe mich um die Stelle in Ihrem Fahrradladen. Ich habe zwei Jahre im Verkauf gearbeitet. Ich berate Kunden gern und bin zuverlässig. Deshalb möchte ich Ihr Team unterstützen."),
            partner: "Warum möchten Sie bei uns arbeiten, und welche Erfahrung bringen Sie mit?",
            partnerEnglish: "Why would you like to work with us, and what experience do you bring?",
            response: "Ich möchte bei Ihnen arbeiten, weil ich Fahrräder interessant finde. Ich habe schon im Verkauf gearbeitet und bin zuverlässig.",
            responseEnglish: "I would like to work with you because I find bicycles interesting. I have already worked in sales and am reliable.",
            guided: "Introduce relevant experience with the Perfekt and explain your interest with weil.",
            independent: "Answer an imagined employer's question with a specific reason and a relevant example from work."
        ))

        days.append(CurriculumBuilder.day(
            33, "Education and courses", "Compare courses and ask about enrollment.",
            words: [
                NewWord("die Weiterbildung (plural: die Weiterbildungen)", "further training", "Die Weiterbildung beginnt im Herbst.", "The further training starts in autumn."),
                NewWord("sich anmelden", "to register", "Ich habe mich für den Abendkurs angemeldet.", "I registered for the evening course."),
                NewWord("die Voraussetzung (plural: die Voraussetzungen)", "prerequisite", "Grundkenntnisse sind eine Voraussetzung für diesen Kurs.", "Basic knowledge is a prerequisite for this course."),
                NewWord("die Teilnahme (uncountable)", "participation", "Die Teilnahme kostet achtzig Euro.", "Participation costs eighty euros."),
                NewWord("der Stundenplan (plural: die Stundenpläne)", "timetable; class schedule", "Im Stundenplan stehen zwei Termine pro Woche.", "The timetable lists two sessions per week.")
            ],
            grammar: "Use dass to report information, with the conjugated verb at the end: 'Ich habe gelesen, dass der Kurs montags beginnt.' means 'I read that the course starts on Mondays.' The comma separates the main clause from the dass clause.",
            reading: ReadingPassage(
                "Jonas sucht eine Weiterbildung für seine Arbeit im Büro. Er hat gelesen, dass die Schule einen Tabellenkurs anbietet. Der Kurs am Abend passt besser zu seinem Stundenplan als der Kurs am Vormittag. Vor der Anmeldung fragt er nach den Voraussetzungen.",
                "Jonas is looking for further training for his office work. He read that the school offers a spreadsheet course. The evening course fits his schedule better than the morning course. Before registering, he asks about the prerequisites.",
                question: "Why does Jonas prefer the evening course?", answer: "It fits his schedule better than the morning course."),
            writing: WritingTask("Write an inquiry to a course office about an evening class.",
                checklist: ["Identify the course.", "Ask about prerequisites.", "Ask about the schedule or cost."],
                model: "Ich interessiere mich für Ihren Tabellenkurs. Auf Ihrer Webseite steht, dass er abends stattfindet. Welche Voraussetzungen gibt es für die Teilnahme? Könnten Sie mir bitte den Stundenplan schicken?"),
            partner: "Für welchen Kurs möchten Sie sich anmelden, und wann haben Sie Zeit?",
            partnerEnglish: "Which course would you like to register for, and when are you available?",
            response: "Ich möchte mich für den Tabellenkurs anmelden. Ich habe gelesen, dass er abends stattfindet, und habe dienstags Zeit.",
            responseEnglish: "I would like to register for the spreadsheet course. I read that it takes place in the evenings, and I am available on Tuesdays.",
            guided: "Name a course and report one detail about it using dass.",
            independent: "Discuss two possible course times, choose one, and ask a practical question about participation."
        ))

        days.append(CurriculumBuilder.day(
            34, "Learning strategies", "Explain a learning routine and adapt it to a difficulty.",
            words: [
                NewWord("wiederholen", "to review; to repeat", "Ich wiederhole neue Wörter am nächsten Tag.", "I review new words the next day."),
                NewWord("die Karteikarte (plural: die Karteikarten)", "flashcard", "Auf jeder Karteikarte steht ein Beispielsatz.", "Each flashcard has an example sentence on it."),
                NewWord("sich merken", "to remember; to commit to memory", "Mit einem Bild kann ich mir das Wort besser merken.", "With a picture I can remember the word better."),
                NewWord("regelmäßig", "regularly; regular", "Wir üben regelmäßig nach dem Mittagessen.", "We practice regularly after lunch."),
                NewWord("das Lernziel (plural: die Lernziele)", "learning goal", "Mein Lernziel für heute ist ein kurzes Gespräch.", "My learning goal for today is a short conversation.")
            ],
            grammar: "A wenn clause describes a condition or repeated situation and puts its verb last: 'Wenn ich ein Wort vergesse, wiederhole ich den Satz.' means 'When I forget a word, I review the sentence.' When the wenn clause comes first, the main clause starts with its verb.",
            reading: ReadingPassage(
                "Aylin lernt jeden Morgen zehn Minuten Deutsch. Auf ihre Karteikarten schreibt sie nicht nur Wörter, sondern auch Sätze. Wenn sie ein Wort vergisst, zeichnet sie ein kleines Bild dazu. Ihr Lernziel ist ein Gespräch ohne lange Pausen.",
                "Aylin studies German for ten minutes every morning. She writes not only words but also sentences on her flashcards. When she forgets a word, she draws a small picture to go with it. Her learning goal is a conversation without long pauses.",
                question: "What does Aylin do when she forgets a word?", answer: "She draws a small picture to go with it."),
            writing: WritingTask("Suggest a manageable learning routine to a busy classmate.",
                checklist: ["Set a small learning goal.", "Suggest a regular practice time.", "Give a strategy for forgotten words."],
                model: "Lerne jeden Morgen fünf neue Wörter. Nach dem Frühstück kannst du sie regelmäßig wiederholen. Wenn du ein Wort vergisst, schreibe einen Beispielsatz. Dein Lernziel für Freitag könnte ein kurzes Gespräch sein."),
            partner: "Wie lernst du neue Wörter, wenn du wenig Zeit hast?",
            partnerEnglish: "How do you learn new words when you have little time?",
            response: "Ich wiederhole jeden Morgen fünf Karteikarten. Wenn ich ein Wort vergesse, schreibe ich einen Satz dazu.",
            responseEnglish: "I review five flashcards every morning. When I forget a word, I write a sentence using it.",
            guided: "Describe a short routine and use wenn to explain what you do when a word is difficult.",
            independent: "Recommend a realistic weekly learning plan and explain why one strategy helps you."
        ))

        days.append(CurriculumBuilder.review(
            35, "Review: experiences and progress", previous: days,
            grammar: "Combine completed events in the Perfekt with reasons and conditions. 'Ich habe mich angemeldet, weil ich mehr lernen möchte.' means 'I registered because I want to learn more.' 'Wenn ich Zeit habe, wiederhole ich die Wörter.' means 'When I have time, I review the words.'",
            reading: ReadingPassage(
                "Nach einem Ausflug nach Bremen hat Deniz eine Bewerbung geschrieben. In der Woche hat er seine Aufgaben in der Werkstatt erledigt. Am Freitag hat er sich für eine Weiterbildung angemeldet. Er möchte regelmäßig lernen, weil er später andere Aufgaben übernehmen will.",
                "After an outing to Bremen, Deniz wrote a job application. During the week he completed his tasks in the workshop. On Friday he registered for further training. He wants to study regularly because he wants to take on different tasks later.",
                question: "Why does Deniz want to study regularly?", answer: "He wants to take on different tasks later."),
            writing: WritingTask("Write a weekly update linking a personal experience, work, and learning.",
                checklist: ["Describe two completed events.", "Include a work or course detail.", "Explain a future learning plan."],
                model: "Am Wochenende habe ich einen Ausflug gemacht. Am Montag habe ich meine Bewerbung abgeschickt. Jetzt besuche ich einen Abendkurs, weil ich mehr lernen möchte. Wenn ich abends Zeit habe, wiederhole ich meine Karteikarten."),
            partner: "Was hast du diese Woche erlebt, und was möchtest du als Nächstes lernen?",
            partnerEnglish: "What did you experience this week, and what would you like to learn next?",
            response: "Ich habe einen Ausflug gemacht und meine Aufgaben erledigt. Jetzt möchte ich einen Kurs besuchen, weil ich neue Aufgaben übernehmen will.",
            responseEnglish: "I went on an outing and completed my tasks. Now I would like to take a course because I want to take on new tasks."
        ))

        days.append(CurriculumBuilder.day(
            36, "Everyday health habits", "Discuss ordinary routines that support well-being.",
            words: [
                NewWord("die Gewohnheit (plural: die Gewohnheiten)", "habit", "Ein kurzer Spaziergang ist eine feste Gewohnheit geworden.", "A short walk has become an established habit."),
                NewWord("sich erholen", "to rest; to recover", "Nach der Arbeit erhole ich mich im Garten.", "After work I relax in the garden."),
                NewWord("ausreichend", "enough; sufficient", "Nachts möchte ich ausreichend schlafen.", "I want to get enough sleep at night."),
                NewWord("die Bewegung (uncountable)", "physical activity; movement", "Mehr Bewegung im Alltag tut mir gut.", "More physical activity in everyday life does me good."),
                NewWord("abschalten", "to switch off; to unwind", "Abends schalte ich beim Lesen ab.", "In the evenings I unwind by reading.")
            ],
            grammar: "Use wenn for recurring situations and weil for reasons: 'Wenn ich müde bin, mache ich eine Pause.' means 'When I am tired, I take a break.' 'Ich lese abends, weil ich dabei abschalten kann.' means 'I read in the evening because it helps me unwind.' Both clauses put the conjugated verb last.",
            reading: ReadingPassage(
                "Seit zwei Wochen geht Mira in der Mittagspause nach draußen. Sie bewegt sich gern, weil sie danach wacher ist. Abends liest sie ein paar Seiten und legt das Telefon weg. Wenn sie einen anstrengenden Tag hatte, geht sie früher ins Bett.",
                "For two weeks Mira has been going outside during her lunch break. She enjoys being active because she feels more alert afterward. In the evenings she reads a few pages and puts her phone away. When she has had a tiring day, she goes to bed earlier.",
                question: "Why does Mira enjoy being active during her break?", answer: "She feels more alert afterward."),
            writing: WritingTask("Describe a small change to an imagined daily routine, without giving medical advice.",
                checklist: ["Name one everyday habit.", "Explain a personal reason.", "Say when you will practice it."],
                model: "Ich möchte mittags öfter nach draußen gehen. Ein kurzer Spaziergang hilft mir, abzuschalten. Wenn es regnet, gehe ich nach der Arbeit eine kleine Runde. So habe ich regelmäßig Bewegung."),
            partner: "Was hilft dir nach einem langen Tag, dich zu erholen?",
            partnerEnglish: "What helps you rest after a long day?",
            response: "Wenn ich nach Hause komme, lese ich eine Weile. Dabei kann ich abschalten und mich erholen.",
            responseEnglish: "When I get home, I read for a while. It helps me unwind and rest.",
            guided: "Describe a personal habit with wenn and explain why it suits you.",
            independent: "Compare two everyday ways of unwinding and choose one for a busy weekday."
        ))

        days.append(CurriculumBuilder.day(
            37, "Sport and leisure", "Compare leisure activities and arrange a trial session.",
            words: [
                NewWord("der Verein (plural: die Vereine)", "club; association", "Der Verein bietet auch Kurse für Anfänger an.", "The club also offers courses for beginners."),
                NewWord("das Probetraining (plural: die Probetrainings)", "trial training session", "Am Mittwoch mache ich ein Probetraining.", "On Wednesday I am attending a trial training session."),
                NewWord("die Ausrüstung (plural: die Ausrüstungen)", "equipment", "Für das Training kann ich die Ausrüstung ausleihen.", "I can borrow the equipment for the training session."),
                NewWord("anstrengend", "strenuous; tiring", "Das erste Training war anstrengend, aber schön.", "The first training session was tiring but enjoyable."),
                NewWord("teilnehmen", "to take part", "Meine Freundin nimmt am Laufkurs teil.", "My friend takes part in the running course.")
            ],
            grammar: "Form many comparatives with -er and compare with als: 'Schwimmen ist ruhiger als Fußball.' means 'Swimming is calmer than football.' Some forms change: 'Dieser Kurs gefällt mir besser.' means 'I like this course better.' In a main clause, teilnehmen separates: 'Ich nehme am Training teil.' means 'I take part in training.'",
            reading: ReadingPassage(
                "Tarek möchte nach der Arbeit Sport machen. Der Laufkurs ist günstiger als der Tenniskurs. Trotzdem entscheidet er sich für ein Probetraining im Tennisverein, weil seine Kollegin dort spielt. Für den ersten Termin leiht er die Ausrüstung aus.",
                "Tarek wants to do sport after work. The running course is cheaper than the tennis course. Nevertheless, he chooses a trial session at the tennis club because his colleague plays there. He borrows the equipment for the first session.",
                question: "Why does Tarek choose the tennis trial session?", answer: "His colleague plays at that club."),
            writing: WritingTask("Ask a sports club about trying an activity before joining.",
                checklist: ["Name the activity.", "Ask about a trial session.", "Ask what equipment you need."],
                model: "Ich interessiere mich für Ihren Tenniskurs. Könnte ich am Mittwoch an einem Probetraining teilnehmen? Ich habe noch keine eigene Ausrüstung. Kann ich einen Schläger bei Ihnen ausleihen?"),
            partner: "Möchtest du lieber am Laufkurs oder am Tennistraining teilnehmen?",
            partnerEnglish: "Would you rather take part in the running course or the tennis training?",
            response: "Der Laufkurs ist günstiger als das Tennistraining, aber Tennis finde ich interessanter. Ich würde gern zuerst ein Probetraining machen.",
            responseEnglish: "The running course is cheaper than the tennis training, but I find tennis more interesting. I would like to attend a trial training session first.",
            guided: "Compare two activities using a comparative with als, then state your preference.",
            independent: "Choose an activity with a friend, considering cost, effort, and equipment."
        ))

        days.append(CurriculumBuilder.day(
            38, "Food preferences", "Explain preferences and negotiate a shared meal.",
            words: [
                NewWord("die Zutat (plural: die Zutaten)", "ingredient", "Für die Suppe brauchen wir nur wenige Zutaten.", "We only need a few ingredients for the soup."),
                NewWord("würzig", "flavorful; well-seasoned", "Die Soße ist würzig, aber nicht scharf.", "The sauce is flavorful but not hot."),
                NewWord("vegetarisch", "vegetarian", "Heute kochen wir ein vegetarisches Gericht.", "Today we are cooking a vegetarian dish."),
                NewWord("vertragen", "to tolerate; to digest well", "Ich vertrage rohe Zwiebeln nicht gut.", "I do not digest raw onions well."),
                NewWord("die Portion (plural: die Portionen)", "portion; serving", "Eine kleine Portion reicht mir heute.", "A small portion is enough for me today.")
            ],
            grammar: "Use lieber to express preference and besser to compare how much you like something: 'Ich esse lieber Reis als Nudeln.' means 'I prefer eating rice to pasta.' 'Diese Suppe schmeckt mir besser.' means 'I like the taste of this soup better.' A weil clause can explain a dietary preference without making a general health claim.",
            reading: ReadingPassage(
                "Lena und Pavel kochen heute für drei Freunde. Pavel schlägt eine würzige Gemüsesuppe vor. Lena verträgt rohe Zwiebeln nicht gut, deshalb lassen sie diese Zutat weg. Sie stellen Brot auf den Tisch, damit jeder eine passende Portion wählen kann.",
                "Lena and Pavel are cooking for three friends today. Pavel suggests a flavorful vegetable soup. Lena does not digest raw onions well, so they leave out that ingredient. They put bread on the table so everyone can choose a suitable portion.",
                question: "Which ingredient do Lena and Pavel leave out?", answer: "They leave out raw onions."),
            writing: WritingTask("Send a friend a meal suggestion that takes a personal preference into account.",
                checklist: ["Suggest a specific dish.", "Mention a preference or ingredient to avoid.", "Offer a practical alternative."],
                model: "Ich würde gern eine vegetarische Suppe kochen. Ich vertrage rohe Zwiebeln nicht gut. Könnten wir sie weglassen? Dazu könnten wir frisches Brot essen."),
            partner: "Was sollen wir heute kochen? Gibt es eine Zutat, die du lieber vermeiden möchtest?",
            partnerEnglish: "What should we cook today? Is there an ingredient you would rather avoid?",
            response: "Ich esse lieber vegetarisch. Wir könnten eine würzige Suppe ohne rohe Zwiebeln kochen.",
            responseEnglish: "I prefer eating vegetarian food. We could cook a flavorful soup without raw onions.",
            guided: "Suggest a dish with könnten and explain a food preference using lieber.",
            independent: "Agree on a shared meal, explaining one preference and offering an alternative ingredient."
        ))

        days.append(CurriculumBuilder.day(
            39, "Planning a celebration", "Share preparations and divide celebration tasks.",
            words: [
                NewWord("die Einladung (plural: die Einladungen)", "invitation", "Die Einladung habe ich gestern verschickt.", "I sent the invitation yesterday."),
                NewWord("der Anlass (plural: die Anlässe)", "occasion", "Der Anlass für das Fest ist unser Umzug.", "The occasion for the party is our move."),
                NewWord("mitbringen", "to bring along", "Kannst du einen Salat mitbringen?", "Can you bring a salad?"),
                NewWord("schmücken", "to decorate", "Wir schmücken den Hof mit bunten Bändern.", "We decorate the courtyard with colorful ribbons."),
                NewWord("absagen", "to cancel; to decline", "Leider hat ein Gast kurzfristig abgesagt.", "Unfortunately, one guest canceled at short notice.")
            ],
            grammar: "In the Perfekt, mitbringen becomes mitgebracht and absagen becomes abgesagt: 'Ich habe Brot mitgebracht.' means 'I brought bread along.' For a polite request, use könnten: 'Könntest du einen Salat mitbringen?' means 'Could you bring a salad?'",
            reading: ReadingPassage(
                "Zum Einzug plant Fatima ein kleines Fest im Hof. Sie hat zehn Einladungen verschickt. Ihr Nachbar bringt Stühle mit, und ihre Schwester schmückt den Tisch. Ein Freund hat abgesagt, weil er am Samstag arbeiten muss.",
                "Fatima is planning a small party in the courtyard to celebrate moving in. She has sent ten invitations. Her neighbor is bringing chairs, and her sister is decorating the table. A friend has declined because he has to work on Saturday.",
                question: "What is Fatima's neighbor bringing?", answer: "He is bringing chairs."),
            writing: WritingTask("Invite a neighbor to an informal courtyard celebration.",
                checklist: ["Explain the occasion.", "Give a time and place.", "Make one polite request."],
                model: "Wir feiern am Samstag unseren Einzug. Das Fest beginnt um sechzehn Uhr im Hof. Wir würden uns freuen, wenn du kommst. Könntest du zwei Stühle mitbringen?"),
            partner: "Was hast du für das Fest schon vorbereitet, und was soll ich mitbringen?",
            partnerEnglish: "What have you already prepared for the party, and what should I bring?",
            response: "Ich habe die Einladungen verschickt und den Tisch geschmückt. Könntest du einen Salat mitbringen?",
            responseEnglish: "I sent the invitations and decorated the table. Could you bring a salad?",
            guided: "Report one completed preparation and ask politely for help using könntest.",
            independent: "Arrange a small celebration with a friend, including the occasion and a fair division of tasks."
        ))

        days.append(CurriculumBuilder.day(
            40, "Making suggestions", "Offer alternatives and settle on a practical plan.",
            words: [
                NewWord("der Vorschlag (plural: die Vorschläge)", "suggestion", "Dein Vorschlag passt gut zu unserem Budget.", "Your suggestion fits our budget well."),
                NewWord("vorschlagen", "to suggest", "Ich schlage einen Besuch im Stadtmuseum vor.", "I suggest a visit to the city museum."),
                NewWord("stattdessen", "instead", "Bei Regen könnten wir stattdessen ins Café gehen.", "If it rains, we could go to the café instead."),
                NewWord("die Alternative (plural: die Alternativen)", "alternative", "Eine günstige Alternative ist ein Picknick.", "An inexpensive alternative is a picnic."),
                NewWord("sich einigen", "to agree; to reach agreement", "Wir haben uns auf Samstag geeinigt.", "We agreed on Saturday.")
            ],
            grammar: "Könnten and würden make suggestions less direct: 'Wir könnten ins Museum gehen.' means 'We could go to the museum.' 'Ich würde lieber draußen bleiben.' means 'I would rather stay outside.' Use sich einigen auf for an agreed choice: 'Wir einigen uns auf Samstag.' means 'We agree on Saturday.'",
            reading: ReadingPassage(
                "Die Freunde wollen am Sonntag etwas zusammen unternehmen. Ria schlägt eine Radtour vor, aber der Wetterbericht meldet Regen. Oskar bietet einen Museumsbesuch als Alternative an. Sie einigen sich auf das Museum und wollen danach noch ins Café gehen.",
                "The friends want to do something together on Sunday. Ria suggests a bike ride, but the weather forecast predicts rain. Oskar offers a museum visit as an alternative. They agree on the museum and want to go to a café afterward.",
                question: "Why do the friends choose the museum instead of a bike ride?", answer: "Rain is forecast."),
            writing: WritingTask("Propose two options for a free afternoon and recommend one.",
                checklist: ["Offer an outdoor option.", "Offer an alternative for bad weather.", "Suggest a meeting time."],
                model: "Wir könnten am Sonntag eine Radtour machen. Wenn es regnet, würde ich stattdessen ins Museum gehen. Dort gibt es eine neue Ausstellung über unsere Stadt. Wollen wir uns um vierzehn Uhr treffen?"),
            partner: "Was könnten wir am Sonntag machen, wenn es regnet?",
            partnerEnglish: "What could we do on Sunday if it rains?",
            response: "Wir könnten ins Museum gehen. Stattdessen könnten wir einen Spielenachmittag zu Hause machen.",
            responseEnglish: "We could go to the museum. Instead, we could have an afternoon of games at home.",
            guided: "Offer a suggestion with könnten and a different option using stattdessen.",
            independent: "Negotiate an afternoon plan that accounts for weather and a limited budget."
        ))

        days.append(CurriculumBuilder.day(
            41, "Agreeing and disagreeing", "Respond to opinions respectfully and find a compromise.",
            words: [
                NewWord("zustimmen", "to agree", "Bei diesem Punkt stimme ich dir zu.", "I agree with you on this point."),
                NewWord("widersprechen", "to disagree; to contradict", "Da muss ich dir leider widersprechen.", "I am afraid I have to disagree with you there."),
                NewWord("die Meinung (plural: die Meinungen)", "opinion", "Meiner Meinung nach ist der Park ruhiger.", "In my opinion, the park is quieter."),
                NewWord("der Kompromiss (plural: die Kompromisse)", "compromise", "Ein kürzerer Ausflug wäre ein guter Kompromiss.", "A shorter outing would be a good compromise."),
                NewWord("nachvollziehbar", "understandable", "Dein Wunsch nach Ruhe ist nachvollziehbar.", "Your wish for quiet is understandable.")
            ],
            grammar: "Zustimmen and widersprechen take the dative: 'Ich stimme dir zu.' means 'I agree with you.' State an opinion with a dass clause: 'Ich finde, dass der Park ruhiger ist.' means 'I think the park is quieter.' Wäre softens an alternative: 'Das wäre ein Kompromiss.' means 'That would be a compromise.'",
            reading: ReadingPassage(
                "Die Wohngemeinschaft bespricht einen gemeinsamen Abend. Paul möchte viele Freunde einladen, aber Ines braucht nach der Arbeit Ruhe. Paul findet ihren Wunsch nachvollziehbar. Sie einigen sich auf vier Gäste und ein Ende um zehn Uhr.",
                "The flatmates discuss an evening together. Paul wants to invite lots of friends, but Ines needs quiet after work. Paul finds her wish understandable. They agree on four guests and finishing at ten o'clock.",
                question: "What compromise do the flatmates reach?", answer: "They agree to invite four guests and finish at ten o'clock."),
            writing: WritingTask("Reply politely to a friend's plan for a very late evening.",
                checklist: ["Acknowledge one good part of the plan.", "Explain your disagreement.", "Propose a compromise."],
                model: "Ich finde deine Idee für ein gemeinsames Essen gut. Beim späten Beginn muss ich dir aber widersprechen, weil ich früh arbeite. Wir könnten uns schon um achtzehn Uhr treffen. Das wäre für mich ein guter Kompromiss."),
            partner: "Ich finde, dass unser Fest bis Mitternacht dauern sollte. Was meinst du?",
            partnerEnglish: "I think our party should last until midnight. What do you think?",
            response: "Ein Fest finde ich gut, aber Mitternacht ist mir zu spät. Wir könnten um zehn Uhr aufhören, weil ich morgens arbeiten muss.",
            responseEnglish: "I like the idea of a party, but midnight is too late for me. We could finish at ten o'clock because I have to work in the morning.",
            guided: "Acknowledge the idea, disagree politely about one detail, and propose a compromise.",
            independent: "Discuss a plan with someone whose preference differs from yours and reach a respectful agreement."
        ))

        days.append(CurriculumBuilder.review(
            42, "Review: routines and shared plans", previous: days,
            grammar: "Compare options, explain preferences, and soften disagreement. 'Ein Picknick wäre günstiger als ein Restaurant.' means 'A picnic would be cheaper than a restaurant.' 'Ich stimme dir zu, aber wir könnten früher anfangen.' means 'I agree with you, but we could start earlier.'",
            reading: ReadingPassage(
                "Nach dem Probetraining möchte die Gruppe zusammen essen. Ada schlägt ein Restaurant vor, aber Luis möchte lieber selbst kochen. Er erklärt, dass er manche Zutaten nicht gut verträgt. Als Kompromiss kochen sie bei Ada und bringen jeweils etwas mit.",
                "After the trial training session the group wants to eat together. Ada suggests a restaurant, but Luis would rather cook. He explains that he does not digest some ingredients well. As a compromise they cook at Ada's place and each bring something.",
                question: "What does the group decide to do?", answer: "They decide to cook at Ada's place and each bring something."),
            writing: WritingTask("Plan a relaxed group evening that respects different preferences.",
                checklist: ["Suggest an activity and a meal.", "Explain one preference.", "Offer a compromise or alternative."],
                model: "Wir könnten nach dem Training bei mir kochen. Ich esse lieber vegetarisch, weil mir Gemüse gut schmeckt. Jeder könnte eine Zutat mitbringen. Wenn ihr müde seid, fangen wir einfach früher an."),
            partner: "Wir möchten Sport machen und danach feiern. Wie könnte ein Plan für alle aussehen?",
            partnerEnglish: "We would like to do sport and celebrate afterward. What could a plan that suits everyone look like?",
            response: "Wir könnten zuerst am Probetraining teilnehmen und danach zusammen kochen. Ein früher Beginn wäre ein guter Kompromiss, wenn einige müde sind.",
            responseEnglish: "We could attend the trial training session first and cook together afterward. An early start would be a good compromise if some people are tired."
        ))

        days.append(CurriculumBuilder.day(
            43, "Office communication", "Clarify a request and pass on an accurate message.",
            words: [
                NewWord("die Rückfrage (plural: die Rückfragen)", "follow-up question; query", "Zur Lieferadresse habe ich noch eine Rückfrage.", "I have one more question about the delivery address."),
                NewWord("weiterleiten", "to forward", "Ich leite die Nachricht an meine Kollegin weiter.", "I am forwarding the message to my colleague."),
                NewWord("die Durchwahl (plural: die Durchwahlen)", "direct extension", "Die Durchwahl steht unter der Telefonnummer.", "The direct extension is listed below the telephone number."),
                NewWord("erreichbar", "available; reachable", "Herr Brandt ist ab vierzehn Uhr erreichbar.", "Mr. Brandt is available from two p.m."),
                NewWord("Bescheid geben", "to let someone know", "Ich gebe Ihnen nach der Besprechung Bescheid.", "I will let you know after the meeting.")
            ],
            grammar: "Use indirect information with dass: 'Sie sagt, dass Herr Brandt später erreichbar ist.' means 'She says that Mr. Brandt is available later.' A separable verb stays together at the end of a subordinate clause: 'Ich weiß, dass sie die Nachricht weiterleitet.' means 'I know that she is forwarding the message.'",
            reading: ReadingPassage(
                "Im Büro ruft ein Kunde wegen einer Lieferung an. Herr Brandt ist gerade in einer Besprechung. Seine Kollegin notiert die Rückfrage und leitet sie an ihn weiter. Sie sagt dem Kunden, dass Herr Brandt ab vierzehn Uhr erreichbar ist.",
                "A customer calls the office about a delivery. Mr. Brandt is in a meeting at the moment. His colleague notes the query and forwards it to him. She tells the customer that Mr. Brandt is available from two p.m.",
                question: "When is Mr. Brandt available?", answer: "He is available from two p.m."),
            writing: WritingTask("Leave an internal message about an imagined customer call.",
                checklist: ["Identify the topic of the call.", "Explain the requested action.", "Give an availability detail."],
                model: "Ein Kunde hat wegen der Lieferung angerufen. Er hat eine Rückfrage zur Uhrzeit. Bitte rufen Sie ihn nach Ihrer Besprechung zurück. Er ist heute bis sechzehn Uhr erreichbar."),
            partner: "Könnten Sie meine Rückfrage bitte an Frau Weber weiterleiten?",
            partnerEnglish: "Could you please forward my query to Ms. Weber?",
            response: "Ja, ich leite Ihre Rückfrage weiter. Frau Weber ist ab vierzehn Uhr erreichbar und gibt Ihnen dann Bescheid.",
            responseEnglish: "Yes, I will forward your query. Ms. Weber is available from two p.m. and will let you know then.",
            guided: "Confirm that you will forward the query and report when the colleague is available.",
            independent: "Handle a fictional office call, clarify the caller's request, and explain the next step."
        ))

        days.append(CurriculumBuilder.day(
            44, "A formal email", "Write a clear and polite request with an attachment.",
            words: [
                NewWord("der Betreff (plural: die Betreffe)", "subject line", "Der Betreff nennt den Termin und das Thema.", "The subject line names the date and the topic."),
                NewWord("der Anhang (plural: die Anhänge)", "attachment", "Im Anhang finden Sie die Liste.", "You will find the list in the attachment."),
                NewWord("bestätigen", "to confirm", "Bitte bestätigen Sie den neuen Termin.", "Please confirm the new appointment."),
                NewWord("sich beziehen auf", "to refer to", "Ich beziehe mich auf Ihre Nachricht vom Montag.", "I am referring to your message from Monday."),
                NewWord("die Rückmeldung (plural: die Rückmeldungen)", "reply; feedback", "Vielen Dank für Ihre schnelle Rückmeldung.", "Thank you for your quick reply.")
            ],
            grammar: "Könnten Sie plus an infinitive makes a formal request: 'Könnten Sie den Empfang bestätigen?' means 'Could you confirm receipt?' After a greeting ending in a comma, a following non-noun starts lowercase: 'Sehr geehrte Frau Beck, vielen Dank ...' means 'Dear Ms. Beck, thank you ...'.",
            reading: ReadingPassage(
                "Mara schreibt eine E-Mail an das Kursbüro. Im Betreff nennt sie den Namen des Kurses. Sie bezieht sich auf ein Gespräch vom Montag und schickt die gewünschte Liste im Anhang. Zum Schluss bittet sie um eine kurze Bestätigung.",
                "Mara writes an email to the course office. In the subject line she names the course. She refers to a conversation from Monday and sends the requested list as an attachment. At the end she asks for a brief confirmation.",
                question: "What does Mara ask for at the end of her email?", answer: "She asks for a brief confirmation."),
            writing: WritingTask("Write a brief formal email sending an imagined attendance list.",
                checklist: ["Use a formal greeting.", "Refer to an earlier message and mention the attachment.", "Request confirmation and close politely."],
                model: "Sehr geehrte Frau Beck, vielen Dank für Ihre Nachricht vom Montag. Im Anhang finden Sie die gewünschte Liste. Könnten Sie den Empfang bitte bestätigen?\nMit freundlichen Grüßen\nMara Winter"),
            partner: "Bitte schicken Sie uns die Liste per E-Mail und nennen Sie den Kurs im Betreff.",
            partnerEnglish: "Please email us the list and name the course in the subject line.",
            response: "Sehr geehrte Frau Beck, im Anhang finden Sie die Liste für den Abendkurs. Könnten Sie mir den Empfang bitte bestätigen?",
            responseEnglish: "Dear Ms. Beck, you will find the list for the evening course in the attachment. Could you please confirm receipt?",
            guided: "Use a formal greeting, mention an attachment, and ask politely for confirmation.",
            independent: "Compose a concise formal request that clearly identifies its topic and desired next action."
        ))

        days.append(CurriculumBuilder.day(
            45, "A service complaint", "Describe a service problem factually and request a solution.",
            words: [
                NewWord("die Beschwerde (plural: die Beschwerden)", "complaint", "Meine Beschwerde betrifft die Reinigung.", "My complaint concerns the cleaning."),
                NewWord("vereinbaren", "to arrange; to agree on", "Wir haben eine Reinigung für Dienstag vereinbart.", "We arranged a cleaning for Tuesday."),
                NewWord("unvollständig", "incomplete", "Die vereinbarte Reinigung war unvollständig.", "The agreed cleaning was incomplete."),
                NewWord("die Lösung (plural: die Lösungen)", "solution", "Ich hoffe auf eine schnelle Lösung.", "I hope for a quick solution."),
                NewWord("nachbessern", "to correct; to put right", "Könnten Sie die Reinigung bitte nachbessern?", "Could you please put the cleaning right?")
            ],
            grammar: "Use the Perfekt to establish facts, then könnten for a polite request: 'Wir haben einen Termin vereinbart, aber niemand ist gekommen.' means 'We arranged an appointment, but nobody came.' 'Könnten Sie einen neuen Termin anbieten?' means 'Could you offer a new appointment?'",
            reading: ReadingPassage(
                "Lea hat eine Reinigung für ihr kleines Büro gebucht. Am Dienstag ist der Dienst gekommen, hat aber die Küche nicht gereinigt. Lea schreibt eine sachliche Beschwerde und nennt den vereinbarten Umfang. Sie fragt, ob jemand am Donnerstag nachbessern kann.",
                "Lea booked a cleaning service for her small office. On Tuesday the service came but did not clean the kitchen. Lea writes a factual complaint and states the agreed scope. She asks whether someone can put it right on Thursday.",
                question: "Which part of the office was not cleaned?", answer: "The kitchen was not cleaned."),
            writing: WritingTask("Write a factual message about an incomplete cleaning service.",
                checklist: ["State what was arranged.", "Describe the specific problem.", "Ask for a practical solution."],
                model: "Wir haben für Dienstag eine Reinigung des Büros und der Küche vereinbart. Leider ist die Küche nicht gereinigt worden. Könnten Sie am Donnerstag nachbessern? Bitte geben Sie mir eine kurze Rückmeldung."),
            partner: "Sie haben uns eine Beschwerde geschickt. Was genau hat bei unserem Dienst nicht geklappt?",
            partnerEnglish: "You sent us a complaint. What exactly went wrong with our service?",
            response: "Wir haben eine Reinigung des Büros und der Küche vereinbart. Die Küche ist noch schmutzig. Könnten Sie am Donnerstag nachbessern?",
            responseEnglish: "We arranged a cleaning of the office and the kitchen. The kitchen is still dirty. Could you put it right on Thursday?",
            guided: "State the agreement and the observed problem, then request one concrete next step politely.",
            independent: "Explain an imagined service problem calmly, with a date, a factual detail, and a proposed solution."
        ))

        days.append(CurriculumBuilder.day(
            46, "Returning a purchase", "Explain a product fault and ask about return options.",
            words: [
                NewWord("der Kassenbon (plural: die Kassenbons)", "receipt", "Den Kassenbon habe ich noch in meiner Tasche.", "I still have the receipt in my bag."),
                NewWord("umtauschen", "to exchange", "Ich möchte die Lampe umtauschen.", "I would like to exchange the lamp."),
                NewWord("die Rückgabe (plural: die Rückgaben)", "return of a purchase", "Wo kann ich nach einer Rückgabe fragen?", "Where can I ask about returning a purchase?"),
                NewWord("defekt", "faulty; defective", "Der Schalter ist leider defekt.", "Unfortunately, the switch is faulty."),
                NewWord("die Erstattung (plural: die Erstattungen)", "refund; reimbursement", "Ist eine Erstattung in diesem Fall möglich?", "Is a refund possible in this case?")
            ],
            grammar: "Describe the fault with dass and request options with könnte: 'Ich habe bemerkt, dass der Schalter defekt ist.' means 'I noticed that the switch is faulty.' 'Könnte ich die Lampe umtauschen?' means 'Could I exchange the lamp?' Asking about options does not assume a particular store policy.",
            reading: ReadingPassage(
                "Emil hat am Freitag eine Schreibtischlampe gekauft. Zu Hause hat er bemerkt, dass der Schalter nicht funktioniert. Er bringt die Lampe und den Kassenbon ins Geschäft. Dort fragt er, ob ein Umtausch oder eine Erstattung möglich ist.",
                "Emil bought a desk lamp on Friday. At home he noticed that the switch does not work. He brings the lamp and the receipt to the shop. There he asks whether an exchange or a refund is possible.",
                question: "What is wrong with Emil's lamp?", answer: "The switch does not work."),
            writing: WritingTask("Write a short inquiry to a shop about a faulty item.",
                checklist: ["Say when and what you bought.", "Describe the fault precisely.", "Ask about an exchange or refund."],
                model: "Ich habe am Freitag eine Schreibtischlampe bei Ihnen gekauft. Leider funktioniert der Schalter nicht. Den Kassenbon habe ich noch. Könnte ich die Lampe umtauschen, oder ist eine Erstattung möglich?"),
            partner: "Was möchten Sie zurückgeben, und welches Problem hat der Artikel?",
            partnerEnglish: "What would you like to return, and what problem does the item have?",
            response: "Ich möchte diese Lampe zurückgeben, weil der Schalter defekt ist. Den Kassenbon habe ich dabei. Wäre ein Umtausch möglich?",
            responseEnglish: "I would like to return this lamp because the switch is faulty. I have the receipt with me. Would an exchange be possible?",
            guided: "Identify the item, explain the fault with weil, and ask politely about an exchange.",
            independent: "Handle an imagined return conversation without assuming the shop's policy; explain the problem and ask for options."
        ))

        days.append(CurriculumBuilder.day(
            47, "Understanding documents", "Ask neutral questions about fictional insurance correspondence.",
            words: [
                NewWord("die Versicherung (plural: die Versicherungen)", "insurance; insurance company", "Die Versicherung hat mir einen Brief geschickt.", "The insurance company sent me a letter."),
                NewWord("der Vertrag (plural: die Verträge)", "contract", "Die Nummer steht oben auf dem Vertrag.", "The number is at the top of the contract."),
                NewWord("der Beitrag (plural: die Beiträge)", "contribution; premium", "Im Brief steht der monatliche Beitrag.", "The letter states the monthly premium."),
                NewWord("die Unterlage (plural: die Unterlagen)", "document", "Welche Unterlagen fehlen noch?", "Which documents are still missing?"),
                NewWord("gültig", "valid", "Bis wann ist diese Bescheinigung gültig?", "Until when is this certificate valid?")
            ],
            grammar: "In an indirect question with a question word, put the verb at the end: 'Könnten Sie erklären, welche Unterlagen fehlen?' means 'Could you explain which documents are missing?' 'Ich möchte wissen, bis wann die Bescheinigung gültig ist.' means 'I would like to know until when the certificate is valid.'",
            reading: ReadingPassage(
                "In einer erfundenen Übung erhält Niko einen Brief seiner Versicherung. Der Brief nennt einen Beitrag und bittet um eine Unterlage. Niko versteht nicht, welche Bescheinigung gemeint ist. Er schreibt eine Rückfrage, ohne persönliche Vertragsdaten in der Lerngruppe zu zeigen.",
                "In a fictional exercise Niko receives a letter from his insurance company. The letter states a premium and asks for a document. Niko does not understand which certificate is meant. He writes a query without showing personal contract details to the study group.",
                question: "What does Niko need to clarify?", answer: "He needs to clarify which certificate the letter requests."),
            writing: WritingTask("Using only an imagined situation, ask an office to clarify a document request. Do not include real policy details or make insurance decisions.",
                checklist: ["Refer to the document request.", "Ask which document is needed.", "Ask how it can be submitted."],
                model: "Vielen Dank für Ihren Brief. Ich habe eine Rückfrage zu den Unterlagen. Könnten Sie erklären, welche Bescheinigung Sie benötigen? Bitte teilen Sie mir auch mit, wie ich sie einreichen kann."),
            partner: "Sie haben eine Frage zu unserem Brief. Welche Information ist noch unklar?",
            partnerEnglish: "You have a question about our letter. Which information is still unclear?",
            response: "Ich möchte wissen, welche Unterlage noch fehlt. Könnten Sie mir auch sagen, bis wann ich sie einreichen soll?",
            responseEnglish: "I would like to know which document is still missing. Could you also tell me when I should submit it by?",
            guided: "Ask two indirect questions about a fictional document, using welche and bis wann.",
            independent: "Clarify the wording of an imagined insurance letter without sharing real data or discussing which policy to choose."
        ))

        days.append(CurriculumBuilder.day(
            48, "An official appointment", "Prepare questions about an appointment and required documents.",
            words: [
                NewWord("die Behörde (plural: die Behörden)", "public authority; government office", "Die Behörde ist mit dem Bus gut erreichbar.", "The government office is easy to reach by bus."),
                NewWord("das Formular (plural: die Formulare)", "form", "Ich habe das Formular zu Hause ausgefüllt.", "I filled out the form at home."),
                NewWord("der Nachweis (plural: die Nachweise)", "proof; supporting document", "Welchen Nachweis soll ich mitbringen?", "Which supporting document should I bring?"),
                NewWord("die Bearbeitung (plural: die Bearbeitungen)", "processing", "Wie lange dauert die Bearbeitung ungefähr?", "Approximately how long does processing take?"),
                NewWord("verschieben", "to reschedule; to postpone", "Ich muss meinen Termin auf nächste Woche verschieben.", "I have to reschedule my appointment for next week.")
            ],
            grammar: "Use wenn for an appointment condition: 'Wenn ein Nachweis fehlt, frage ich nach.' means 'If a supporting document is missing, I ask.' For a polite rescheduling request, say 'Könnten wir den Termin verschieben?' meaning 'Could we reschedule the appointment?' Requirements depend on the specific office and procedure.",
            reading: ReadingPassage(
                "Jana hat am Mittwoch einen Termin bei einer Behörde. In der Bestätigung steht, welche Unterlagen sie mitbringen soll. Sie hat das Formular ausgefüllt, ist aber bei einem Nachweis unsicher. Deshalb fragt sie vor dem Termin beim Büro nach.",
                "Jana has an appointment at a government office on Wednesday. The confirmation states which documents she should bring. She has filled out the form but is unsure about one supporting document. She therefore contacts the office before the appointment.",
                question: "Why does Jana contact the office before her appointment?", answer: "She is unsure about one supporting document."),
            writing: WritingTask("Ask to reschedule a fictional office appointment and clarify preparation.",
                checklist: ["Identify the existing appointment without real personal data.", "Request a different day.", "Ask about one required document."],
                model: "Ich habe am Mittwoch einen Termin bei Ihnen. Leider kann ich an diesem Tag nicht kommen. Könnten wir den Termin auf nächste Woche verschieben? Bitte sagen Sie mir auch, welchen Nachweis ich mitbringen soll."),
            partner: "Sie möchten Ihren Termin verschieben. Wann könnten Sie stattdessen kommen?",
            partnerEnglish: "You would like to reschedule your appointment. When could you come instead?",
            response: "Ich könnte nächsten Dienstagvormittag kommen. Könnten Sie mir bitte sagen, welche Unterlagen ich für den Termin brauche?",
            responseEnglish: "I could come next Tuesday morning. Could you please tell me which documents I need for the appointment?",
            guided: "Offer an alternative time with könnte and ask an indirect question about documents.",
            independent: "Arrange a fictional official appointment and clarify timing and preparation without assuming universal document requirements."
        ))

        days.append(CurriculumBuilder.review(
            49, "Review: requests and solutions", previous: days,
            grammar: "Combine a factual report with a polite request and an indirect question. 'Ich habe das Formular geschickt. Könnten Sie mir sagen, ob es angekommen ist?' means 'I sent the form. Could you tell me whether it arrived?' Indirect questions put the conjugated verb last.",
            reading: ReadingPassage(
                "In einer Büroübung hat Kim ein Formular als Anhang geschickt. Sie hat noch keine Rückmeldung erhalten. Am Telefon bittet sie darum, die Nachricht an die zuständige Person weiterzuleiten. Außerdem fragt sie, ob für den Termin noch ein Nachweis fehlt.",
                "In an office exercise Kim sent a form as an attachment. She has not yet received a reply. On the telephone she asks for the message to be forwarded to the person responsible. She also asks whether a supporting document is still missing for the appointment.",
                question: "What does Kim want to know about her appointment?", answer: "She wants to know whether a supporting document is still missing."),
            writing: WritingTask("Write a polite follow-up about a fictional form sent to an office.",
                checklist: ["State what you already sent.", "Ask for confirmation.", "Ask about any missing documents."],
                model: "Am Montag habe ich Ihnen das Formular im Anhang geschickt. Bisher habe ich keine Rückmeldung erhalten. Könnten Sie den Empfang bitte bestätigen? Bitte sagen Sie mir auch, ob noch ein Nachweis fehlt."),
            partner: "Sie haben bereits eine Nachricht geschickt. Was möchten Sie jetzt klären?",
            partnerEnglish: "You have already sent a message. What would you like to clarify now?",
            response: "Ich habe das Formular geschickt und möchte den Empfang bestätigen lassen. Könnten Sie mir sagen, ob für den Termin noch eine Unterlage fehlt?",
            responseEnglish: "I sent the form and would like to have receipt confirmed. Could you tell me whether a document is still missing for the appointment?"
        ))

        days.append(CurriculumBuilder.day(
            50, "Media and local news", "Summarize a news item and distinguish facts from opinions.",
            words: [
                NewWord("die Nachricht (plural: die Nachrichten)", "news item; message", "Diese Nachricht betrifft unsere Stadtbibliothek.", "This news item concerns our city library."),
                NewWord("die Quelle (plural: die Quellen)", "source", "Als Quelle nennt der Bericht die Stadtverwaltung.", "The report cites the city administration as its source."),
                NewWord("berichten", "to report", "Die Zeitung berichtet über den neuen Park.", "The newspaper reports on the new park."),
                NewWord("die Überschrift (plural: die Überschriften)", "headline", "Die Überschrift ist kürzer als der ganze Bericht.", "The headline is shorter than the whole report."),
                NewWord("überprüfen", "to check; to verify", "Ich überprüfe das Datum vor dem Weiterleiten.", "I check the date before forwarding it.")
            ],
            grammar: "Report a statement with dass: 'Die Zeitung berichtet, dass die Bibliothek länger öffnet.' means 'The newspaper reports that the library will stay open longer.' Separate an opinion with 'Ich finde, dass ...', meaning 'I think that ...'. Both subordinate clauses place the conjugated verb last.",
            reading: ReadingPassage(
                "In einer erfundenen Lokalnachricht steht, dass die Bibliothek ab Montag länger öffnet. Als Quelle wird eine Mitteilung der Stadt genannt. Sami überprüft das Datum, bevor er die Nachricht weiterleitet. Er findet die Änderung gut, weil er abends Bücher ausleihen möchte.",
                "A fictional local news item says that the library will stay open longer starting Monday. A city announcement is cited as the source. Sami checks the date before forwarding the item. He likes the change because he wants to borrow books in the evenings.",
                question: "What does Sami check before forwarding the news item?", answer: "He checks the date."),
            writing: WritingTask("Summarize the fictional library news for a friend and add your opinion.",
                checklist: ["State the main reported change.", "Mention the source.", "Clearly label your own opinion."],
                model: "Die Lokalzeitung berichtet, dass die Bibliothek ab Montag länger öffnet. Als Quelle nennt sie eine Mitteilung der Stadt. Ich finde die Änderung praktisch, weil ich tagsüber arbeite. Vor einem Besuch würde ich die Öffnungszeiten noch überprüfen."),
            partner: "Was berichtet die Zeitung über die Bibliothek, und wie findest du das?",
            partnerEnglish: "What does the newspaper report about the library, and what do you think about it?",
            response: "Die Zeitung berichtet, dass die Bibliothek länger öffnet. Ich finde das gut, weil ich abends mehr Zeit habe.",
            responseEnglish: "The newspaper reports that the library will stay open longer. I think that is good because I have more time in the evenings.",
            guided: "Give one reported fact with dass and one clearly identified personal opinion.",
            independent: "Summarize an imagined local news item, identify its source, and explain what you would check before sharing it."
        ))

        days.append(CurriculumBuilder.day(
            51, "Technology problems", "Describe a technical fault and ask for clear help.",
            words: [
                NewWord("die Verbindung (plural: die Verbindungen)", "connection", "Die Verbindung bricht während des Gesprächs ab.", "The connection drops during the conversation."),
                NewWord("neu starten", "to restart", "Ich habe den Computer neu gestartet.", "I restarted the computer."),
                NewWord("die Fehlermeldung (plural: die Fehlermeldungen)", "error message", "Nach dem Öffnen erscheint eine Fehlermeldung.", "An error message appears after opening it."),
                NewWord("speichern", "to save", "Bitte speichern Sie die Datei vor dem Neustart.", "Please save the file before restarting."),
                NewWord("der Bildschirm (plural: die Bildschirme)", "screen; monitor", "Auf dem Bildschirm sehe ich nur ein graues Feld.", "On the screen I can only see a gray box.")
            ],
            grammar: "Use wenn to describe a reproducible problem and the Perfekt for attempted steps: 'Wenn ich die Datei öffne, erscheint eine Fehlermeldung.' means 'When I open the file, an error message appears.' 'Ich habe das Programm neu gestartet.' means 'I restarted the program.'",
            reading: ReadingPassage(
                "Während eines Onlinekurses verliert Renas Laptop die Verbindung. Sie speichert zuerst ihre Notizen. Dann startet sie das Programm neu, aber die Fehlermeldung erscheint wieder. Sie beschreibt dem Kursleiter genau, was auf dem Bildschirm steht.",
                "During an online course Rena's laptop loses its connection. She saves her notes first. Then she restarts the program, but the error message appears again. She describes to the instructor exactly what is on the screen.",
                question: "What does Rena do before restarting the program?", answer: "She saves her notes."),
            writing: WritingTask("Write a support request about an imagined course application that will not open.",
                checklist: ["Describe when the problem happens.", "Report one step already tried.", "Ask for the next step."],
                model: "Wenn ich die Kursanwendung öffne, erscheint eine Fehlermeldung. Auf dem Bildschirm steht, dass keine Verbindung möglich ist. Ich habe das Programm schon neu gestartet. Könnten Sie mir den nächsten Schritt erklären?"),
            partner: "Was sehen Sie auf dem Bildschirm, und was haben Sie schon versucht?",
            partnerEnglish: "What do you see on the screen, and what have you already tried?",
            response: "Ich sehe eine Fehlermeldung zur Verbindung. Ich habe meine Datei gespeichert und das Programm neu gestartet, aber das Problem bleibt.",
            responseEnglish: "I see an error message about the connection. I saved my file and restarted the program, but the problem remains.",
            guided: "Explain when the fault appears using wenn, then name one attempted action in the Perfekt.",
            independent: "Describe an imagined technology problem in a clear sequence and ask for instructions you can follow."
        ))

        days.append(CurriculumBuilder.day(
            52, "Online safety", "Discuss cautious responses to suspicious messages using fictional details.",
            words: [
                NewWord("das Passwort (plural: die Passwörter)", "password", "Mein Passwort teile ich nicht im Chat.", "I do not share my password in the chat."),
                NewWord("verdächtig", "suspicious", "Die unerwartete Nachricht wirkt verdächtig.", "The unexpected message seems suspicious."),
                NewWord("der Absender (plural: die Absender)", "sender", "Ich überprüfe den Absender der Nachricht.", "I check the sender of the message."),
                NewWord("die Einstellung (plural: die Einstellungen)", "setting", "Die Einstellungen für den Datenschutz sind im Menü.", "The privacy settings are in the menu."),
                NewWord("weitergeben", "to pass on; to share", "Ich gebe keine Zugangsdaten weiter.", "I do not share login details.")
            ],
            grammar: "Wenn introduces a condition, while nicht negates an action: 'Wenn eine Nachricht verdächtig wirkt, öffne ich den Link nicht.' means 'If a message seems suspicious, I do not open the link.' In a dass clause, a separable verb remains joined: 'Ich weiß, dass sie keine Daten weitergibt.' means 'I know that she does not share any data.'",
            reading: ReadingPassage(
                "In einer erfundenen Übung bekommt Jule eine Nachricht über ein angeblich gesperrtes Konto. Der unbekannte Absender fordert ein Passwort an. Jule gibt keine Daten weiter und öffnet den Link nicht. Sie öffnet die bekannte Anwendung selbst und fragt dort beim Support nach.",
                "In a fictional exercise Jule receives a message about a supposedly locked account. The unknown sender asks for a password. Jule does not share any data and does not open the link. She opens the familiar application herself and contacts support there.",
                question: "How does Jule contact support?", answer: "She opens the familiar application herself and contacts support there."),
            writing: WritingTask("Describe a cautious response to a fictional suspicious message. Do not include real passwords, addresses, or account details.",
                checklist: ["Name a suspicious feature.", "Say what you will not share or open.", "Describe a separate way to check the message."],
                model: "Die Nachricht wirkt verdächtig, weil der Absender unbekannt ist. Ich gebe mein Passwort nicht weiter. Den Link in der Nachricht öffne ich nicht. Stattdessen öffne ich die bekannte Anwendung selbst und frage beim Support nach."),
            partner: "Eine unbekannte Person fragt im Chat nach deinem Passwort. Wie reagierst du?",
            partnerEnglish: "An unknown person asks for your password in the chat. How do you respond?",
            response: "Ich gebe mein Passwort nicht weiter. Wenn ich unsicher bin, frage ich über die bekannte Anwendung beim Support nach.",
            responseEnglish: "I do not share my password. If I am unsure, I contact support through the familiar application.",
            guided: "Use nicht to reject sharing data and wenn to explain a safe checking step, without entering any real data.",
            independent: "Explain how you would handle a fictional suspicious account message, keeping all real personal details out of your answer."
        ))

        days.append(CurriculumBuilder.day(
            53, "Everyday environmental choices", "Suggest manageable changes and explain their purpose.",
            words: [
                NewWord("der Abfall (plural: die Abfälle)", "waste; rubbish", "Beim Fest ist weniger Abfall entstanden als letztes Jahr.", "The party produced less waste than last year."),
                NewWord("vermeiden", "to avoid", "Wir möchten unnötige Verpackungen vermeiden.", "We would like to avoid unnecessary packaging."),
                NewWord("wiederverwenden", "to reuse", "Diese Gläser können wir wiederverwenden.", "We can reuse these jars."),
                NewWord("die Verpackung (plural: die Verpackungen)", "packaging; package", "Die Verpackung besteht aus Papier.", "The packaging is made of paper."),
                NewWord("sparsam", "economical; sparing", "Wir gehen sparsam mit Wasser um.", "We use water sparingly.")
            ],
            grammar: "Use weniger for smaller amounts and mehr for larger amounts: 'Wir produzieren weniger Abfall als früher.' means 'We produce less waste than before.' Use weil to explain a choice: 'Wir verwenden die Gläser wieder, weil sie noch gut sind.' means 'We reuse the jars because they are still in good condition.'",
            reading: ReadingPassage(
                "Für das nächste Hoffest möchte die Hausgemeinschaft weniger Abfall produzieren. Alle bringen eigene Teller und Tassen mit. Alte Gläser werden als kleine Vasen wiederverwendet. Nach dem Fest prüft die Gruppe die örtlichen Hinweise zur Abfalltrennung.",
                "For the next courtyard party the residents want to produce less waste. Everyone brings their own plates and cups. Old jars are reused as small vases. After the party the group checks the local waste-sorting instructions.",
                question: "How does the group reuse old jars?", answer: "They use them as small vases."),
            writing: WritingTask("Suggest practical ways to reduce waste at a shared event.",
                checklist: ["Propose two specific actions.", "Explain one reason.", "Mention a local detail to check."],
                model: "Wir könnten eigene Tassen zum Fest mitbringen. Die alten Gläser können wir als Vasen wiederverwenden. So brauchen wir weniger neue Verpackungen. Nach dem Fest sollten wir die örtlichen Hinweise zur Abfalltrennung prüfen."),
            partner: "Wie könnten wir bei unserem nächsten Fest weniger Abfall produzieren?",
            partnerEnglish: "How could we produce less waste at our next party?",
            response: "Wir könnten eigene Teller mitbringen und alte Gläser wiederverwenden. So vermeiden wir unnötige Verpackungen. So produzieren wir weniger Abfall.",
            responseEnglish: "We could bring our own plates and reuse old jars. That way we avoid unnecessary packaging. That way we produce less waste.",
            guided: "Suggest two concrete changes with könnten and compare the amount of waste using weniger.",
            independent: "Develop a realistic low-waste event plan, explaining a benefit and one practical detail the group must check."
        ))

        days.append(CurriculumBuilder.day(
            54, "Choosing transport", "Compare transport options for a particular journey.",
            words: [
                NewWord("die Strecke (plural: die Strecken)", "route; distance", "Die Strecke zur Arbeit ist sechs Kilometer lang.", "The distance to work is six kilometers."),
                NewWord("der Radweg (plural: die Radwege)", "cycle path", "Der neue Radweg führt am Fluss entlang.", "The new cycle path runs along the river."),
                NewWord("der Umstieg (plural: die Umstiege)", "change; transfer", "Mit dem Bus brauche ich nur einen Umstieg.", "By bus I only need one transfer."),
                NewWord("zuverlässiger", "more reliable", "Die Straßenbahn ist morgens zuverlässiger als der Bus.", "The tram is more reliable than the bus in the mornings."),
                NewWord("die Fahrgemeinschaft (plural: die Fahrgemeinschaften)", "carpool", "An Regentagen fahren wir in einer Fahrgemeinschaft.", "On rainy days we travel in a carpool.")
            ],
            grammar: "Compare two choices with a comparative plus als: 'Das Fahrrad ist auf dieser Strecke schneller als der Bus.' means 'The bicycle is faster than the bus on this route.' Irregular gut becomes besser: 'Die Bahn passt besser zu meinem Plan.' means 'The train fits my plan better.' Use wenn for weather-dependent choices.",
            reading: ReadingPassage(
                "Clara beginnt eine neue Arbeit sechs Kilometer von zu Hause entfernt. Mit dem Bus muss sie einmal umsteigen. Der Radweg am Fluss ist direkter, deshalb ist sie mit dem Fahrrad oft schneller. Wenn es stark regnet, fährt sie mit einer Kollegin in einer Fahrgemeinschaft.",
                "Clara starts a new job six kilometers from home. By bus she has to change once. The cycle path by the river is more direct, so she is often faster by bicycle. When it rains heavily, she travels in a carpool with a colleague.",
                question: "What does Clara do when it rains heavily?", answer: "She travels in a carpool with a colleague."),
            writing: WritingTask("Compare two ways of reaching an imagined new workplace.",
                checklist: ["Describe the route or distance.", "Compare time or reliability.", "Choose an option and give a backup."],
                model: "Meine neue Arbeit ist sechs Kilometer entfernt. Mit dem Fahrrad bin ich schneller als mit dem Bus. Deshalb nehme ich bei gutem Wetter den Radweg am Fluss. Wenn es stark regnet, nutze ich die Fahrgemeinschaft."),
            partner: "Wie kommst du am besten zur Arbeit, wenn der Bus oft zu spät ist?",
            partnerEnglish: "What is the best way for you to get to work if the bus is often late?",
            response: "Auf meiner Strecke ist das Fahrrad schneller und zuverlässiger als der Bus. Wenn es stark regnet, fahre ich mit einer Kollegin.",
            responseEnglish: "On my route, the bicycle is faster and more reliable than the bus. If it rains heavily, I travel with a colleague.",
            guided: "Compare two options with als and add a weather-dependent backup using wenn.",
            independent: "Choose transport for an imagined commute, balancing distance, reliability, and a practical backup."
        ))

        days.append(CurriculumBuilder.day(
            55, "Cooperating with neighbors", "Organize a shared task and resolve a small disagreement.",
            words: [
                NewWord("die Absprache (plural: die Absprachen)", "agreement; arrangement", "Unsere Absprache steht auf dem Zettel im Flur.", "Our agreement is written on the note in the hallway."),
                NewWord("Rücksicht nehmen", "to be considerate", "Beim Bohren nehmen wir Rücksicht auf die Nachbarn.", "When drilling, we are considerate of the neighbors."),
                NewWord("die Unterstützung (plural: die Unterstützungen)", "support; assistance", "Für die Gartenarbeit brauche ich etwas Unterstützung.", "I need some help with the gardening."),
                NewWord("abwechselnd", "in turns; alternately", "Wir gießen die Pflanzen abwechselnd.", "We take turns watering the plants."),
                NewWord("der Aushang (plural: die Aushänge)", "posted notice", "Der Aushang informiert über den gemeinsamen Gartentag.", "The posted notice gives information about the shared gardening day.")
            ],
            grammar: "Würden plus an infinitive makes a cooperative request: 'Würden Sie am Samstag mithelfen?' means 'Would you help on Saturday?' Combine consideration with weil or wenn: 'Wir beginnen später, weil eine Nachbarin nachts arbeitet.' means 'We start later because a neighbor works at night.'",
            reading: ReadingPassage(
                "Im Haus hängt ein Aushang für einen gemeinsamen Gartentag. Zuerst möchte die Gruppe um acht Uhr anfangen. Eine Nachbarin erklärt, dass sie nach ihrer Nachtschicht schlafen muss. Die anderen nehmen Rücksicht und verschieben die lauten Arbeiten auf den Nachmittag.",
                "A notice for a shared gardening day is posted in the building. At first the group wants to start at eight o'clock. A neighbor explains that she needs to sleep after her night shift. The others are considerate and move the noisy work to the afternoon.",
                question: "Why does the group move the noisy work to the afternoon?", answer: "A neighbor needs to sleep after her night shift."),
            writing: WritingTask("Draft a friendly notice organizing shared garden work.",
                checklist: ["Give a time and task.", "Request help politely.", "Include a considerate arrangement."],
                model: "Am Samstag möchten wir ab vierzehn Uhr den Garten aufräumen. Würden Sie eine Stunde mithelfen? Wir beginnen erst am Nachmittag, weil eine Nachbarin morgens schlafen muss. Die Pflanzen könnten wir danach abwechselnd gießen."),
            partner: "Wir brauchen Unterstützung im Garten, aber einige Nachbarn brauchen morgens Ruhe. Was schlägst du vor?",
            partnerEnglish: "We need help in the garden, but some neighbors need quiet in the morning. What do you suggest?",
            response: "Wir könnten erst am Nachmittag anfangen und die Aufgaben aufteilen, weil einige Nachbarn morgens Ruhe brauchen. So nehmen wir Rücksicht auf die Nachbarn.",
            responseEnglish: "We could wait until the afternoon to start and divide up the tasks because some neighbors need quiet in the morning. That way we are considerate of the neighbors.",
            guided: "Suggest a considerate time with könnten and explain the reason using weil.",
            independent: "Agree on a shared neighborhood task, dividing responsibilities and responding respectfully to a neighbor's concern."
        ))

        days.append(CurriculumBuilder.review(
            56, "Review: connected everyday decisions", previous: days,
            grammar: "Link reported information, comparisons, and conditions. 'Ich habe gelesen, dass der Radweg fertig ist.' means 'I read that the cycle path is finished.' 'Wenn es trocken bleibt, wäre das Fahrrad praktischer als das Auto.' means 'If it stays dry, the bicycle would be more practical than the car.'",
            reading: ReadingPassage(
                "Die Hausgemeinschaft plant einen Gartentag und liest dazu eine lokale Nachricht über den neuen Radweg. Einige möchten ihre Geräte mit dem Fahrrad bringen, weil die Strecke kurz ist. Eine verdächtige Nachricht mit einem unbekannten Link leiten sie nicht weiter. Stattdessen schreiben sie die Absprachen auf einen Aushang und wollen alte Töpfe wiederverwenden.",
                "The residents plan a gardening day and read a local news item about the new cycle path. Some want to bring their tools by bicycle because the distance is short. They do not forward a suspicious message with an unknown link. Instead, they write the arrangements on a posted notice and want to reuse old pots.",
                question: "How do the residents share their arrangements?", answer: "They write the arrangements on a posted notice."),
            writing: WritingTask("Write a neighborhood update connecting a shared task, transport, and reuse.",
                checklist: ["State a practical arrangement.", "Compare or explain a transport choice.", "Suggest reuse and considerate cooperation."],
                model: "Unser Gartentag beginnt am Samstag um vierzehn Uhr. Für die kurze Strecke ist das Fahrrad praktischer als das Auto. Wir könnten alte Töpfe wiederverwenden, weil sie noch gut sind. Wenn jeder eine Aufgabe übernimmt, sind wir früher fertig."),
            partner: "Wie organisieren wir den Gartentag so, dass alle informiert sind und gut mithelfen können?",
            partnerEnglish: "How can we organize the gardening day so that everyone is informed and can help effectively?",
            response: "Wir könnten die Absprachen auf einen Aushang schreiben und die Aufgaben aufteilen. Für kurze Strecken nehmen wir das Fahrrad, und alte Töpfe verwenden wir wieder.",
            responseEnglish: "We could write the arrangements on a posted notice and divide up the tasks. We take our bicycles for short distances and reuse old pots."
        ))

        return days
    }()
}
