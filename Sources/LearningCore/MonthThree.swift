enum MonthThree {
    static let days: [CurriculumDay] = {
        var days: [CurriculumDay] = []

        days.append(CurriculumBuilder.day(
            57, "Opinions and reasons", "State a preference and support it with a practical reason.",
            words: [
                NewWord("meiner Ansicht nach", "in my view", "Meiner Ansicht nach brauchen wir mehr Bänke.", "In my view, we need more benches."),
                NewWord("überzeugend", "convincing", "Dein Beispiel ist überzeugend.", "Your example is convincing."),
                NewWord("begründen", "to give reasons for", "Kannst du deine Entscheidung begründen?", "Can you give reasons for your decision?"),
                NewWord("der Standpunkt (Plural: die Standpunkte)", "viewpoint", "Ich verstehe deinen Standpunkt.", "I understand your viewpoint."),
                NewWord("zustimmen", "to agree", "In diesem Punkt stimme ich dir zu.", "I agree with you on this point.")
            ],
            grammar: "Use obwohl for a contrast; its conjugated verb goes last. 'Obwohl der Park klein ist, gehe ich gern dorthin.' means 'Although the park is small, I like going there.' The main clause starts with the verb after an initial obwohl clause.",
            reading: ReadingPassage(
                "Im Haus wird über einen Fahrradraum gesprochen. Lea findet die Idee gut, weil im Flur oft Fahrräder stehen. Obwohl der Umbau Geld kostet, stimmt sie dem Vorschlag zu.",
                "Residents are discussing a bicycle room in the building. Lea likes the idea because bicycles are often left in the hallway. Although the conversion costs money, she agrees with the proposal.",
                question: "Why does Lea support the bicycle room?", answer: "Because bicycles are often left in the hallway."),
            writing: WritingTask(
                "Write a message to your neighbours giving your opinion about a shared bicycle room.",
                checklist: ["State your opinion.", "Give a concrete reason.", "Acknowledge one disadvantage."],
                model: "Meiner Ansicht nach ist ein Fahrradraum sinnvoll. Im Flur brauchen wir mehr Platz. Obwohl der Umbau teuer ist, unterstütze ich die Idee."),
            partner: "Findest du einen Fahrradraum im Haus sinnvoll? Warum?",
            partnerEnglish: "Do you think a bicycle room in the building makes sense? Why?",
            response: "Ich finde die Idee sinnvoll, weil der Flur dann frei bleibt. Obwohl es Geld kostet, stimme ich zu.",
            responseEnglish: "I think the idea makes sense because the hallway will then stay clear. Although it costs money, I agree.",
            guided: "Support the bicycle room with one reason, then use although to mention the cost.",
            independent: "Give your own view on a shared facility and explain one benefit and one drawback."
        ))

        days.append(CurriculumBuilder.day(
            58, "Comparing options", "Compare two realistic choices before making a decision.",
            words: [
                NewWord("preiswerter", "less expensive", "Das Monatsticket ist preiswerter als vier Wochenkarten.", "The monthly ticket is less expensive than four weekly tickets."),
                NewWord("zuverlässig", "reliable", "Die neue Buslinie ist zuverlässig.", "The new bus route is reliable."),
                NewWord("dagegen", "by contrast", "Der Bus ist günstig, die Bahn dagegen ist schneller.", "The bus is cheap; the train, by contrast, is faster."),
                NewWord("die Auswahl (Plural: die Auswahlen)", "selection", "Die Auswahl an Leihrädern ist groß.", "The selection of rental bicycles is large."),
                NewWord("abwägen", "to weigh up", "Wir müssen Preis und Fahrzeit abwägen.", "We need to weigh up price and travel time.")
            ],
            grammar: "Compare unequal things with a comparative plus als, and equal things with so ... wie. 'Der Zug ist schneller als der Bus, aber genauso teuer wie das Auto.' means 'The train is faster than the bus but just as expensive as the car.'",
            reading: ReadingPassage(
                "Mira vergleicht zwei Wege zur Arbeit. Mit dem Bus braucht sie vierzig Minuten, mit dem Fahrrad nur fünfundzwanzig. Bei starkem Regen nimmt sie trotzdem den Bus, weil sie dann trocken ankommt.",
                "Mira compares two ways of getting to work. The bus takes forty minutes, while cycling takes only twenty-five. In heavy rain she still takes the bus because she arrives dry that way.",
                question: "When does Mira choose the slower option?", answer: "She takes the bus in heavy rain."),
            writing: WritingTask(
                "Recommend either a bus pass or a bicycle to a friend whose workplace is nearby.",
                checklist: ["Compare travel times.", "Mention weather or cost.", "Recommend one option with a reason."],
                model: "Mit dem Fahrrad bist du schneller als mit dem Bus. Der Bus ist dagegen bei Regen bequemer. Ich empfehle dir das Fahrrad, weil du keine Fahrkarte brauchst."),
            partner: "Soll ich für meinen Arbeitsweg ein Fahrrad kaufen oder ein Monatsticket nehmen?",
            partnerEnglish: "Should I buy a bicycle or get a monthly ticket for my journey to work?",
            response: "Das Fahrrad ist auf dieser Strecke schneller als der Bus. Der Bus ist dagegen bei Regen bequemer, aber ich würde das Fahrrad wählen.",
            responseEnglish: "The bicycle is faster than the bus on this route. The bus, by contrast, is more comfortable when it rains, but I would choose the bicycle.",
            guided: "Compare speed and comfort using than and by contrast, then recommend one option.",
            independent: "Compare two ways of travelling to a nearby workplace and justify your choice."
        ))

        days.append(CurriculumBuilder.day(
            59, "Describing experiences", "Tell a short story about an unfamiliar situation.",
            words: [
                NewWord("zum ersten Mal", "for the first time", "Ich bin zum ersten Mal allein verreist.", "I travelled alone for the first time."),
                NewWord("sich trauen", "to dare", "Ich habe mich getraut, eine Frage zu stellen.", "I dared to ask a question."),
                NewWord("überraschend", "surprising", "Die Aufgabe war überraschend einfach.", "The task was surprisingly easy."),
                NewWord("die Begegnung (Plural: die Begegnungen)", "encounter", "Die Begegnung im Zug war sehr nett.", "The encounter on the train was very pleasant."),
                NewWord("inzwischen", "by now; meanwhile", "Inzwischen kenne ich den Weg.", "By now I know the way.")
            ],
            grammar: "Use the Perfekt for many spoken past events, but war and hatte are common simple-past forms. 'Ich habe einen Kurs besucht und war zuerst nervös.' means 'I attended a course and was nervous at first.'",
            reading: ReadingPassage(
                "Letzten Samstag hat Jonas zum ersten Mal einen Tanzkurs besucht. Er war nervös, aber seine Partnerin hat ihm die Schritte langsam gezeigt. Inzwischen hat er sich für den nächsten Termin angemeldet.",
                "Last Saturday Jonas attended a dance class for the first time. He was nervous, but his partner showed him the steps slowly. He has since signed up for the next session.",
                question: "How did Jonas's partner help him?", answer: "She showed him the steps slowly."),
            writing: WritingTask(
                "Tell a friend about trying a new class, using real or imagined details.",
                checklist: ["Say what you tried.", "Describe an initial feeling.", "Explain what changed."],
                model: "Gestern habe ich zum ersten Mal einen Tanzkurs besucht. Am Anfang war ich nervös, aber eine Teilnehmerin hat mir geholfen. Inzwischen freue ich mich auf die nächste Stunde."),
            partner: "Wann hast du zuletzt etwas zum ersten Mal ausprobiert? Wie war das?",
            partnerEnglish: "When did you last try something for the first time? What was it like?",
            response: "Ich habe einen Tanzkurs ausprobiert. Zuerst war ich nervös, aber dann habe ich mich getraut, Fragen zu stellen. Die Lehrerin hat mir die Schritte erklärt.",
            responseEnglish: "I tried a dance class. At first I was nervous, but then I dared to ask questions. The teacher explained the steps to me.",
            guided: "Name a new experience in the past tense, describe a feeling and explain what helped.",
            independent: "Tell a short story about trying something unfamiliar, ending with how you feel about it now."
        ))

        days.append(CurriculumBuilder.day(
            60, "Plans and hopes", "Separate a firm plan from a hope and name a next step.",
            words: [
                NewWord("vorhaben", "to intend; to plan", "Ich habe vor, im Herbst einen Kurs zu besuchen.", "I intend to attend a course in the autumn."),
                NewWord("hoffentlich", "hopefully", "Hoffentlich beginnt der Kurs bald.", "Hopefully the course starts soon."),
                NewWord("langfristig", "in the long term", "Langfristig möchte ich näher am Arbeitsplatz wohnen.", "In the long term, I would like to live closer to work."),
                NewWord("die Voraussetzung (Plural: die Voraussetzungen)", "prerequisite", "Berufserfahrung ist eine Voraussetzung für diese Stelle.", "Work experience is a prerequisite for this position."),
                NewWord("sich vornehmen", "to resolve; to set oneself a goal", "Ich nehme mir vor, jeden Tag zu lesen.", "I am setting myself the goal of reading every day.")
            ],
            grammar: "Present tense with a time phrase often expresses a future plan; möchte expresses a wish. 'Im Herbst besuche ich einen Kurs. Später möchte ich in einer Praxis arbeiten.' means 'In autumn I will attend a course. Later I would like to work in a medical practice.'",
            reading: ReadingPassage(
                "Aylin möchte später in einer Arztpraxis arbeiten. Im November beginnt sie einen Computerkurs, denn für viele Stellen braucht sie sichere Computerkenntnisse. Vorher fragt sie beim Bildungszentrum nach den Kosten.",
                "Aylin would like to work in a medical practice later. In November she is starting a computer course because many positions require confident computer skills. Before then she will ask the education centre about the costs.",
                question: "What will Aylin find out before the course starts?", answer: "She will ask about the costs."),
            writing: WritingTask(
                "Explain a six-month learning plan to a friend.",
                checklist: ["Name a goal.", "State a planned action and time.", "Mention a hope or prerequisite."],
                model: "Langfristig möchte ich in einer Praxis arbeiten. Im November besuche ich deshalb einen Computerkurs. Hoffentlich kann ich danach die Programme sicher benutzen."),
            partner: "Was hast du in den nächsten sechs Monaten vor, und was musst du dafür tun?",
            partnerEnglish: "What do you plan to do in the next six months, and what must you do for it?",
            response: "Ich habe vor, einen Computerkurs zu besuchen. Zuerst frage ich nach den Kosten, und hoffentlich finde ich einen Abendkurs.",
            responseEnglish: "I intend to attend a computer course. First I will ask about the costs, and hopefully I will find an evening course.",
            guided: "State a future goal, one firm next step and one hope.",
            independent: "Describe a realistic six-month plan and explain what you need before you can begin."
        ))

        days.append(CurriculumBuilder.day(
            61, "Solving misunderstandings", "Clarify a mistaken detail politely without blaming anyone.",
            words: [
                NewWord("das Missverständnis (Plural: die Missverständnisse)", "misunderstanding", "Wir haben das Missverständnis schnell geklärt.", "We cleared up the misunderstanding quickly."),
                NewWord("verwechseln", "to mix up", "Ich habe Dienstag mit Donnerstag verwechselt.", "I mixed up Tuesday and Thursday."),
                NewWord("richtigstellen", "to correct; to put right", "Darf ich das kurz richtigstellen?", "May I briefly correct that?"),
                NewWord("so war das nicht gemeint", "that was not what was meant", "Entschuldigung, so war das nicht gemeint.", "Sorry, that was not what I meant."),
                NewWord("nachfragen", "to ask for clarification", "Bei der Uhrzeit möchte ich noch einmal nachfragen.", "I would like to ask again about the time.")
            ],
            grammar: "Indirect questions with ob or a question word put the conjugated verb last. 'Kannst du sagen, ob wir uns am Dienstag treffen?' means 'Can you say whether we are meeting on Tuesday?' This is a useful polite clarification pattern.",
            reading: ReadingPassage(
                "Ben wartet am Dienstag vor der Bibliothek, aber niemand kommt. In der Nachricht steht Donnerstag, und er hat die Tage verwechselt. Er schreibt der Gruppe, entschuldigt sich und fragt noch einmal nach der Uhrzeit.",
                "Ben waits outside the library on Tuesday, but nobody comes. The message says Thursday, and he has mixed up the days. He writes to the group, apologises and asks again about the time.",
                question: "Why is Ben alone at the library?", answer: "He mixed up Tuesday and Thursday."),
            writing: WritingTask(
                "Correct a message in which you gave your study group the wrong meeting day.",
                checklist: ["Apologise briefly.", "Give the correct day.", "Ask for confirmation of one detail."],
                model: "Entschuldigung, ich habe die Tage verwechselt. Wir treffen uns am Donnerstag und nicht am Dienstag. Könnt ihr bestätigen, ob wir um sechs Uhr anfangen?"),
            partner: "Ich dachte, wir treffen uns heute. In deiner Nachricht steht aber Donnerstag.",
            partnerEnglish: "I thought we were meeting today, but your message says Thursday.",
            response: "Entschuldigung, da gab es ein Missverständnis. Ich meinte Donnerstag. Kannst du mir sagen, ob du dann Zeit hast?",
            responseEnglish: "Sorry, there was a misunderstanding. I meant Thursday. Can you tell me whether you are free then?",
            guided: "Acknowledge the misunderstanding, correct the day and ask an indirect question.",
            independent: "Resolve a mix-up about a meeting time or place and confirm the corrected arrangement."
        ))

        days.append(CurriculumBuilder.day(
            62, "Organising an outing", "Agree on a meeting point, supplies and a weather alternative.",
            words: [
                NewWord("der Treffpunkt (Plural: die Treffpunkte)", "meeting point", "Unser Treffpunkt ist der Eingang zum Park.", "Our meeting point is the park entrance."),
                NewWord("die Verpflegung (kein Plural)", "food and drink supplies", "Für die Verpflegung sorgen wir gemeinsam.", "We will arrange the food and drink together."),
                NewWord("die Ausweichmöglichkeit (Plural: die Ausweichmöglichkeiten)", "alternative option", "Das Museum ist eine Ausweichmöglichkeit bei Regen.", "The museum is an alternative option if it rains."),
                NewWord("mitbringen", "to bring along", "Kannst du eine Decke mitbringen?", "Can you bring a blanket?"),
                NewWord("sich einigen", "to agree; to reach an agreement", "Wir einigen uns auf zehn Uhr.", "We agree on ten o'clock.")
            ],
            grammar: "Use wenn for a possible condition, with the verb at the end of that clause. 'Wenn es regnet, gehen wir ins Museum.' means 'If it rains, we will go to the museum.' The following main clause begins with its conjugated verb.",
            reading: ReadingPassage(
                "Vier Freunde planen am Sonntag einen Ausflug zum See. Sie treffen sich um zehn Uhr am Bahnhof und bringen Brot, Obst und Wasser mit. Wenn es stark regnet, besuchen sie stattdessen das Stadtmuseum.",
                "Four friends are planning a trip to the lake on Sunday. They will meet at the station at ten and bring bread, fruit and water. If it rains heavily, they will visit the city museum instead.",
                question: "What is the group's bad-weather plan?", answer: "They will visit the city museum."),
            writing: WritingTask(
                "Send your friends the final arrangements for a Sunday outing.",
                checklist: ["Specify the time and meeting point.", "Assign something to bring.", "Include a rain alternative."],
                model: "Wir treffen uns am Sonntag um zehn Uhr am Bahnhof. Ich bringe Brot mit, und ihr könnt Obst mitbringen. Wenn es regnet, gehen wir ins Stadtmuseum."),
            partner: "Wie organisieren wir unseren Ausflug, und was machen wir bei Regen?",
            partnerEnglish: "How shall we organise our outing, and what shall we do if it rains?",
            response: "Wir treffen uns um zehn Uhr am Bahnhof. Ich bringe Wasser mit, und du könntest Brot mitbringen. Wenn es regnet, besuchen wir das Museum.",
            responseEnglish: "We will meet at the station at ten. I will bring water, and you could bring bread. If it rains, we will visit the museum.",
            guided: "Suggest a meeting point, divide the supplies and add an if-clause for bad weather.",
            independent: "Plan an outing with a friend, including transport, responsibilities and a fallback activity."
        ))

        days.append(CurriculumBuilder.review(
            63, "Review: reasons and arrangements", previous: days,
            grammar: "Combine reasons, contrasts and conditions without using them interchangeably. 'Obwohl es kühl ist, fahren wir zum See, weil wir spazieren gehen möchten.' means 'Although it is cool, we are going to the lake because we want to walk.'",
            reading: ReadingPassage(
                "Die Gruppe wollte zuerst zum See fahren, aber für Sonntag ist Regen angekündigt. Mira schlägt das Museum vor, weil dort eine neue Ausstellung beginnt. Ben hat die Uhrzeit verwechselt, deshalb bestätigt sie noch einmal den Treffpunkt um elf Uhr am Eingang.",
                "The group originally wanted to go to the lake, but rain is forecast for Sunday. Mira suggests the museum because a new exhibition is starting there. Ben mixed up the time, so she confirms the meeting point again: eleven o'clock at the entrance.",
                question: "Why does Mira confirm the meeting details?", answer: "Because Ben mixed up the time."),
            writing: WritingTask(
                "Write a group message changing an outing and explaining why.",
                checklist: ["Explain the change.", "Confirm a time and place.", "Ask the group to agree."],
                model: "Weil es am Sonntag regnet, schlage ich das Museum vor. Wir treffen uns um elf Uhr am Eingang, nicht um zehn Uhr. Seid ihr damit einverstanden?"),
            partner: "Wir wollten zum See, aber es soll regnen. Was schlägst du vor?",
            partnerEnglish: "We wanted to go to the lake, but rain is forecast. What do you suggest?",
            response: "Ich schlage das Museum vor, weil wir dort trocken bleiben. Wir treffen uns um elf Uhr am Eingang. Passt das für dich?",
            responseEnglish: "I suggest the museum because we will stay dry there. We will meet at the entrance at eleven. Does that work for you?"
        ))

        days.append(CurriculumBuilder.day(
            64, "Moving home", "Coordinate practical moving tasks and describe the new home.",
            words: [
                NewWord("der Umzugskarton (Plural: die Umzugskartons)", "moving box", "Die Bücher passen in drei Umzugskartons.", "The books fit into three moving boxes."),
                NewWord("die Übergabe (Plural: die Übergaben)", "handover", "Die Übergabe der Wohnung ist am Freitag.", "The flat handover is on Friday."),
                NewWord("die Kaution (Plural: die Kautionen)", "security deposit", "Die Kaution beträgt zwei Monatsmieten.", "The deposit is two months' rent."),
                NewWord("beschriften", "to label", "Bitte beschrifte die Kartons mit dem Zimmernamen.", "Please label the boxes with the room name."),
                NewWord("sich einleben", "to settle in", "In der neuen Nachbarschaft lebe ich mich langsam ein.", "I am slowly settling into the new neighbourhood.")
            ],
            grammar: "A relative clause adds information about a noun. For a feminine subject use die: 'Die Wohnung, die einen Balkon hat, liegt im zweiten Stock.' means 'The flat that has a balcony is on the second floor.' The relative-clause verb comes last.",
            reading: ReadingPassage(
                "Nora zieht in eine Wohnung, die näher an ihrer Arbeit liegt. Am Freitag bekommt sie bei der Übergabe die Schlüssel. Ihre Freunde helfen am Samstag und tragen die beschrifteten Kartons direkt in die richtigen Zimmer.",
                "Nora is moving into a flat that is closer to her workplace. She will receive the keys at the handover on Friday. Her friends will help on Saturday and carry the labelled boxes straight into the correct rooms.",
                question: "How do Nora's friends know where the boxes belong?", answer: "The boxes are labelled."),
            writing: WritingTask(
                "Ask a friend for specific help with your move.",
                checklist: ["Give the moving date.", "Describe the new flat with one detail.", "Assign a practical task."],
                model: "Am Samstag ziehe ich in eine Wohnung, die näher an meiner Arbeit liegt. Kannst du ab neun Uhr helfen? Bitte trage die beschrifteten Kartons in die passenden Zimmer."),
            partner: "Wann ziehst du um, und wie kann ich dir helfen?",
            partnerEnglish: "When are you moving, and how can I help you?",
            response: "Ich ziehe am Samstag um. Könntest du um neun Uhr kommen und die Kartons tragen? Die neue Wohnung liegt im zweiten Stock.",
            responseEnglish: "I am moving on Saturday. Could you come at nine and carry the boxes? The new flat is on the second floor.",
            guided: "Give a moving date, ask for a specific task and describe one feature of the flat.",
            independent: "Coordinate help for a move, including timing, access to the building and one responsibility."
        ))

        days.append(CurriculumBuilder.day(
            65, "A work interview", "Explain relevant experience and ask a focused interview question.",
            words: [
                NewWord("die Berufserfahrung (Plural: die Berufserfahrungen)", "professional experience", "Ich habe Berufserfahrung im Verkauf.", "I have professional experience in sales."),
                NewWord("die Stärke (Plural: die Stärken)", "strength", "Meine Stärke ist der freundliche Umgang mit Kunden.", "My strength is friendly interaction with customers."),
                NewWord("die Einarbeitung (Plural: die Einarbeitungen)", "initial job training", "Die Einarbeitung dauert zwei Wochen.", "The initial job training lasts two weeks."),
                NewWord("verantwortlich", "responsible", "Ich war für die Bestellungen verantwortlich.", "I was responsible for orders."),
                NewWord("sich bewerben", "to apply", "Ich bewerbe mich um eine Stelle im Büro.", "I am applying for an office position.")
            ],
            grammar: "Use seit with present tense for something still continuing, but past tense for a finished job. 'Ich arbeite seit zwei Jahren im Verkauf. Davor habe ich in einem Café gearbeitet.' means 'I have worked in sales for two years. Before that I worked in a café.'",
            reading: ReadingPassage(
                "Beim Gespräch für eine Bürostelle erzählt Karim von seiner Arbeit im Verkauf. Dort war er für Bestellungen verantwortlich und hat oft telefoniert. Er fragt, wie die Einarbeitung abläuft, weil das Computerprogramm für ihn neu ist.",
                "At an interview for an office position, Karim talks about his work in sales. There he was responsible for orders and often spoke on the phone. He asks how the initial training works because the computer program is new to him.",
                question: "Why does Karim ask about training?", answer: "Because the computer program is new to him."),
            writing: WritingTask(
                "Prepare a short interview introduction for an office job.",
                checklist: ["Mention relevant experience.", "Support a strength with a task.", "Ask about initial training."],
                model: "Ich habe zwei Jahre im Verkauf gearbeitet und Bestellungen organisiert. Zu meinen Stärken gehört der freundliche Kontakt mit Kunden. Wie läuft die Einarbeitung für das Computerprogramm ab?"),
            partner: "Welche Erfahrungen bringen Sie für diese Stelle mit, und was möchten Sie von uns wissen?",
            partnerEnglish: "What experience do you bring to this position, and what would you like to ask us?",
            response: "Ich habe im Verkauf gearbeitet und war für Bestellungen verantwortlich. Ich telefoniere gern mit Kunden. Wie lange dauert die Einarbeitung?",
            responseEnglish: "I worked in sales and was responsible for orders. I enjoy speaking with customers on the phone. How long does the initial job training take?",
            guided: "Connect a past responsibility to the job and ask one question about training.",
            independent: "Introduce your relevant experience for an imagined job and ask a practical question without inventing formal qualifications."
        ))

        days.append(CurriculumBuilder.day(
            66, "Family arrangements", "Arrange a child pickup and explain a change of responsibility.",
            words: [
                NewWord("die Betreuung (Plural: die Betreuungen)", "care; supervision", "Die Betreuung nach der Schule endet um vier Uhr.", "After-school care ends at four o'clock."),
                NewWord("abholen", "to pick up", "Heute holt meine Schwester die Kinder ab.", "Today my sister is picking up the children."),
                NewWord("einspringen", "to step in", "Kannst du am Freitag für mich einspringen?", "Can you step in for me on Friday?"),
                NewWord("die Vollmacht (Plural: die Vollmachten)", "written authorisation", "Für die Abholung braucht mein Bruder eine Vollmacht.", "My brother needs written authorisation for the pickup."),
                NewWord("rechtzeitig", "in good time", "Bitte sag mir rechtzeitig Bescheid.", "Please let me know in good time.")
            ],
            grammar: "Use a modal verb plus an infinitive at the end to describe obligations. 'Mein Bruder muss eine Vollmacht mitbringen.' means 'My brother must bring written authorisation.' Requirements depend on the institution; ask rather than assume.",
            reading: ReadingPassage(
                "Sofia muss am Freitag länger arbeiten und kann ihre Tochter nicht abholen. Ihr Bruder springt ein, aber die Betreuung kennt ihn noch nicht. Sofia ruft dort an und erfährt, dass er eine Vollmacht und seinen Ausweis mitbringen soll.",
                "Sofia has to work longer on Friday and cannot pick up her daughter. Her brother steps in, but the care staff do not know him yet. Sofia calls and learns that he should bring written authorisation and his identity document.",
                question: "What should Sofia's brother bring?", answer: "Written authorisation and his identity document."),
            writing: WritingTask(
                "Write to the after-school care team about a different person collecting your child.",
                checklist: ["Name the day and person.", "Explain the change briefly.", "Confirm the requested documents."],
                model: "Am Freitag holt mein Bruder Luis meine Tochter ab, weil ich länger arbeiten muss. Ich gebe ihm die Vollmacht mit. Er bringt auch seinen Ausweis mit."),
            partner: "Ich kann am Freitag dein Kind abholen. Was muss ich dafür mitbringen?",
            partnerEnglish: "I can pick up your child on Friday. What do I need to bring?",
            response: "Vielen Dank fürs Einspringen. Du musst hier eine Vollmacht und deinen Ausweis mitbringen. Ich gebe dir die Vollmacht am Donnerstag.",
            responseEnglish: "Thank you for stepping in. Here you must bring written authorisation and your identity document. I will give you the authorisation on Thursday.",
            guided: "Thank the helper, explain the documents required in this scenario and arrange the handover.",
            independent: "Arrange a family pickup with a helper, confirming who, when and what the institution has requested."
        ))

        days.append(CurriculumBuilder.day(
            67, "Helping in the community", "Offer manageable volunteer help and establish the task.",
            words: [
                NewWord("ehrenamtlich", "in a voluntary, unpaid capacity", "Ich helfe ehrenamtlich im Stadtteilcafé.", "I volunteer at the neighbourhood café."),
                NewWord("die Ausgabe (Plural: die Ausgaben)", "distribution; serving point", "Die Ausgabe der Suppe beginnt um zwölf Uhr.", "Soup distribution starts at twelve."),
                NewWord("sortieren", "to sort", "Wir sortieren die gespendeten Bücher.", "We sort the donated books."),
                NewWord("die Spende (Plural: die Spenden)", "donation", "Die Spenden werden am Eingang gesammelt.", "Donations are collected at the entrance."),
                NewWord("sich engagieren", "to get involved", "Ich möchte mich im Viertel engagieren.", "I would like to get involved in the neighbourhood.")
            ],
            grammar: "Recognise the present passive: werden plus a past participle highlights what happens, not who does it. 'Die Bücher werden sortiert.' means 'The books are being sorted.' You can respond with the simpler active form: 'Ich sortiere die Bücher.'",
            reading: ReadingPassage(
                "Im Stadtteilcafé werden jeden Samstag gespendete Bücher sortiert. Neue Helfer können zunächst eine Stunde mitarbeiten und die Aufgaben kennenlernen. Elif meldet sich für den Vormittag, weil sie nachmittags ihre Familie besucht.",
                "Donated books are sorted at the neighbourhood café every Saturday. New helpers can initially work for an hour and get to know the tasks. Elif signs up for the morning because she is visiting her family in the afternoon.",
                question: "Why does Elif choose the morning?", answer: "Because she is visiting her family in the afternoon."),
            writing: WritingTask(
                "Offer a neighbourhood project one hour of volunteer help.",
                checklist: ["Say when you are available.", "Offer a specific task.", "Ask where to report."],
                model: "Ich möchte am Samstag von zehn bis elf Uhr ehrenamtlich helfen. Gern sortiere ich die gespendeten Bücher. Bei wem soll ich mich am Eingang melden?"),
            partner: "Wir suchen Hilfe für unser Stadtteilcafé. Wann könntest du kommen?",
            partnerEnglish: "We are looking for help at our neighbourhood café. When could you come?",
            response: "Ich kann am Samstag eine Stunde helfen. Ich würde gern Bücher sortieren. Wer zeigt mir die Aufgabe?",
            responseEnglish: "I can help for an hour on Saturday. I would like to sort books. Who will show me how to do the task?",
            guided: "Offer a limited time slot, choose a task and ask who will explain it.",
            independent: "Discuss a realistic volunteer contribution, making your availability and limits clear."
        ))

        days.append(CurriculumBuilder.day(
            68, "Cultural events", "Use an event listing to choose a suitable activity.",
            words: [
                NewWord("die Lesung (Plural: die Lesungen)", "public reading", "Die Autorin kommt zu einer Lesung in die Bibliothek.", "The author is coming to the library for a public reading."),
                NewWord("die Aufführung (Plural: die Aufführungen)", "performance", "Nach der Aufführung sprechen wir über das Stück.", "After the performance we talk about the play."),
                NewWord("ausverkauft", "sold out", "Das Konzert am Freitag ist ausverkauft.", "Friday's concert is sold out."),
                NewWord("ermäßigt", "reduced-price", "Mit diesem Ausweis ist der Eintritt ermäßigt.", "Admission is reduced with this card."),
                NewWord("die Abendkasse (Plural: die Abendkassen)", "box office open before an evening event", "An der Abendkasse gibt es noch Karten.", "There are still tickets at the evening box office.")
            ],
            grammar: "Zum plus a nominalised infinitive expresses a purpose; the nominalised verb is capitalised. 'Nach der Lesung bleibt Zeit zum Fragen.' means 'After the reading there is time for asking questions.' Use this as a practical phrase pattern.",
            reading: ReadingPassage(
                "Die Bibliothek bietet am Mittwoch um neunzehn Uhr eine Lesung an. Der Eintritt kostet sechs Euro, ermäßigt drei Euro, und Karten gibt es an der Abendkasse. Nach dem Gespräch mit der Autorin bleibt Zeit zum Fragen.",
                "The library is holding a public reading on Wednesday at seven in the evening. Admission costs six euros, or three at the reduced rate, and tickets are available at the evening box office. After the conversation with the author there will be time to ask questions.",
                question: "Where can visitors buy tickets?", answer: "At the evening box office."),
            writing: WritingTask(
                "Invite a friend to the reading and explain two practical details.",
                checklist: ["Name the event and start time.", "Explain ticket purchase and price.", "Suggest when to meet."],
                model: "Möchtest du am Mittwoch zur Lesung in der Bibliothek kommen? Sie beginnt um neunzehn Uhr, und die Karten kosten an der Abendkasse sechs Euro. Lass uns um halb sieben vor dem Eingang treffen."),
            partner: "Das Konzert ist ausverkauft. Kennst du eine andere Veranstaltung für Mittwoch?",
            partnerEnglish: "The concert is sold out. Do you know another event for Wednesday?",
            response: "In der Bibliothek gibt es um neunzehn Uhr eine Lesung. Karten kosten sechs Euro an der Abendkasse. Danach bleibt Zeit zum Fragen.",
            responseEnglish: "There is a public reading at the library at seven in the evening. Tickets cost six euros at the evening box office. Afterwards there will be time to ask questions.",
            guided: "Suggest the reading using its time, ticket price and a reason to attend.",
            independent: "Recommend a cultural event to a friend and agree on ticket arrangements and a meeting time."
        ))

        days.append(CurriculumBuilder.day(
            69, "Travel disruption", "Explain a disrupted journey and ask about a usable alternative.",
            words: [
                NewWord("der Schienenersatzverkehr (kein Plural)", "rail replacement transport", "Wegen der Bauarbeiten gibt es Schienenersatzverkehr.", "There is rail replacement transport because of construction work."),
                NewWord("der Anschluss (Plural: die Anschlüsse)", "connecting service", "Durch die Verspätung verpasse ich meinen Anschluss.", "Because of the delay I will miss my connection."),
                NewWord("die Erstattung (Plural: die Erstattungen)", "reimbursement", "Ich frage nach einer Erstattung für das ungenutzte Ticket.", "I ask about reimbursement for the unused ticket."),
                NewWord("ausfallen", "to be cancelled; to not run", "Der Zug um acht Uhr fällt aus.", "The eight o'clock train is cancelled."),
                NewWord("umgeleitet", "diverted", "Der Bus wird über den Marktplatz umgeleitet.", "The bus is diverted via the market square.")
            ],
            grammar: "Deshalb links a consequence and takes a position in the main clause, so the conjugated verb follows it. 'Der Zug fällt aus. Deshalb nehme ich den Ersatzbus.' means 'The train is cancelled. Therefore I am taking the replacement bus.'",
            reading: ReadingPassage(
                "Am Bahnhof erfährt Paul, dass sein Zug wegen Bauarbeiten ausfällt. Ein Ersatzbus fährt um acht Uhr zwanzig vom Vorplatz, braucht aber länger. Deshalb ruft Paul seine Kollegin an und sagt, dass er erst gegen zehn Uhr ankommt.",
                "At the station Paul learns that his train is cancelled because of construction work. A replacement bus leaves the station forecourt at eight twenty but takes longer. Paul therefore calls his colleague and says he will not arrive until around ten.",
                question: "Why does Paul call his colleague?", answer: "To say that he will arrive later, around ten."),
            writing: WritingTask(
                "Tell a colleague about a cancelled train and your revised arrival.",
                checklist: ["Explain the disruption.", "Name your alternative.", "Give an approximate arrival time."],
                model: "Mein Zug fällt wegen Bauarbeiten aus. Deshalb nehme ich den Ersatzbus vom Bahnhofsvorplatz. Ich komme voraussichtlich gegen zehn Uhr an."),
            partner: "Ihr Zug fällt heute aus. Möchten Sie wissen, wie Sie weiterfahren können?",
            partnerEnglish: "Your train is cancelled today. Would you like to know how you can continue your journey?",
            response: "Ja, bitte. Wo fährt der Ersatzbus ab, und erreiche ich damit meinen Anschluss? Ich muss nach Neustadt.",
            responseEnglish: "Yes, please. Where does the replacement bus leave from, and will I make my connection with it? I need to get to Neustadt.",
            guided: "State your destination and ask about the replacement stop and connecting service.",
            independent: "Explain a travel disruption, request an alternative route and notify someone of a likely delay."
        ))

        days.append(CurriculumBuilder.review(
            70, "Review: practical responsibilities", previous: days,
            grammar: "Recognise passive information and answer actively. 'Die Schlüssel werden am Freitag übergeben. Deshalb komme ich am Freitag.' means 'The keys will be handed over on Friday. Therefore I will come on Friday.'",
            reading: ReadingPassage(
                "Am Samstag möchte Nora beim Stadtteilcafé helfen, doch ihr Zug fällt aus. Sie nimmt einen Ersatzbus und informiert das Team, dass sie erst um elf Uhr kommt. Die Bücher werden bis dahin von anderen Helfern sortiert, und Nora übernimmt später die Ausgabe.",
                "Nora wants to help at the neighbourhood café on Saturday, but her train is cancelled. She takes a replacement bus and tells the team she will not arrive until eleven. Other helpers will sort the books until then, and Nora will take over distribution later.",
                question: "How does the team cover Nora's delay?", answer: "Other helpers sort the books until she arrives."),
            writing: WritingTask(
                "Update a volunteer team after a travel problem changes your availability.",
                checklist: ["Explain why you will be late.", "Give your new arrival time.", "Offer a suitable later task."],
                model: "Mein Zug fällt aus, deshalb komme ich erst um elf Uhr. Könnt ihr die Bücher vorher ohne mich sortieren? Danach übernehme ich gern die Ausgabe."),
            partner: "Du wolltest um zehn Uhr helfen, aber dein Zug fällt aus. Wie organisieren wir das?",
            partnerEnglish: "You wanted to help at ten, but your train is cancelled. How shall we organise this?",
            response: "Ich nehme den Ersatzbus und komme um elf Uhr. Könnt ihr vorher die Bücher sortieren? Danach helfe ich bei der Ausgabe.",
            responseEnglish: "I will take the replacement bus and arrive at eleven. Could you sort the books beforehand? Afterwards I will help with distribution."
        ))

        days.append(CurriculumBuilder.day(
            71, "Reading notices", "Extract an action, a deadline and an exception from a notice.",
            words: [
                NewWord("der Aushang (Plural: die Aushänge)", "posted notice", "Bitte lies den Aushang neben dem Aufzug.", "Please read the notice beside the lift."),
                NewWord("die Frist (Plural: die Fristen)", "deadline; allowed period", "Die Frist endet am Freitag.", "The deadline is Friday."),
                NewWord("betroffen", "affected", "Nur die Wohnungen im Erdgeschoss sind betroffen.", "Only the flats on the ground floor are affected."),
                NewWord("vorübergehend", "temporarily", "Der Hintereingang bleibt vorübergehend geschlossen.", "The rear entrance will remain temporarily closed."),
                NewWord("ausgenommen", "except; excluded", "Alle Fahrzeuge müssen weg, Fahrräder ausgenommen.", "All vehicles must be removed, except bicycles.")
            ],
            grammar: "Notices often use passive forms and compressed phrases. 'Der Hof wird gereinigt. Fahrräder sind ausgenommen.' means 'The courtyard is being cleaned. Bicycles are excluded.' Recognise the action and exception before deciding what you need to do.",
            reading: ReadingPassage(
                "Am Montag wird der Innenhof von acht bis zwölf Uhr gereinigt. Bitte entfernen Sie Ihre Fahrzeuge bis Sonntagabend; Fahrräder sind ausgenommen und dürfen im Ständer bleiben. Während der Reinigung ist nur der Vordereingang geöffnet.",
                "On Monday the courtyard will be cleaned from eight until twelve. Please remove your vehicles by Sunday evening; bicycles are excluded and may remain in the rack. During cleaning only the front entrance will be open.",
                question: "What may remain in the courtyard during cleaning?", answer: "Bicycles may remain in the rack."),
            writing: WritingTask(
                "Explain the courtyard notice to a neighbour who has a car and a bicycle.",
                checklist: ["State the car-removal deadline.", "Explain the bicycle exception.", "Identify the usable entrance."],
                model: "Du musst dein Auto bis Sonntagabend aus dem Hof fahren. Dein Fahrrad darf im Ständer bleiben, weil Fahrräder ausgenommen sind. Am Montagvormittag kannst du nur den Vordereingang benutzen."),
            partner: "Ich habe den Aushang nicht ganz verstanden. Muss mein Fahrrad auch aus dem Hof?",
            partnerEnglish: "I did not fully understand the notice. Does my bicycle have to leave the courtyard too?",
            response: "Nein, Fahrräder sind ausgenommen und dürfen im Ständer bleiben. Dein Auto muss bis Sonntagabend weg. Am Montag ist nur der Vordereingang geöffnet.",
            responseEnglish: "No, bicycles are excluded and may remain in the rack. Your car must be moved by Sunday evening. On Monday only the front entrance is open.",
            guided: "Explain the exception, then state the car deadline and available entrance.",
            independent: "Summarise the notice for a neighbour, distinguishing required action from exceptions."
        ))

        days.append(CurriculumBuilder.day(
            72, "Listening for key details", "Rehearse identifying changed times, locations and required items.",
            words: [
                NewWord("die Durchsage (Plural: die Durchsagen)", "announcement", "In der Durchsage wurde ein anderer Raum genannt.", "A different room was mentioned in the announcement."),
                NewWord("mitschreiben", "to take notes while listening", "Ich schreibe die wichtigsten Zahlen mit.", "I note down the most important numbers as I listen."),
                NewWord("entscheidend", "crucial", "Für mich ist die neue Uhrzeit entscheidend.", "The new time is crucial for me."),
                NewWord("die Rückfrage (Plural: die Rückfragen)", "follow-up question", "Ich habe noch eine Rückfrage zum Treffpunkt.", "I have another question about the meeting point."),
                NewWord("stattfinden", "to take place", "Der Kurs findet heute in Raum zwölf statt.", "The class is taking place in room twelve today.")
            ],
            grammar: "Distinguish a replacement from the original information with nicht ... sondern. 'Der Kurs beginnt nicht um neun, sondern um halb zehn.' means 'The class starts not at nine but at half past nine.' Focus on the corrected detail.",
            reading: ReadingPassage(
                "Guten Morgen, hier ist eine Nachricht vom Kursbüro: Ihr Gesprächskurs beginnt morgen nicht um neun, sondern um halb zehn. Wegen einer Reparatur findet er in Raum zwölf im Erdgeschoss statt. Bitte bringen Sie das blaue Heft mit.",
                "Good morning, this is a message from the course office: tomorrow your conversation class starts not at nine but at half past nine. Because of a repair it will take place in room twelve on the ground floor. Please bring the blue workbook.",
                question: "What are the new start time and room?", answer: "Half past nine, in room twelve on the ground floor."),
            writing: WritingTask(
                "Use the written announcement as a listening rehearsal: read it aloud, cover it, then write a reminder.",
                checklist: ["Record the corrected time.", "Include the room and floor.", "Name the item to bring."],
                model: "Morgen beginnt der Gesprächskurs um halb zehn. Wir treffen uns in Raum zwölf im Erdgeschoss. Ich muss das blaue Heft mitbringen."),
            partner: "Der Kurs wurde verlegt. Welche drei wichtigen Angaben hast du verstanden?",
            partnerEnglish: "The class has been moved. Which three important details did you understand?",
            response: "Der Kurs beginnt um halb zehn in Raum zwölf im Erdgeschoss. Wir sollen das blaue Heft mitbringen. Habe ich die Uhrzeit richtig verstanden?",
            responseEnglish: "The class starts at half past nine in room twelve on the ground floor. We are supposed to bring the blue workbook. Have I understood the time correctly?",
            guided: "Read the announcement aloud or use the app's speech playback, then report time, place and required item.",
            independent: "After hearing or reading the message, cover it, recall its key details and ask one confirmation question."
        ))

        days.append(CurriculumBuilder.day(
            73, "An informal invitation", "Write a friendly invitation with a reason and a clear reply request.",
            words: [
                NewWord("vorbeikommen", "to come round", "Komm am Samstag gern bei uns vorbei.", "Feel free to come round on Saturday."),
                NewWord("Bescheid geben", "to let someone know", "Gib mir bitte bis Donnerstag Bescheid.", "Please let me know by Thursday."),
                NewWord("die Einweihungsfeier (Plural: die Einweihungsfeiern)", "housewarming party", "Unsere Einweihungsfeier beginnt um sechs.", "Our housewarming party starts at six."),
                NewWord("gemütlich", "cosy; relaxed", "Wir planen einen gemütlichen Abend.", "We are planning a relaxed evening."),
                NewWord("beisteuern", "to contribute", "Wenn du möchtest, kannst du einen Salat beisteuern.", "If you like, you can contribute a salad.")
            ],
            grammar: "In an informal message, du-imperatives can make a friendly request. 'Komm gern vorbei und gib mir bitte bis Donnerstag Bescheid.' means 'Do come round and please let me know by Thursday.' Gern and bitte soften the request.",
            reading: ReadingPassage(
                "Liebe Mila, unsere Küche ist endlich fertig, deshalb feiern wir am Samstag ab achtzehn Uhr eine kleine Einweihungsfeier. Es gibt Suppe und Brot; wenn du magst, kannst du einen Salat mitbringen. Gib mir bitte bis Donnerstag Bescheid, ob du kommen kannst.",
                "Dear Mila, our kitchen is finally finished, so we are having a small housewarming party on Saturday from six in the evening. There will be soup and bread; if you like, you can bring a salad. Please let me know by Thursday whether you can come.",
                question: "Does Mila have to bring a salad?", answer: "No, bringing a salad is optional."),
            writing: WritingTask(
                "Write an informal email inviting a friend to celebrate your move.",
                checklist: ["Explain the occasion and start time.", "Say what food is provided.", "Request a reply by a specific day."],
                model: "Liebe Mila, am Samstag feiern wir ab achtzehn Uhr unsere neue Wohnung. Wir kochen Suppe und freuen uns, wenn du vorbeikommst. Du kannst gern einen Salat beisteuern, musst aber nichts mitbringen. Gib mir bitte bis Donnerstag Bescheid, ob du Zeit hast."),
            partner: "Du wolltest mich in deine neue Wohnung einladen. Wann soll ich kommen, und soll ich etwas mitbringen?",
            partnerEnglish: "You wanted to invite me to your new flat. When should I come, and should I bring anything?",
            response: "Komm am Samstag ab sechs Uhr vorbei. Es gibt Suppe und Brot. Wenn du möchtest, kannst du einen Salat mitbringen.",
            responseEnglish: "Come round on Saturday from six in the evening. There will be soup and bread. If you like, you can bring a salad.",
            guided: "Invite your friend, give the time and distinguish an optional contribution from a requirement.",
            independent: "Make a friendly invitation with a reason, practical details and a reply deadline."
        ))

        days.append(CurriculumBuilder.day(
            74, "A formal request", "Write a polite, specific email requesting information.",
            words: [
                NewWord("die Auskunft (Plural: die Auskünfte)", "information; an answer to an enquiry", "Vielen Dank für Ihre Auskunft zu den Kurszeiten.", "Thank you for the information about the course times."),
                NewWord("die Verfügbarkeit (kein Plural)", "availability", "Ich möchte nach der Verfügbarkeit des Raumes fragen.", "I would like to ask about the room's availability."),
                NewWord("die Gebühr (Plural: die Gebühren)", "fee", "Welche Gebühr fällt für die Reservierung an?", "What fee is charged for the reservation?"),
                NewWord("schriftlich", "in writing", "Bitte bestätigen Sie den Termin schriftlich.", "Please confirm the appointment in writing."),
                NewWord("sich erkundigen", "to enquire", "Ich möchte mich nach freien Plätzen erkundigen.", "I would like to enquire about available places.")
            ],
            grammar: "Könnten Sie ...? is a useful Konjunktiv II pattern for a polite request, not a claim of full mastery of this mood. 'Könnten Sie mir mitteilen, ob der Raum frei ist?' means 'Could you let me know whether the room is available?'",
            reading: ReadingPassage(
                "Sehr geehrtes Team, ich suche für unsere Lerngruppe einen Raum am Freitagabend. Auf Ihrer Internetseite finde ich die Größe der Räume, aber keine Angaben zu den Gebühren. Könnten Sie mir mitteilen, ob am zwölften Mai ein Raum für acht Personen frei ist?",
                "Dear team, I am looking for a room for our study group on Friday evening. On your website I can find the room sizes but no information about fees. Could you let me know whether a room for eight people is available on the twelfth of May?",
                question: "Which price information is missing from the website?", answer: "The fees for using the rooms."),
            writing: WritingTask(
                "Write a formal email enquiring about a room for an eight-person study group.",
                checklist: ["State the purpose, date and group size.", "Ask about availability and fees.", "Use a polite opening and closing."],
                model: "Sehr geehrtes Team, ich möchte mich nach einem Raum für unsere Lerngruppe erkundigen. Wir sind acht Personen und möchten uns am zwölften Mai von achtzehn bis zwanzig Uhr treffen. Könnten Sie uns mitteilen, ob ein Raum verfügbar ist und welche Gebühren anfallen? Vielen Dank für Ihre Auskunft.\nMit freundlichen Grüßen\nSara Ali"),
            partner: "Guten Tag, welche Informationen benötigen Sie für Ihre Raumanfrage?",
            partnerEnglish: "Hello, what information do you need for your room enquiry?",
            response: "Ich suche am zwölften Mai einen Raum für acht Personen. Könnten Sie mir sagen, ob ein Raum frei ist und wie hoch die Gebühr ist?",
            responseEnglish: "I am looking for a room for eight people on the twelfth of May. Could you tell me whether a room is available and how much the fee is?",
            guided: "State your room requirements and use could you to ask about availability and cost.",
            independent: "Make a formal enquiry with a date, purpose, two specific questions and a courteous ending."
        ))

        days.append(CurriculumBuilder.day(
            75, "Describing a situation", "Describe people, positions and cautious interpretations in an imagined scene.",
            words: [
                NewWord("im Vordergrund", "in the foreground", "Im Vordergrund steht ein Tisch.", "There is a table in the foreground."),
                NewWord("im Hintergrund", "in the background", "Im Hintergrund warten zwei Personen.", "Two people are waiting in the background."),
                NewWord("vermutlich", "presumably; probably", "Die Frau wartet vermutlich auf den Bus.", "The woman is probably waiting for the bus."),
                NewWord("sich unterhalten", "to have a conversation", "Zwei Nachbarn unterhalten sich im Hof.", "Two neighbours are chatting in the courtyard."),
                NewWord("der Eindruck (Plural: die Eindrücke)", "impression", "Die Szene macht einen ruhigen Eindruck.", "The scene gives a peaceful impression.")
            ],
            grammar: "Separate observation from inference using vielleicht or vermutlich. 'Zwei Personen sitzen am Tisch. Vielleicht planen sie einen Ausflug.' means 'Two people are sitting at the table. Perhaps they are planning an outing.' An interpretation is not an observed fact.",
            reading: ReadingPassage(
                "Stell dir eine Szene in einem Gemeinschaftsgarten vor: Im Vordergrund füllt ein Mann eine Gießkanne. Im Hintergrund unterhalten sich zwei Frauen neben einem Beet. Vielleicht besprechen sie, welches Gemüse sie als Nächstes pflanzen möchten.",
                "Imagine a scene in a community garden: in the foreground a man is filling a watering can. In the background two women are talking beside a garden bed. Perhaps they are discussing which vegetables they would like to plant next.",
                question: "Which part is an interpretation rather than a stated observation?", answer: "That the women may be discussing which vegetables to plant."),
            writing: WritingTask(
                "Describe the imagined garden scene in words; no actual image is supplied.",
                checklist: ["Locate two people or objects.", "Describe an activity.", "Mark one interpretation as uncertain."],
                model: "Im Vordergrund füllt ein Mann eine Gießkanne. Im Hintergrund stehen zwei Frauen neben einem Beet. Sie unterhalten sich, aber wir kennen das Thema nicht. Vielleicht planen sie die nächste Pflanzaktion."),
            partner: "Stell dir einen Gemeinschaftsgarten vor. Wer ist dort, was machen die Personen, und was vermutest du?",
            partnerEnglish: "Imagine a community garden. Who is there, what are the people doing, and what do you think might be happening?",
            response: "Im Vordergrund füllt ein Mann eine Gießkanne. Zwei Frauen unterhalten sich im Hintergrund. Vielleicht planen sie die Arbeit im Garten.",
            responseEnglish: "In the foreground a man is filling a watering can. Two women are chatting in the background. Perhaps they are planning the work in the garden.",
            guided: "Use the written imagined scene to describe foreground, background and one clearly labelled guess.",
            independent: "Invent a plausible everyday scene and describe positions and activities, separating details from speculation."
        ))

        days.append(CurriculumBuilder.day(
            76, "A joint planning discussion", "Negotiate a shared event and distribute tasks fairly.",
            words: [
                NewWord("die Aufgabenverteilung (Plural: die Aufgabenverteilungen)", "division of tasks", "Wir besprechen die Aufgabenverteilung für das Fest.", "We discuss the division of tasks for the celebration."),
                NewWord("übernehmen", "to take on", "Ich übernehme den Einkauf.", "I will take on the shopping."),
                NewWord("der Zeitrahmen (Plural: die Zeitrahmen)", "time frame", "Unser Zeitrahmen ist ziemlich knapp.", "Our time frame is quite tight."),
                NewWord("sich absprechen", "to coordinate with each other", "Wir müssen uns wegen des Essens absprechen.", "We need to coordinate about the food."),
                NewWord("machbar", "feasible", "Ein Picknick für zehn Personen ist machbar.", "A picnic for ten people is feasible.")
            ],
            grammar: "Use könnten plus an infinitive for a tentative suggestion. 'Wir könnten draußen feiern und bei Regen den Gruppenraum nutzen.' means 'We could celebrate outside and use the group room if it rains.' This pattern invites discussion rather than giving an order.",
            reading: ReadingPassage(
                "Die Lerngruppe plant ein kleines Sommerfest für zehn Personen. Jule übernimmt die Getränke, während Amir den Gruppenraum reserviert. Weil nur zwei Stunden zur Vorbereitung bleiben, entscheiden sie sich für mitgebrachtes Essen statt selbst zu kochen.",
                "The study group is planning a small summer celebration for ten people. Jule takes on the drinks while Amir reserves the group room. Because only two hours are available for preparation, they decide on food brought by participants instead of cooking themselves.",
                question: "Why does the group avoid cooking together?", answer: "They have only two hours to prepare."),
            writing: WritingTask(
                "Send a planning summary for a small group celebration.",
                checklist: ["Specify the event and time frame.", "Assign at least two responsibilities.", "Explain one practical decision."],
                model: "Unser Sommerfest für zehn Personen beginnt am Freitag um sechs Uhr. Jule übernimmt die Getränke, und Amir reserviert den Raum. Alle bringen etwas zu essen mit, weil wir wenig Vorbereitungszeit haben. Bitte sagt bis Mittwoch, was ihr beisteuern könnt."),
            partner: "Wir haben nur zwei Stunden für die Vorbereitung. Wie verteilen wir die Aufgaben für unser Fest?",
            partnerEnglish: "We have only two hours to prepare. How shall we divide the tasks for our celebration?",
            response: "Wir könnten das Essen mitbringen, statt zu kochen. Ich übernehme die Getränke. Könntest du den Raum reservieren?",
            responseEnglish: "We could bring the food instead of cooking. I will take care of the drinks. Could you reserve the room?",
            guided: "Suggest a feasible food plan, take on one task and ask your partner to take another.",
            independent: "Negotiate a small event by comparing suggestions, agreeing responsibilities and confirming a deadline."
        ))

        days.append(CurriculumBuilder.review(
            77, "Review: messages into action", previous: days,
            grammar: "Link information from a notice to a polite request. 'Der Raum ist geschlossen. Könnten Sie uns einen anderen Raum anbieten?' means 'The room is closed. Could you offer us another room?' Keep the request specific.",
            reading: ReadingPassage(
                "Ein Aushang informiert die Lerngruppe, dass ihr Raum am Freitag wegen einer Reparatur geschlossen bleibt. In einer Nachricht bietet das Büro Raum zwölf ab halb sieben an. Die Gruppe bestätigt den neuen Termin schriftlich und bittet alle, das blaue Heft mitzubringen.",
                "A notice informs the study group that their room will remain closed on Friday because of a repair. In a message the office offers room twelve from half past six. The group confirms the new arrangement in writing and asks everyone to bring the blue workbook.",
                question: "What are the replacement room and start time?", answer: "Room twelve from half past six."),
            writing: WritingTask(
                "Write an email accepting the replacement room, then include a reminder for your group.",
                checklist: ["Confirm the room and time.", "Thank the office.", "Include the workbook reminder."],
                model: "Sehr geehrtes Team, vielen Dank für Ihr Angebot. Wir nutzen am Freitag gern Raum zwölf ab halb sieben. Ich informiere unsere Gruppe über die Änderung. Alle bringen das blaue Heft mit."),
            partner: "Unser Raum bleibt geschlossen. Das Büro bietet Raum zwölf ab halb sieben an. Passt das für uns?",
            partnerEnglish: "Our room will stay closed. The office offers room twelve from half past six. Does that work for us?",
            response: "Ja, das ist machbar. Ich bestätige dem Büro den Raum und die Uhrzeit. Könntest du der Gruppe Bescheid geben?",
            responseEnglish: "Yes, that is feasible. I will confirm the room and time with the office. Could you let the group know?"
        ))

        days.append(CurriculumBuilder.day(
            78, "Explaining a problem", "Describe a fault, its consequences and a specific request.",
            words: [
                NewWord("die Störung (Plural: die Störungen)", "fault; disruption", "Seit gestern gibt es eine Störung am Aufzug.", "There has been a fault with the lift since yesterday."),
                NewWord("undicht", "leaking; not watertight", "Das Rohr unter dem Waschbecken ist undicht.", "The pipe under the washbasin is leaking."),
                NewWord("beeinträchtigen", "to impair; to affect adversely", "Der Lärm beeinträchtigt meinen Schlaf.", "The noise affects my sleep."),
                NewWord("die Reparatur (Plural: die Reparaturen)", "repair", "Für die Reparatur muss jemand in die Wohnung kommen.", "Someone needs to enter the flat for the repair."),
                NewWord("dringend", "urgent; urgently", "Ich brauche dringend einen Termin.", "I urgently need an appointment.")
            ],
            grammar: "Use seit with present tense for an ongoing fault, and Perfekt for an action already taken. 'Seit gestern tropft das Rohr. Ich habe einen Eimer daruntergestellt.' means 'The pipe has been dripping since yesterday. I have placed a bucket underneath.'",
            reading: ReadingPassage(
                "Seit Dienstag tropft Wasser aus dem Rohr unter Maras Waschbecken. Sie hat einen Eimer daruntergestellt, aber der Schrank wird trotzdem feucht. In einer Nachricht an die Hausverwaltung beschreibt sie die Stelle und bittet um einen schnellen Reparaturtermin.",
                "Water has been dripping from the pipe under Mara's washbasin since Tuesday. She has placed a bucket underneath, but the cupboard is still getting damp. In a message to the property management office she describes the location and asks for a prompt repair appointment.",
                question: "Why does Mara request a prompt repair?", answer: "Because the cupboard is getting damp despite the bucket."),
            writing: WritingTask(
                "Write a clear email to property management about the leaking pipe in the scenario.",
                checklist: ["State where and since when it leaks.", "Explain the consequence and action taken.", "Request a repair and offer access."],
                model: "Sehr geehrtes Team, seit Dienstag ist das Rohr unter meinem Waschbecken undicht. Ich habe einen Eimer daruntergestellt, aber der Schrank wird trotzdem feucht. Könnten Sie bitte dringend eine Reparatur organisieren? Am Donnerstag bin ich ab vierzehn Uhr zu Hause und kann jemanden hereinlassen."),
            partner: "Hausverwaltung, guten Tag. Was funktioniert in Ihrer Wohnung nicht?",
            partnerEnglish: "Property management, hello. What is not working in your flat?",
            response: "Seit Dienstag ist das Rohr unter dem Waschbecken undicht. Der Schrank wird feucht. Könnten Sie bitte einen Reparaturtermin vereinbaren?",
            responseEnglish: "The pipe under the washbasin has been leaking since Tuesday. The cupboard is getting damp. Could you please arrange a repair appointment?",
            guided: "Name the exact fault, its duration, one consequence and the help you need.",
            independent: "Report a household problem clearly, distinguish past actions from the ongoing fault and offer a practical next step."
        ))

        days.append(CurriculumBuilder.day(
            79, "Proposing a compromise", "Balance two needs and suggest a workable middle ground.",
            words: [
                NewWord("der Kompromiss (Plural: die Kompromisse)", "compromise", "Wir haben einen Kompromiss für die Probe gefunden.", "We found a compromise for the rehearsal."),
                NewWord("Rücksicht nehmen", "to show consideration", "Bitte nimm auf die Nachbarn Rücksicht.", "Please show consideration for the neighbours."),
                NewWord("verschieben", "to postpone; to move to another time", "Wir verschieben die Probe auf den Nachmittag.", "We move the rehearsal to the afternoon."),
                NewWord("einverstanden", "in agreement", "Mit dieser Lösung bin ich einverstanden.", "I agree with this solution."),
                NewWord("beiderseits", "on both sides", "Es gibt beiderseits gute Gründe.", "There are good reasons on both sides.")
            ],
            grammar: "Use zwar ... aber to acknowledge a point before a limitation. 'Ich möchte zwar üben, aber du brauchst Ruhe.' means 'I do want to practise, but you need quiet.' Follow it with a concrete suggestion rather than only disagreement.",
            reading: ReadingPassage(
                "Timo möchte am Abend Gitarre üben, aber seine Nachbarin arbeitet früh und braucht Ruhe. Sie sprechen über ihre Zeiten, statt sich nur zu beschweren. Schließlich vereinbaren sie eine halbe Stunde am Nachmittag und Kopfhörer für die elektrische Gitarre am Abend.",
                "Timo wants to practise guitar in the evening, but his neighbour works early and needs quiet. They discuss their schedules instead of only complaining. Finally they agree on half an hour in the afternoon and headphones for the electric guitar in the evening.",
                question: "What arrangement allows Timo to practise in the evening?", answer: "He uses headphones with the electric guitar."),
            writing: WritingTask(
                "Write a considerate reply to a neighbour about music practice.",
                checklist: ["Acknowledge the neighbour's need.", "Explain your own need.", "Suggest precise times and ask for agreement."],
                model: "Ich verstehe, dass du früh schlafen musst. Ich möchte zwar regelmäßig Gitarre üben, aber ich will auf dich Rücksicht nehmen. Deshalb schlage ich vor, von sechzehn bis sechzehn Uhr dreißig zu üben und ab achtzehn Uhr nur mit Kopfhörern zu spielen. Bist du mit diesem Kompromiss einverstanden?"),
            partner: "Ich muss früh aufstehen und kann wegen deiner Musik abends nicht schlafen. Was können wir ändern?",
            partnerEnglish: "I have to get up early and cannot sleep because of your music in the evening. What can we change?",
            response: "Ich verstehe dein Problem. Ich könnte am Nachmittag üben und abends Kopfhörer benutzen. Wärst du damit einverstanden?",
            responseEnglish: "I understand your problem. I could practise in the afternoon and use headphones in the evening. Would you agree to that?",
            guided: "Acknowledge the problem, propose two concrete changes and check agreement.",
            independent: "Negotiate a shared-space disagreement by explaining both needs and proposing a specific compromise."
        ))

        days.append(CurriculumBuilder.day(
            80, "Summarising a text", "Retell the essential facts without adding unsupported information.",
            words: [
                NewWord("zusammenfassen", "to summarise", "Ich fasse den Artikel in drei Sätzen zusammen.", "I summarise the article in three sentences."),
                NewWord("die Kernaussage (Plural: die Kernaussagen)", "main message", "Die Kernaussage steht im letzten Absatz.", "The main message is in the last paragraph."),
                NewWord("wesentlich", "essential", "Für die Zusammenfassung sind drei Angaben wesentlich.", "Three details are essential for the summary."),
                NewWord("weglassen", "to leave out", "Unwichtige Einzelheiten lasse ich weg.", "I leave out unimportant details."),
                NewWord("es geht um", "it is about", "In dem Text geht es um einen offenen Bücherschrank.", "The text is about a public book-exchange cabinet.")
            ],
            grammar: "A dass clause can report a main fact without copying a whole text. 'Der Text erklärt, dass der Bücherschrank kostenlos ist.' means 'The text explains that the book cabinet is free to use.' Put the conjugated verb at the end.",
            reading: ReadingPassage(
                "Auf dem Lindenplatz steht seit Montag ein offener Bücherschrank. Alle dürfen kostenlos Bücher mitnehmen oder gut erhaltene Bücher hineinstellen. Ein Nachbarschaftsteam prüft jeden Freitag, ob die Bücher trocken und ordentlich stehen. Die Stadt bittet darum, keine Kartons neben den Schrank zu stellen.",
                "A public book-exchange cabinet has stood on Linden Square since Monday. Anyone may take books free of charge or put books in good condition inside. A neighbourhood team checks every Friday that the books are dry and neatly arranged. The city asks people not to leave boxes beside the cabinet.",
                question: "What does the city ask people not to do?", answer: "Not to leave boxes beside the book cabinet."),
            writing: WritingTask(
                "Summarise the book-cabinet notice for a friend in three or four sentences without adding your opinion.",
                checklist: ["Identify the place and purpose.", "Explain how people can participate.", "Include the restriction without inventing rules."],
                model: "In dem Text geht es um einen offenen Bücherschrank auf dem Lindenplatz. Man darf kostenlos Bücher mitnehmen und gut erhaltene Bücher hineinstellen. Ein Team kontrolliert den Schrank freitags. Kartons sollen nicht daneben abgestellt werden."),
            partner: "Ich habe den Text über den Bücherschrank nicht gelesen. Was muss ich wissen?",
            partnerEnglish: "I have not read the text about the book cabinet. What do I need to know?",
            response: "Auf dem Lindenplatz gibt es einen kostenlosen Bücherschrank. Man kann Bücher mitnehmen oder hineinstellen. Kartons darf man nicht daneben abstellen.",
            responseEnglish: "There is a free book-exchange cabinet on Linden Square. You can take books or put them inside. You must not leave boxes beside it.",
            guided: "Give the location, exchange principle and restriction using only facts in the text.",
            independent: "Summarise the notice from memory, then check whether you omitted a key fact or added an unsupported detail."
        ))

        days.append(CurriculumBuilder.day(
            81, "Giving a short opinion", "Present a balanced view with a reason and an everyday example.",
            words: [
                NewWord("einerseits", "on the one hand", "Einerseits spart die neue Regel Zeit.", "On the one hand, the new rule saves time."),
                NewWord("andererseits", "on the other hand", "Andererseits brauchen manche Menschen mehr Unterstützung.", "On the other hand, some people need more support."),
                NewWord("nachvollziehbar", "understandable", "Deine Sorge ist nachvollziehbar.", "Your concern is understandable."),
                NewWord("die Entlastung (Plural: die Entlastungen)", "relief; reduction of burden", "Ein freier Nachmittag ist für das Team eine Entlastung.", "An afternoon off gives the team some relief."),
                NewWord("befürworten", "to support; to favour", "Ich befürworte längere Öffnungszeiten am Donnerstag.", "I support longer opening hours on Thursdays.")
            ],
            grammar: "Use einerseits ... andererseits to organise two sides of an issue. 'Einerseits sind Online-Termine praktisch, andererseits brauchen manche Menschen Hilfe.' means 'On the one hand, online appointments are convenient; on the other hand, some people need help.' Each part has normal main-clause verb placement.",
            reading: ReadingPassage(
                "Die Stadtbibliothek möchte ihre Ausleihe auch sonntags mit Selbstbedienung öffnen. Für Berufstätige wäre das praktisch, aber sonntags wäre kein Personal für Fragen da. Im Stadtteil wird deshalb diskutiert, ob eine kurze Beratung am Samstag die neue Regel ergänzen könnte.",
                "The city library wants to open its lending service on Sundays using self-service. This would be convenient for working people, but there would be no staff to answer questions on Sundays. The neighbourhood is therefore discussing whether a short advice session on Saturday could complement the new arrangement.",
                question: "What disadvantage of Sunday self-service is mentioned?", answer: "There would be no staff to answer questions."),
            writing: WritingTask(
                "Write a short opinion for a neighbourhood discussion about Sunday library self-service.",
                checklist: ["State your position.", "Give a benefit and a limitation.", "Suggest a practical improvement."],
                model: "Ich befürworte die Öffnung am Sonntag, weil ich unter der Woche lange arbeite. Einerseits könnte ich dann in Ruhe Bücher ausleihen. Andererseits ist die Sorge wegen fehlender Beratung nachvollziehbar. Eine zusätzliche Beratung am Samstag wäre deshalb eine gute Ergänzung."),
            partner: "Soll die Bibliothek sonntags ohne Personal öffnen? Was hältst du davon?",
            partnerEnglish: "Should the library open on Sundays without staff? What do you think?",
            response: "Einerseits wäre das für Berufstätige praktisch. Andererseits fehlt dann die Beratung. Ich befürworte die Idee, wenn es samstags zusätzliche Hilfe gibt.",
            responseEnglish: "On the one hand, that would be convenient for working people. On the other hand, advice would then be unavailable. I support the idea if there is extra help on Saturdays.",
            guided: "Give one advantage, one limitation and your qualified opinion.",
            independent: "Present a short balanced opinion about a public service, supported by an everyday example and a suggestion."
        ))

        days.append(CurriculumBuilder.day(
            82, "Managing an appointment", "Combine scheduling constraints, preparation and written confirmation.",
            words: [
                NewWord("die Terminbestätigung (Plural: die Terminbestätigungen)", "appointment confirmation", "Ich habe die Terminbestätigung per E-Mail erhalten.", "I received the appointment confirmation by email."),
                NewWord("das Zeitfenster (Plural: die Zeitfenster)", "time window", "Am Donnerstag habe ich ein Zeitfenster von zwei Stunden.", "On Thursday I have a two-hour time window."),
                NewWord("die Unterlage (Plural: die Unterlagen)", "document", "Welche Unterlagen soll ich zur Beratung mitbringen?", "Which documents should I bring to the consultation?"),
                NewWord("nachreichen", "to submit later", "Die fehlende Bescheinigung kann ich morgen nachreichen.", "I can submit the missing certificate tomorrow."),
                NewWord("verbindlich", "firm; binding", "Ich bestätige den Termin verbindlich.", "I firmly confirm the appointment.")
            ],
            grammar: "Use bevor to put preparation before another action. 'Bevor ich zur Beratung komme, schicke ich meine Unterlagen.' means 'Before I come to the consultation, I will send my documents.' The bevor clause has its conjugated verb at the end.",
            reading: ReadingPassage(
                "Lina hat am Donnerstag um vierzehn Uhr einen Beratungstermin im Bildungszentrum. Sie muss um sechzehn Uhr ihr Kind abholen und fragt deshalb, ob eine Stunde genügt. Das Büro bestätigt die Dauer und bittet sie, vorher ihren Lebenslauf zu schicken. Ein fehlendes Kurszeugnis darf sie am Freitag nachreichen.",
                "Lina has a consultation at the education centre on Thursday at two in the afternoon. She must pick up her child at four, so she asks whether an hour is enough. The office confirms the duration and asks her to send her CV beforehand. She may submit a missing course certificate on Friday.",
                question: "Which document may Lina submit after the consultation?", answer: "The missing course certificate."),
            writing: WritingTask(
                "Write a full confirmation email for Lina's consultation, including her time limit and documents.",
                checklist: ["Confirm date and start time.", "Explain the pickup constraint and agreed duration.", "Distinguish documents sent beforehand from one sent later."],
                model: "Sehr geehrtes Beratungsteam, ich bestätige meinen Termin am Donnerstag um vierzehn Uhr. Vielen Dank für die Information, dass das Gespräch eine Stunde dauert. Da ich um sechzehn Uhr mein Kind abholen muss, passt dieser Zeitrahmen gut. Meinen Lebenslauf schicke ich Ihnen vor dem Gespräch, und das fehlende Kurszeugnis reiche ich wie vereinbart am Freitag nach.\nMit freundlichen Grüßen\nLina Weber"),
            partner: "Ihr Beratungstermin ist am Donnerstag um vierzehn Uhr. Haben Sie noch Fragen zum Ablauf oder zu den Unterlagen?",
            partnerEnglish: "Your consultation is on Thursday at two. Do you have any further questions about the procedure or documents?",
            response: "Ich bestätige den Termin am Donnerstag um vierzehn Uhr. Ich muss um sechzehn Uhr mein Kind abholen. Reicht eine Stunde für das Gespräch? Meinen Lebenslauf schicke ich vorher; darf ich das Kurszeugnis am Freitag nachreichen?",
            responseEnglish: "I confirm the appointment on Thursday at two in the afternoon. I have to pick up my child at four. Is one hour enough for the consultation? I will send my CV beforehand; may I submit the course certificate on Friday?",
            guided: "Confirm the appointment, state the time constraint and ask permission to submit one document later.",
            independent: "Manage an appointment with a scheduling constraint, document requirements and a clear final confirmation."
        ))

        days.append(CurriculumBuilder.day(
            83, "Reflecting on learning", "Identify evidence of progress and choose a manageable next step.",
            words: [
                NewWord("der Lernfortschritt (Plural: die Lernfortschritte)", "learning progress", "Ich sehe meinen Lernfortschritt an meinen alten Texten.", "I can see my learning progress in my old texts."),
                NewWord("die Selbsteinschätzung (Plural: die Selbsteinschätzungen)", "self-assessment", "Meine Selbsteinschätzung hilft mir bei der Planung.", "My self-assessment helps me plan."),
                NewWord("gezielt", "in a targeted way", "Diese Woche übe ich gezielt Rückfragen.", "This week I am practising follow-up questions in a targeted way."),
                NewWord("festigen", "to consolidate", "Ich möchte die neuen Satzmuster festigen.", "I would like to consolidate the new sentence patterns."),
                NewWord("noch nicht sicher", "not yet confident; not yet secure", "Bei langen Durchsagen bin ich noch nicht sicher.", "I am not yet confident with long announcements.")
            ],
            grammar: "Use schon and noch nicht to distinguish progress from the next goal. 'Ich kann schon Termine vereinbaren, aber lange Durchsagen verstehe ich noch nicht sicher.' means 'I can already arrange appointments, but I do not yet understand long announcements confidently.'",
            reading: ReadingPassage(
                "Nach drei Wochen vergleicht Samira zwei eigene E-Mails. In der neueren Nachricht nennt sie den Anlass und stellt klare Fragen, während diese Angaben früher gefehlt haben. Beim freien Sprechen sucht sie noch oft nach Wörtern. Deshalb plant sie kurze Gespräche über bekannte Alltagsthemen statt immer neue Listen zu lernen.",
                "After three weeks Samira compares two emails she wrote. In the newer message she states the reason for writing and asks clear questions, whereas those details were missing before. In free speaking she still often searches for words. She therefore plans short conversations on familiar everyday topics instead of always learning new lists.",
                question: "What evidence of progress does Samira find?", answer: "Her newer email states its purpose and asks clear questions."),
            writing: WritingTask(
                "Write a learning reflection based on two of your own or imagined practice attempts.",
                checklist: ["Give a concrete example of progress.", "Name a remaining difficulty.", "Plan one focused practice activity."],
                model: "In meiner ersten E-Mail habe ich die Uhrzeit vergessen, aber in der zweiten stehen alle wichtigen Angaben. Ich kann inzwischen auch höflich nach einem Termin fragen. Beim freien Sprechen bin ich noch nicht sicher und suche oft nach Wörtern. Deshalb übe ich diese Woche jeden Abend ein zweiminütiges Gespräch über Termine."),
            partner: "Was gelingt dir inzwischen besser, und was möchtest du als Nächstes gezielt üben?",
            partnerEnglish: "What can you do better by now, and what would you like to practise next in a targeted way?",
            response: "Ich kann schon klare Terminfragen schreiben. Beim freien Sprechen bin ich noch nicht sicher und suche nach Wörtern. Ich möchte kurze Gespräche üben und bekannte Satzmuster festigen.",
            responseEnglish: "I can already write clear questions about appointments. When speaking freely, I am not yet confident and search for words. I would like to practise short conversations and consolidate familiar sentence patterns.",
            guided: "Use already and not yet to name one evidenced improvement and one targeted next step.",
            independent: "Compare two practice attempts, describe a specific change and choose a realistic activity for the remaining difficulty."
        ))

        days.append(CurriculumBuilder.review(
            84, "Review: solutions and reflection", previous: days,
            grammar: "Connect a problem to a consequence and a tentative solution. 'Der Termin ist zu spät. Deshalb könnte ich nur telefonisch teilnehmen.' means 'The appointment is too late. Therefore I could only take part by phone.' Could is a useful scaffold for proposing an option.",
            reading: ReadingPassage(
                "Die Hausverwaltung bietet Mara einen Reparaturtermin am Donnerstag um fünfzehn Uhr an. Sie muss aber um halb vier ihr Kind abholen und schlägt deshalb einen früheren Termin vor. Nach dem Telefonat schreibt sie die vereinbarte Uhrzeit auf und bestätigt sie per E-Mail. In ihrem Lerntagebuch notiert sie, dass sie diesmal ohne Hilfe eine Rückfrage gestellt hat.",
                "The property management office offers Mara a repair appointment on Thursday at three in the afternoon. But she must pick up her child at half past three, so she suggests an earlier appointment. After the call she writes down the agreed time and confirms it by email. In her learning diary she notes that this time she asked a follow-up question without help.",
                question: "What language achievement does Mara record?", answer: "She asked a follow-up question without help."),
            writing: WritingTask(
                "Request an earlier repair appointment and briefly reflect on the communication task.",
                checklist: ["Explain the time conflict.", "Suggest a specific alternative.", "Name one skill you used or still need to practise."],
                model: "Vielen Dank für Ihren Terminvorschlag am Donnerstag um fünfzehn Uhr. Da ich um halb vier mein Kind abholen muss, wäre vierzehn Uhr für mich besser. Könnten Sie prüfen, ob dieser Termin möglich ist? Die höfliche Anfrage gelingt mir schon, aber die Bestätigung der Uhrzeit möchte ich noch üben."),
            partner: "Der Reparaturtermin ist am Donnerstag um fünfzehn Uhr, aber du musst kurz danach gehen. Welche Lösung schlägst du vor?",
            partnerEnglish: "The repair appointment is on Thursday at three, but you have to leave soon afterwards. What solution do you suggest?",
            response: "Ich muss um halb vier mein Kind abholen. Könnte die Reparatur schon um vierzehn Uhr beginnen? Bitte bestätigen Sie mir die neue Uhrzeit schriftlich.",
            responseEnglish: "I have to pick up my child at half past three. Could the repair start as early as two in the afternoon? Please confirm the new time to me in writing."
        ))

        days.append(CurriculumBuilder.day(
            85, "Reading and writing rehearsal", "Turn an original notice into a complete, relevant email response.",
            words: [
                NewWord("die Anforderung (Plural: die Anforderungen)", "requirement", "Ich markiere die Anforderungen in der Nachricht.", "I mark the requirements in the message."),
                NewWord("der Entwurf (Plural: die Entwürfe)", "draft", "Vor dem Abschicken lese ich meinen Entwurf.", "Before sending it I read my draft."),
                NewWord("überarbeiten", "to revise", "Ich überarbeite den unklaren Satz.", "I revise the unclear sentence."),
                NewWord("vollständig", "complete", "Meine Antwort ist jetzt vollständig.", "My reply is now complete."),
                NewWord("sich beziehen auf", "to refer to", "Meine Frage bezieht sich auf den Ersatztermin.", "My question refers to the replacement date.")
            ],
            grammar: "Use a relative clause to identify a specific appointment. 'Der Termin, den Sie vorgeschlagen haben, passt mir nicht.' means 'The appointment that you suggested does not suit me.' Den is the masculine accusative relative pronoun because the appointment is the object of vorgeschlagen haben.",
            reading: ReadingPassage(
                "Ihr Reparaturkurs am Samstag wird auf Sonntag von zehn bis dreizehn Uhr verschoben. Bitte bestätigen Sie bis Mittwoch, ob Sie teilnehmen können, und nennen Sie das Gerät, das Sie mitbringen möchten. Wer am Sonntag keine Zeit hat, kann nach einem Termin im nächsten Monat fragen. Für die Teilnahme ist in diesem Übungsszenario keine eigene Werkzeugkiste nötig.",
                "Your repair workshop on Saturday is being moved to Sunday from ten until one. Please confirm by Wednesday whether you can attend and name the device you would like to bring. Anyone unavailable on Sunday can ask for a date next month. In this practice scenario, participants do not need their own toolbox.",
                question: "What two details must the reply include if you can attend?", answer: "Confirmation that you can attend and the device you want to bring."),
            writing: WritingTask(
                "Use the original practice notice to write an email declining Sunday and asking for the next workshop. This is exam-support practice, not an official test.",
                checklist: ["Refer to the changed workshop date.", "Explain your unavailability and ask about next month.", "Name a device and check the reply for completeness."],
                model: "Sehr geehrtes Kursteam, vielen Dank für die Nachricht zum verschobenen Reparaturkurs. Am Sonntag kann ich leider nicht teilnehmen, weil ich arbeiten muss. Könnten Sie mir einen Termin im nächsten Monat nennen? Ich möchte einen kleinen Ventilator mitbringen und wissen, ob dieses Gerät für den Kurs geeignet ist.\nMit freundlichen Grüßen\nAlex Braun"),
            partner: "Was steht in der Kursnachricht, und wie möchtest du darauf antworten?",
            partnerEnglish: "What does the course message say, and how would you like to reply?",
            response: "Der Kurs wurde auf Sonntag verschoben. Ich kann dann nicht teilnehmen und frage nach einem Termin im nächsten Monat. In meiner Antwort nenne ich auch meinen Ventilator.",
            responseEnglish: "The workshop was moved to Sunday. I cannot attend then and will ask about a date next month. In my reply I will also mention my fan.",
            guided: "Identify the change and reply requirements, then outline a relevant email before writing it.",
            independent: "Read the notice, cover the model and draft your response; check every requested point without using a pass score."
        ))

        days.append(CurriculumBuilder.day(
            86, "Introducing yourself aloud", "Give a relevant self-introduction and invite a follow-up question.",
            words: [
                NewWord("der Werdegang (Plural: die Werdegänge)", "personal or professional background", "Ich beschreibe meinen beruflichen Werdegang kurz.", "I briefly describe my professional background."),
                NewWord("der Schwerpunkt (Plural: die Schwerpunkte)", "main focus", "Mein Schwerpunkt liegt auf Gesprächen im Alltag.", "My main focus is everyday conversations."),
                NewWord("der Beweggrund (Plural: die Beweggründe)", "motivation; underlying reason", "Mein Beweggrund für den Kurs ist der Kontakt zu Nachbarn.", "My motivation for the course is contact with neighbours."),
                NewWord("derzeit", "currently", "Derzeit arbeite ich in einer Bäckerei.", "I currently work in a bakery."),
                NewWord("anknüpfen", "to build on; to connect to", "Mit einer Frage kann ich an deine Erfahrung anknüpfen.", "I can build on your experience with a question.")
            ],
            grammar: "Connect a learning goal with um ... zu when the subject remains the same. 'Ich lerne Deutsch, um mit meinen Nachbarn zu sprechen.' means 'I am learning German in order to speak with my neighbours.' Do not add a second subject inside the um ... zu phrase.",
            reading: ReadingPassage(
                "Bei einem offenen Gesprächstreff stellt sich Dario kurz vor. Er erzählt, dass er derzeit in einer Bäckerei arbeitet und Deutsch für Gespräche mit Kunden übt. Private Einzelheiten lässt er weg, weil sie für den Treff nicht nötig sind. Danach fragt eine Teilnehmerin, welche Gespräche ihm bei der Arbeit besonders schwerfallen.",
                "At an open conversation meetup, Dario briefly introduces himself. He says that he currently works in a bakery and practises German for conversations with customers. He leaves out private details because they are not needed for the meetup. Afterwards a participant asks which conversations at work he finds especially difficult.",
                question: "Why does Dario leave out private details?", answer: "They are not needed for this meetup."),
            writing: WritingTask(
                "Prepare a five-sentence introduction for a conversation group; use an invented identity if preferred.",
                checklist: ["Include relevant present and past details.", "Explain a learning goal and motivation.", "End with a question that invites conversation."],
                model: "Ich heiße Dario und wohne seit einem Jahr hier im Viertel. Früher habe ich in einem Lager gearbeitet, und derzeit arbeite ich in einer Bäckerei. Ich lerne Deutsch, um sicherer mit Kunden zu sprechen. Besonders möchte ich üben, wie ich Bestellungen am Telefon verstehe. In welchen Situationen braucht ihr Deutsch am häufigsten?"),
            partner: "Willkommen beim Gesprächstreff. Stell dich bitte kurz vor und erzähle, warum du Deutsch lernst.",
            partnerEnglish: "Welcome to the conversation meetup. Please introduce yourself briefly and explain why you are learning German.",
            response: "Ich heiße Dario und arbeite derzeit in einer Bäckerei. Früher habe ich in einem Lager gearbeitet. Ich lerne Deutsch, um besser mit Kunden zu sprechen. Welche Gespräche möchtet ihr hier üben?",
            responseEnglish: "My name is Dario and I currently work in a bakery. I used to work in a warehouse. I am learning German to speak better with customers. Which conversations would you like to practise here?",
            guided: "Build an introduction with current activity, one relevant background detail, motivation and a follow-up question.",
            independent: "Introduce yourself or an invented person without a script, sharing only relevant details and inviting a question."
        ))

        days.append(CurriculumBuilder.day(
            87, "Prepared planning rehearsal", "Move from brief planning notes to a negotiated agreement.",
            words: [
                NewWord("das Stichwort (Plural: die Stichwörter)", "key word; brief note", "Ich notiere nur Stichwörter für das Gespräch.", "I note only key words for the conversation."),
                NewWord("der Ablauf (Plural: die Abläufe)", "sequence; schedule", "Wir besprechen den Ablauf des Aktionstags.", "We discuss the schedule for the activity day."),
                NewWord("die Zuständigkeit (Plural: die Zuständigkeiten)", "area of responsibility", "Die Zuständigkeiten sollen am Ende klar sein.", "Responsibilities should be clear at the end."),
                NewWord("festlegen", "to decide on; to set", "Wir legen den Treffpunkt gemeinsam fest.", "We decide on the meeting point together."),
                NewWord("die Rückmeldung (Plural: die Rückmeldungen)", "response; feedback", "Ich brauche deine Rückmeldung bis Dienstag.", "I need your response by Tuesday.")
            ],
            grammar: "Use nachdem to make a past sequence clear: the earlier completed action can use the pluperfect. 'Nachdem wir den Raum reserviert hatten, haben wir die Einladungen verschickt.' means 'After we had reserved the room, we sent the invitations.' Recognise this pattern; simple planning language is sufficient for the task.",
            reading: ReadingPassage(
                "Ein Nachbarschaftsteam plant einen Aktionstag zum Reparieren kleiner Geräte. Bevor es die Einladungen verschickt, muss es Raum, Uhrzeit und Zuständigkeiten festlegen. Bea kann den Raum anfragen, hat aber am Veranstaltungstag nur bis mittags Zeit. Omar übernimmt deshalb den Empfang am Nachmittag und bittet bis Dienstag um Rückmeldung.",
                "A neighbourhood team is planning an activity day for repairing small devices. Before sending invitations it must decide on the room, time and responsibilities. Bea can enquire about the room but is only available until midday on the day itself. Omar therefore takes on the afternoon reception and asks for a response by Tuesday.",
                question: "Why does Omar take on afternoon reception?", answer: "Because Bea is only available until midday."),
            writing: WritingTask(
                "After a planning rehearsal, write a clear agreement email for an imagined repair day.",
                checklist: ["Confirm location and schedule.", "Allocate tasks around one availability limit.", "Set a deadline for the remaining confirmation."],
                model: "Hallo zusammen, wir planen den Reparaturtag am Samstag von zehn bis sechzehn Uhr im Nachbarschaftsraum. Bea fragt den Raum an und hilft vormittags beim Aufbau. Da sie mittags gehen muss, übernimmt Omar den Empfang am Nachmittag. Ich verschicke die Einladungen, sobald der Raum bestätigt ist. Bitte gebt mir bis Dienstag Rückmeldung zu euren Aufgaben."),
            partner: "Wir planen einen Reparaturtag, aber ich kann nur vormittags helfen. Wie teilen wir die Aufgaben auf?",
            partnerEnglish: "We are planning a repair day, but I can only help in the morning. How shall we divide the tasks?",
            response: "Du könntest den Raum anfragen und beim Aufbau helfen. Ich übernehme nachmittags den Empfang. Lass uns die Zeiten bis Dienstag festlegen.",
            responseEnglish: "You could enquire about the room and help with setting up. I will take care of reception in the afternoon. Let us decide on the times by Tuesday.",
            guided: "Prepare key words for place, times and tasks, then respond to your partner's availability limit.",
            independent: "Rehearse a planning dialogue from notes, adapt to one changed constraint and finish by confirming who does what."
        ))

        days.append(CurriculumBuilder.day(
            88, "Repair strategies in conversation", "Keep a conversation going when a word or detail is unclear.",
            words: [
                NewWord("umschreiben", "to paraphrase", "Wenn mir ein Wort fehlt, umschreibe ich es.", "When I cannot find a word, I paraphrase it."),
                NewWord("buchstabieren", "to spell aloud", "Könnten Sie den Straßennamen bitte buchstabieren?", "Could you spell the street name, please?"),
                NewWord("langsamer", "more slowly", "Könnten Sie bitte etwas langsamer sprechen?", "Could you speak a little more slowly, please?"),
                NewWord("anders ausgedrückt", "in other words", "Anders ausgedrückt: Ich brauche einen späteren Termin.", "In other words, I need a later appointment."),
                NewWord("habe ich richtig verstanden", "have I understood correctly", "Habe ich richtig verstanden, dass der Eingang hinten ist?", "Have I understood correctly that the entrance is at the back?")
            ],
            grammar: "Use a relative clause to describe an unknown word by function. 'Ich suche das Gerät, mit dem man Papier schneidet.' means 'I am looking for the device with which one cuts paper.' Mit takes dative, so das Gerät becomes mit dem in this relative clause.",
            reading: ReadingPassage(
                "Am Telefon versteht Ruben den Straßennamen für seinen Termin nicht. Er bittet die Mitarbeiterin, langsamer zu sprechen und den Namen zu buchstabieren. Danach wiederholt er Adresse und Uhrzeit, statt nur ja zu sagen. Als ihm das Wort für den Eingang fehlt, fragt er, durch welche Tür er ins Gebäude kommt.",
                "On the phone Ruben does not understand the street name for his appointment. He asks the staff member to speak more slowly and spell the name. Then he repeats the address and time instead of just saying yes. When he cannot find the word for the entrance, he asks which door he should use to enter the building.",
                question: "How does Ruben check the appointment details?", answer: "He repeats the address and time."),
            writing: WritingTask(
                "Write a follow-up email after a difficult phone call, checking the details you understood.",
                checklist: ["Refer to the call politely.", "Confirm an address and time.", "Ask a clear question about an unclear detail."],
                model: "Sehr geehrte Frau Berger, vielen Dank für das Telefongespräch. Habe ich richtig verstanden, dass mein Termin am Dienstag um zehn Uhr in der Gartenstraße zwölf stattfindet? Den Straßennamen konnte ich nach dem Buchstabieren gut notieren. Ich bin aber noch unsicher, welche Tür ich benutzen soll. Könnten Sie mir bitte mitteilen, ob der Eingang auf der Hofseite liegt?"),
            partner: "Ihr Termin ist in der Gartenstraße zwölf, Zugang über die Hofseite. Ist alles klar?",
            partnerEnglish: "Your appointment is at twelve Gartenstraße, with access from the courtyard side. Is everything clear?",
            response: "Könnten Sie den Straßennamen bitte buchstabieren? Habe ich richtig verstanden, dass ich durch den Hof gehen muss? Um wie viel Uhr ist der Termin?",
            responseEnglish: "Could you spell the street name, please? Have I understood correctly that I have to go through the courtyard? What time is the appointment?",
            guided: "Ask for spelling, check the entrance in your own words and request the missing time.",
            independent: "Rehearse a call in which you do not understand one detail: ask for clarification, paraphrase and confirm the final information."
        ))

        days.append(CurriculumBuilder.day(
            89, "A personal practice plan", "Choose practical goals and schedule review using evidence rather than scores.",
            words: [
                NewWord("der Übungsbedarf (kein Plural)", "need for practice", "Bei telefonischen Rückfragen sehe ich noch Übungsbedarf.", "I still see a need for practice with follow-up questions on the phone."),
                NewWord("die Routine (Plural: die Routinen)", "routine", "Eine kurze Wiederholung gehört zu meiner täglichen Routine.", "A short review is part of my daily routine."),
                NewWord("der Nachweis (Plural: die Nachweise)", "evidence; proof", "Als Nachweis meines Fortschritts behalte ich zwei Textentwürfe.", "I keep two text drafts as evidence of my progress."),
                NewWord("einplanen", "to schedule; to allow time for", "Ich plane zehn Minuten für Rückfragen ein.", "I schedule ten minutes for follow-up questions."),
                NewWord("überschaubar", "manageable", "Mein Wochenplan bleibt überschaubar.", "My weekly plan remains manageable.")
            ],
            grammar: "Use damit for a purpose when the clauses have different subjects. 'Ich notiere die Fragen, damit mein Lernpartner sie mir stellen kann.' means 'I write down the questions so that my learning partner can ask me them.' Damit introduces a verb-final clause.",
            reading: ReadingPassage(
                "Mina wählt für die nächste Woche zwei Ziele: eine klare Anfrage schreiben und am Telefon nachfragen. Sie plant an drei Abenden jeweils zehn Minuten und bittet einen Lernpartner um ein kurzes Gespräch. Als Nachweis sammelt sie einen ersten und einen überarbeiteten E-Mail-Entwurf. Wenn ihr Plan zu voll wird, kürzt sie die Übungen, statt ganz aufzuhören.",
                "Mina chooses two goals for next week: writing a clear enquiry and asking for clarification on the phone. She schedules ten minutes on each of three evenings and asks a learning partner for a short conversation. As evidence she keeps a first and a revised email draft. If her schedule becomes too full, she shortens the exercises instead of stopping completely.",
                question: "What does Mina do if her schedule becomes too full?", answer: "She shortens the exercises rather than stopping completely."),
            writing: WritingTask(
                "Write a realistic one-week practice plan for two everyday communication needs.",
                checklist: ["Choose two specific skills.", "Schedule short activities and a fallback.", "Explain what evidence you will compare."],
                model: "Nächste Woche möchte ich eine formelle Anfrage schreiben und telefonische Rückfragen üben. Dafür plane ich am Montag, Mittwoch und Freitag jeweils zehn Minuten ein. Am Montag schreibe ich einen Entwurf, und am Mittwoch überarbeite ich ihn mit einer Checkliste. Am Freitag übe ich mit einem Lernpartner, damit er mir unerwartete Fragen stellen kann. Wenn wenig Zeit bleibt, übe ich nur fünf Minuten und vergleiche am Wochenende meine beiden Texte."),
            partner: "Welche zwei Alltagssituationen möchtest du nächste Woche üben, und wie bleibt dein Plan realistisch?",
            partnerEnglish: "Which two everyday situations would you like to practise next week, and how will your plan stay realistic?",
            response: "Ich übe eine formelle Anfrage und Rückfragen am Telefon. Dafür plane ich dreimal zehn Minuten ein. Wenn ich wenig Zeit habe, kürze ich die Übung auf fünf Minuten. Ich vergleiche meinen ersten und meinen überarbeiteten Entwurf, um meinen Fortschritt zu prüfen.",
            responseEnglish: "I will practise a formal enquiry and follow-up questions on the phone. I will schedule three ten-minute sessions for this. If I have little time, I will shorten the exercise to five minutes. I will compare my first and revised drafts to check my progress.",
            guided: "Name two communication needs, schedule short sessions and define one visible sign of progress.",
            independent: "Explain a personal weekly practice plan with a fallback and evidence you can compare, without setting a pass score."
        ))

        days.append(CurriculumBuilder.review(
            90, "Final consolidation and self-assessment", previous: days,
            grammar: "Combine useful patterns rather than aiming to use every structure. 'Obwohl ich manchmal Wörter suche, kann ich nachfragen. Ich übe weiter, damit Gespräche leichter werden.' means 'Although I sometimes search for words, I can ask for clarification. I keep practising so that conversations become easier.'",
            reading: ReadingPassage(
                "Nach neunzig Tagen liest Mina eine alte Anfrage und schreibt eine neue zu einem ähnlichen Anlass. Diesmal nennt sie alle wichtigen Angaben und bittet höflich um eine Bestätigung. In einem anschließenden Planungsgespräch fragt sie nach, als sie eine Uhrzeit nicht versteht. Sie notiert konkrete Fortschritte und einen nächsten Übungsschritt; diese Selbsteinschätzung ist kein offizielles Prüfungsergebnis.",
                "After ninety days Mina reads an old enquiry and writes a new one for a similar purpose. This time she includes all important details and politely asks for confirmation. In a subsequent planning conversation she asks for clarification when she does not understand a time. She records specific progress and one next practice step; this self-assessment is not an official examination result.",
                question: "What does Mina use as evidence of progress?", answer: "A more complete enquiry and asking for clarification about a time in conversation."),
            writing: WritingTask(
                "Write a final reflection linking a reading-to-email task and a planning conversation. These original activities support exam preparation; they are not an official telc test, a proficiency certificate or a prediction of passing.",
                checklist: ["Describe evidence from one written and one spoken attempt.", "Name a skill that still needs support.", "Choose a specific next practice step without awarding a pass score."],
                model: "Heute habe ich eine Anfrage mit Anlass, Datum und einer klaren Frage geschrieben. Im Planungsgespräch habe ich die Uhrzeit noch einmal bestätigen lassen, statt nur zuzustimmen. Bei längeren Durchsagen brauche ich weiterhin Wiederholungen und Notizen. Nächste Woche übe ich deshalb drei kurze Ansagen und vergleiche meine Notizen mit dem Text. Diese Beispiele zeigen mir meine nächsten Lernschritte, ersetzen aber keine offizielle Prüfung."),
            partner: "Welche Aufgaben kannst du jetzt selbstständig lösen, wobei brauchst du noch Hilfe, und wie übst du weiter?",
            partnerEnglish: "Which tasks can you now manage independently, where do you still need help, and how will you keep practising?",
            response: "Ich kann eine klare Anfrage schreiben und eine Planung besprechen. Bei langen Durchsagen brauche ich noch Hilfe, aber ich kann gezielt nachfragen. Als Nächstes übe ich kurze Ansagen und prüfe meine Notizen.",
            responseEnglish: "I can write a clear enquiry and discuss a plan. I still need help with long announcements, but I can ask targeted questions. Next I will practise short announcements and check my notes."
        ))

        return days
    }()
}
