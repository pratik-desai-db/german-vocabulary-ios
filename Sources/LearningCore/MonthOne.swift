enum MonthOne {
    static let days: [CurriculumDay] = {
        var days: [CurriculumDay] = []

        days.append(CurriculumBuilder.day(
            8, "Family and everyday life", "Introduce relatives and describe how you spend time together.",
            words: [
                NewWord("die Schwester (Schwestern)", "sister", "Meine Schwester wohnt in Bremen.", "My sister lives in Bremen."),
                NewWord("der Bruder (Brüder)", "brother", "Mein Bruder kocht heute für uns.", "My brother is cooking for us today."),
                NewWord("die Eltern (plural only)", "parents", "Meine Eltern kommen am Sonntag.", "My parents are coming on Sunday."),
                NewWord("verheiratet", "married", "Meine Tante ist seit fünf Jahren verheiratet.", "My aunt has been married for five years."),
                NewWord("besuchen", "to visit", "Am Samstag besuche ich meine Schwester.", "On Saturday I am visiting my sister.")
            ],
            grammar: "Possessive words change with the noun: mein Bruder, meine Schwester, meine Eltern. Use the accusative after besuchen: Ich besuche meinen Bruder. — I am visiting my brother.",
            reading: ReadingPassage(
                "Mara wohnt allein in Bremen. Ihre Schwester lebt mit ihren Eltern in der Nähe. Am Sonntag besucht Mara die Familie und bringt einen Kuchen mit. Ihr Bruder kommt erst am Nachmittag, weil er am Vormittag arbeitet.",
                "Mara lives alone in Bremen. Her sister lives with their parents nearby. On Sunday Mara visits the family and brings a cake. Her brother does not arrive until the afternoon because he works in the morning.",
                question: "Why does Mara's brother arrive in the afternoon?",
                answer: "Because he works in the morning."),
            writing: WritingTask(
                "Write a short introduction to an imagined family for a new classmate.",
                checklist: ["Introduce two relatives.", "Say where someone lives.", "Describe a planned visit."],
                model: "Meine Schwester heißt Lea und wohnt in Bremen. Mein Bruder lebt in Hamburg. Er ist verheiratet. Am Sonntag besuche ich meine Eltern."),
            partner: "Erzähl mir von deiner Familie. Wen besuchst du gern?",
            partnerEnglish: "Tell me about your family. Who do you like visiting?",
            response: "Meine Schwester wohnt in Bremen. Ich besuche sie am Sonntag. Mein Bruder kommt auch.",
            responseEnglish: "My sister lives in Bremen. I am visiting her on Sunday. My brother is coming too.",
            guided: "Introduce a sister or brother, name a city, and say when you visit them.",
            independent: "Describe an imagined family gathering, including who comes and when."
        ))

        days.append(CurriculumBuilder.day(
            9, "Rooms at home", "Describe the rooms in a home and where things are.",
            words: [
                NewWord("die Küche (Küchen)", "kitchen", "In unserer Küche steht ein kleiner Tisch.", "There is a small table in our kitchen."),
                NewWord("das Schlafzimmer (Schlafzimmer)", "bedroom", "Mein Schlafzimmer ist sehr ruhig.", "My bedroom is very quiet."),
                NewWord("das Wohnzimmer (Wohnzimmer)", "living room", "Wir trinken Tee im Wohnzimmer.", "We drink tea in the living room."),
                NewWord("das Badezimmer (Badezimmer)", "bathroom", "Das Badezimmer liegt neben der Küche.", "The bathroom is next to the kitchen."),
                NewWord("der Flur (Flure)", "hallway", "Im Flur hängen unsere Jacken.", "Our jackets hang in the hallway.")
            ],
            grammar: "For a fixed location, in and neben take the dative: in der Küche, neben dem Schlafzimmer. Im means in dem. Die Jacke hängt im Flur. — The jacket is hanging in the hallway.",
            reading: ReadingPassage(
                "Ben zeigt seiner Schwester die neue Wohnung. Die Küche ist klein, aber das Wohnzimmer hat zwei große Fenster. Neben dem Schlafzimmer liegt das Badezimmer. Im Flur steht noch ein Karton mit Büchern.",
                "Ben shows his sister the new apartment. The kitchen is small, but the living room has two large windows. The bathroom is next to the bedroom. There is still a box of books in the hallway.",
                question: "Which room has two large windows?",
                answer: "The living room has two large windows."),
            writing: WritingTask(
                "Describe an imagined apartment so a friend can picture its layout.",
                checklist: ["Name three rooms.", "Give one location using next to.", "Describe one room with an adjective."],
                model: "Unsere Küche ist klein und hell. Neben der Küche liegt das Wohnzimmer. Das Schlafzimmer ist hinten und sehr ruhig. Im Flur steht ein kleiner Tisch."),
            partner: "Wie sieht deine Wohnung aus? Wo ist das Badezimmer?",
            partnerEnglish: "What is your apartment like? Where is the bathroom?",
            response: "Meine Wohnung hat eine kleine Küche. Das Badezimmer liegt neben dem Schlafzimmer. Im Wohnzimmer stehen zwei Stühle.",
            responseEnglish: "My apartment has a small kitchen. The bathroom is next to the bedroom. There are two chairs in the living room.",
            guided: "Name two rooms, describe one, and locate the bathroom with neben.",
            independent: "Give a visitor a short spoken tour of an imagined home."
        ))

        days.append(CurriculumBuilder.day(
            10, "Cooking a simple meal", "Explain the ingredients and steps for an everyday meal.",
            words: [
                NewWord("die Kartoffel (Kartoffeln)", "potato", "Ich schäle die Kartoffeln für die Suppe.", "I peel the potatoes for the soup."),
                NewWord("die Zwiebel (Zwiebeln)", "onion", "Für die Soße brauche ich eine Zwiebel.", "I need an onion for the sauce."),
                NewWord("das Öl (oils: Öle; usually uncountable)", "oil", "Ich gebe etwas Öl in die Pfanne.", "I put some oil in the pan."),
                NewWord("schneiden", "to cut", "Du schneidest die Zwiebel in kleine Stücke.", "You cut the onion into small pieces."),
                NewWord("kochen", "to cook; to boil", "Wir kochen heute eine Suppe.", "We are cooking a soup today.")
            ],
            grammar: "Use zuerst, dann, and zum Schluss to order steps. The verb stays in second position: Dann schneiden wir die Zwiebel. — Then we cut the onion.",
            reading: ReadingPassage(
                "Heute kochen Ben und Mara in Bens neuer Küche. Zuerst schneiden sie eine Zwiebel und drei Kartoffeln. Dann geben sie etwas Öl und das Gemüse in einen Topf. Sie kochen eine Suppe und essen später zusammen im Wohnzimmer.",
                "Today Ben and Mara cook in Ben's new kitchen. First they cut an onion and three potatoes. Then they put some oil and the vegetables into a pot. They cook a soup and later eat together in the living room.",
                question: "What do Ben and Mara cut first?",
                answer: "They cut an onion and three potatoes."),
            writing: WritingTask(
                "Leave a friend a simple description of how you make vegetable soup.",
                checklist: ["Name at least two ingredients.", "Put the steps in order.", "Say where or with whom you eat."],
                model: "Zuerst schneide ich eine Zwiebel und zwei Kartoffeln. Dann gebe ich etwas Öl und das Gemüse in einen Topf. Ich koche die Suppe mit Wasser. Zum Schluss esse ich mit meiner Schwester in der Küche."),
            partner: "Was kochen wir heute? Was machen wir zuerst?",
            partnerEnglish: "What shall we cook today? What do we do first?",
            response: "Wir kochen eine Suppe. Zuerst schneiden wir die Kartoffeln und eine Zwiebel. Dann brauchen wir etwas Öl.",
            responseEnglish: "We are cooking a soup. First we cut the potatoes and an onion. Then we need some oil.",
            guided: "Suggest a soup, list two ingredients, and explain the first step with zuerst.",
            independent: "Explain a simple meal in three ordered steps without looking at the model."
        ))

        days.append(CurriculumBuilder.day(
            11, "Ordering at a café", "Order politely and ask for the bill.",
            words: [
                NewWord("die Speisekarte (Speisekarten)", "menu", "Kann ich bitte die Speisekarte haben?", "May I have the menu, please?"),
                NewWord("der Kuchen (Kuchen)", "cake", "Ich nehme ein Stück Kuchen.", "I will have a piece of cake."),
                NewWord("bestellen", "to order", "Wir bestellen zwei Tassen Tee.", "We order two cups of tea."),
                NewWord("die Rechnung (Rechnungen)", "bill; invoice", "Wir möchten bitte die Rechnung.", "We would like the bill, please."),
                NewWord("getrennt", "separately", "Wir möchten getrennt bezahlen.", "We would like to pay separately.")
            ],
            grammar: "Ich möchte and ich hätte gern make polite requests. Put the requested item in the accusative: Ich hätte gern einen Tee. — I would like a tea.",
            reading: ReadingPassage(
                "Nach dem Kochen trifft Mara eine Freundin im Café. Sie liest die Speisekarte und bestellt einen Tee. Ihre Freundin nimmt ein Stück Kuchen und einen Kaffee. Am Ende bitten sie um die Rechnung und bezahlen getrennt.",
                "After cooking, Mara meets a friend at the café. She reads the menu and orders a tea. Her friend has a piece of cake and a coffee. At the end they ask for the bill and pay separately.",
                question: "How do the two friends pay?",
                answer: "They pay separately."),
            writing: WritingTask(
                "Write a short café dialogue with your order and a request to pay.",
                checklist: ["Request a menu politely.", "Order a drink and something to eat.", "Say whether you pay together or separately."],
                model: "Kann ich bitte die Speisekarte haben? Ich hätte gern einen Tee und ein Stück Kuchen. Meine Schwester nimmt einen Kaffee. Wir möchten bitte getrennt bezahlen."),
            partner: "Guten Tag! Was möchten Sie bestellen?",
            partnerEnglish: "Hello! What would you like to order?",
            response: "Ich hätte gern einen Tee und ein Stück Kuchen. Meine Freundin nimmt einen Kaffee. Wir bezahlen getrennt.",
            responseEnglish: "I would like a tea and a piece of cake. My friend will have a coffee. We are paying separately.",
            guided: "Use ich hätte gern for your order, add your companion's drink, and choose how to pay.",
            independent: "Act as a café customer: order two items, ask one question, and request the bill."
        ))

        days.append(CurriculumBuilder.day(
            12, "Weather and clothes", "Choose suitable clothes and describe the weather.",
            words: [
                NewWord("der Regen (uncountable)", "rain", "Bei Regen bleibe ich gern zu Hause.", "When it rains, I like staying at home."),
                NewWord("die Jacke (Jacken)", "jacket", "Heute brauche ich eine warme Jacke.", "Today I need a warm jacket."),
                NewWord("der Pullover (Pullover)", "sweater", "Mein Bruder trägt einen blauen Pullover.", "My brother is wearing a blue sweater."),
                NewWord("der Regenschirm (Regenschirme)", "umbrella", "Nimm bitte einen Regenschirm mit.", "Please take an umbrella with you."),
                NewWord("anziehen", "to put on clothes", "Ich ziehe meine Jacke an.", "I put on my jacket.")
            ],
            grammar: "Anziehen is separable: its prefix moves to the end of a main clause. Ich ziehe einen Pullover an. — I put on a sweater. Weather often uses es: Es regnet. — It is raining.",
            reading: ReadingPassage(
                "Am Morgen ist es kalt und es regnet. Ben möchte trotzdem zu Fuß ins Café gehen. Er zieht einen Pullover und eine Jacke an. Im Flur findet er seinen Regenschirm und nimmt ihn mit.",
                "In the morning it is cold and raining. Ben still wants to walk to the café. He puts on a sweater and a jacket. He finds his umbrella in the hallway and takes it with him.",
                question: "Where does Ben find his umbrella?",
                answer: "He finds it in the hallway."),
            writing: WritingTask(
                "Send a message to a friend who is about to meet you outside.",
                checklist: ["Describe today's weather.", "Suggest suitable clothes.", "Mention an item to bring."],
                model: "Heute ist es kalt und es regnet. Zieh bitte eine warme Jacke an. Ich trage auch einen Pullover. Bring einen Regenschirm mit, dann können wir zum Café laufen."),
            partner: "Wie ist das Wetter bei dir? Was soll ich anziehen?",
            partnerEnglish: "What is the weather like where you are? What should I put on?",
            response: "Es ist kalt und es regnet. Zieh einen Pullover und eine Jacke an. Bring bitte einen Regenschirm mit.",
            responseEnglish: "It is cold and raining. Put on a sweater and a jacket. Please bring an umbrella.",
            guided: "Describe cold or rainy weather, then recommend two items of clothing.",
            independent: "Help a visitor choose clothes for an outdoor meeting and explain your choices."
        ))

        days.append(CurriculumBuilder.day(
            13, "Weekend plans", "Make a weekend plan and give a simple reason.",
            words: [
                NewWord("das Wochenende (Wochenenden)", "weekend", "Am Wochenende habe ich Zeit für meine Familie.", "At the weekend I have time for my family."),
                NewWord("der Ausflug (Ausflüge)", "outing; day trip", "Wir machen einen Ausflug an den See.", "We are taking a trip to the lake."),
                NewWord("spazieren gehen", "to go for a walk", "Am Sonntag gehen wir im Park spazieren.", "On Sunday we go for a walk in the park."),
                NewWord("sich treffen", "to meet up", "Ich treffe mich am Samstag mit Ben.", "I am meeting up with Ben on Saturday."),
                NewWord("vielleicht", "perhaps", "Vielleicht essen wir später im Café.", "Perhaps we will eat at the café later.")
            ],
            grammar: "A weil clause gives a reason and sends the conjugated verb to the end: Wir bleiben zu Hause, weil es regnet. — We are staying at home because it is raining.",
            reading: ReadingPassage(
                "Mara trifft sich am Wochenende mit ihrem Bruder. Sie planen einen Ausflug an den See, weil sie gern draußen sind. Vielleicht gehen ihre Eltern auch mit. Bei Regen kochen alle zusammen zu Hause.",
                "Mara is meeting up with her brother at the weekend. They are planning a trip to the lake because they like being outdoors. Perhaps their parents will come too. If it rains, everyone will cook together at home.",
                question: "What will the family do if it rains?",
                answer: "They will cook together at home."),
            writing: WritingTask(
                "Suggest a weekend outing to your brother or an imagined relative.",
                checklist: ["Suggest an activity and a day.", "Give a reason with weil.", "Offer an alternative for bad weather."],
                model: "Am Samstag möchte ich einen Ausflug machen. Wir können an den See fahren, weil das Wetter schön ist. Vielleicht kommen unsere Eltern mit. Bei Regen können wir in meiner Küche zusammen kochen."),
            partner: "Hast du am Wochenende Zeit? Was können wir zusammen machen?",
            partnerEnglish: "Do you have time at the weekend? What can we do together?",
            response: "Am Sonntag habe ich Zeit. Wir können im Park spazieren gehen, weil es warm ist. Vielleicht kommt meine Schwester mit.",
            responseEnglish: "I have time on Sunday. We can go for a walk in the park because it is warm. Perhaps my sister will come along.",
            guided: "Choose Saturday or Sunday, suggest a walk or outing, and add a reason with weil.",
            independent: "Arrange a weekend activity and include a backup plan if the weather changes."
        ))

        days.append(CurriculumBuilder.review(
            14, "Review: family, home, and free time", previous: days,
            grammar: "Combine location, plans, and reasons. Keep the main verb second and the verb after weil last: Am Sonntag kochen wir in der Küche, weil es regnet. — On Sunday we cook in the kitchen because it is raining.",
            reading: ReadingPassage(
                "Am Wochenende besucht Mara ihre Eltern. Sie möchte mit ihrem Bruder spazieren gehen, aber es regnet stark. Deshalb kochen sie in der Küche eine Kartoffelsuppe. Am Nachmittag gehen sie mit Jacken und Regenschirmen ins Café und bestellen Kuchen.",
                "At the weekend Mara visits her parents. She wants to go for a walk with her brother, but it is raining heavily. So they cook a potato soup in the kitchen. In the afternoon they go to the café with jackets and umbrellas and order cake.",
                question: "Why do Mara and her brother cook instead of going for a walk?",
                answer: "Because it is raining heavily."),
            writing: WritingTask(
                "Write a message explaining a changed family weekend plan.",
                checklist: ["Name the people and meeting place.", "Explain the change because of the weather.", "Describe a meal and a later activity."],
                model: "Am Sonntag besucht mein Bruder meine Eltern. Wir treffen uns in ihrer Küche, weil es regnet. Zuerst kochen wir eine Suppe mit Kartoffeln und Zwiebeln. Später ziehen wir unsere Jacken an und gehen ins Café."),
            partner: "Deine Familie kommt am Wochenende. Was plant ihr bei Regen?",
            partnerEnglish: "Your family is coming at the weekend. What are you planning if it rains?",
            response: "Meine Schwester besucht mich am Sonntag. Wir kochen in meiner Küche, weil es regnet. Später gehen wir ins Café und bestellen Kuchen.",
            responseEnglish: "My sister is visiting me on Sunday. We are cooking in my kitchen because it is raining. Later we are going to the café and ordering cake."
        ))

        days.append(CurriculumBuilder.day(
            15, "Getting to know the neighbourhood", "Describe useful places near home.",
            words: [
                NewWord("die Nachbarschaft (Nachbarschaften)", "neighbourhood", "Unsere Nachbarschaft ist am Abend ruhig.", "Our neighbourhood is quiet in the evening."),
                NewWord("die Bäckerei (Bäckereien)", "bakery", "In der Bäckerei kaufe ich frisches Brot.", "I buy fresh bread at the bakery."),
                NewWord("der Spielplatz (Spielplätze)", "playground", "Hinter dem Haus liegt ein Spielplatz.", "There is a playground behind the building."),
                NewWord("die Haltestelle (Haltestellen)", "public transport stop", "Die Haltestelle ist vor der Bäckerei.", "The stop is in front of the bakery."),
                NewWord("in der Nähe", "nearby", "Meine Schwester wohnt in der Nähe.", "My sister lives nearby.")
            ],
            grammar: "Es gibt introduces something that exists and takes the accusative: In meiner Straße gibt es eine Bäckerei. — There is a bakery on my street. Compare location: Die Bäckerei ist in der Nähe. — The bakery is nearby.",
            reading: ReadingPassage(
                "Ben wohnt jetzt in einer ruhigen Nachbarschaft. Vor der Bäckerei gibt es eine Haltestelle. Hinter seinem Haus liegt ein Spielplatz, auf dem seine Nichte gern spielt. Wenn seine Schwester zu Besuch kommt, kauft sie unterwegs Brot.",
                "Ben now lives in a quiet neighbourhood. There is a public transport stop in front of the bakery. Behind his building is a playground where his niece likes to play. When his sister comes to visit, she buys bread on the way.",
                question: "What is behind Ben's building?",
                answer: "There is a playground behind his building."),
            writing: WritingTask(
                "Write a neighbourhood introduction for someone moving into your building.",
                checklist: ["Describe the neighbourhood.", "Mention two useful places.", "Explain where one place is."],
                model: "Unsere Nachbarschaft ist freundlich und ruhig. In der Nähe gibt es eine Bäckerei. Die Haltestelle liegt direkt davor. Hinter unserem Haus ist ein großer Spielplatz."),
            partner: "Ich bin neu hier. Was gibt es in deiner Nachbarschaft?",
            partnerEnglish: "I am new here. What is there in your neighbourhood?",
            response: "In der Nähe gibt es eine Bäckerei. Davor ist eine Haltestelle. Hinter unserem Haus liegt ein Spielplatz.",
            responseEnglish: "There is a bakery nearby. There is a public transport stop in front of it. There is a playground behind our building.",
            guided: "Use es gibt for a local place, then describe its location with vor or hinter.",
            independent: "Recommend useful nearby places to a new neighbour and explain why you like the area."
        ))

        days.append(CurriculumBuilder.day(
            16, "Asking for directions", "Understand and give a short route on foot.",
            words: [
                NewWord("geradeaus", "straight ahead", "Gehen Sie hier bitte geradeaus.", "Please go straight ahead here."),
                NewWord("links", "left", "An der Bäckerei gehen Sie links.", "Turn left at the bakery."),
                NewWord("rechts", "right", "Die Haltestelle liegt rechts.", "The stop is on the right."),
                NewWord("die Kreuzung (Kreuzungen)", "intersection", "An der nächsten Kreuzung warten wir.", "We will wait at the next intersection."),
                NewWord("abbiegen", "to turn", "Du biegst an der Kreuzung rechts ab.", "You turn right at the intersection.")
            ],
            grammar: "For polite directions use the Sie imperative: Gehen Sie geradeaus. — Go straight ahead. A separable prefix still goes last: Biegen Sie links ab. — Turn left.",
            reading: ReadingPassage(
                "Eine Besucherin sucht den Spielplatz in Bens Nachbarschaft. Ben sagt: Gehen Sie bis zur Kreuzung geradeaus. Biegen Sie dort rechts ab und gehen Sie an der Bäckerei vorbei. Der Spielplatz liegt dann links hinter dem großen Haus.",
                "A visitor is looking for the playground in Ben's neighbourhood. Ben says: Go straight ahead as far as the intersection. Turn right there and walk past the bakery. The playground is then on the left behind the large building.",
                question: "Which way should the visitor turn at the intersection?",
                answer: "She should turn right."),
            writing: WritingTask(
                "Send a visitor walking directions from the bus stop to your building.",
                checklist: ["Give a first direction.", "Describe a turn at a landmark.", "Say where the building is."],
                model: "Gehen Sie von der Haltestelle geradeaus. Biegen Sie an der Kreuzung links ab. Gehen Sie dann bis zur Bäckerei. Mein Haus liegt rechts neben der Bäckerei."),
            partner: "Entschuldigung, wie komme ich von hier zum Spielplatz?",
            partnerEnglish: "Excuse me, how do I get to the playground from here?",
            response: "Gehen Sie geradeaus bis zur Kreuzung. Biegen Sie dann links ab. Der Spielplatz liegt rechts hinter der Bäckerei.",
            responseEnglish: "Go straight ahead as far as the intersection. Then turn left. The playground is on the right behind the bakery.",
            guided: "Give a straight section, a turn at an intersection, and the final location.",
            independent: "Invent a short walking route to a neighbourhood destination using polite directions."
        ))

        days.append(CurriculumBuilder.day(
            17, "Times and dates", "Arrange an appointment and clarify its date and time.",
            words: [
                NewWord("der Termin (Termine)", "appointment", "Ich habe am Dienstag einen Termin.", "I have an appointment on Tuesday."),
                NewWord("das Datum (Daten)", "date", "Welches Datum steht auf dem Brief?", "What date is written on the letter?"),
                NewWord("die Uhrzeit (Uhrzeiten)", "time of day", "Können Sie mir die Uhrzeit nennen?", "Can you tell me the time?"),
                NewWord("verschieben", "to reschedule; to move", "Wir verschieben den Termin auf Freitag.", "We reschedule the appointment for Friday."),
                NewWord("pünktlich", "on time", "Der Bus kommt heute pünktlich.", "The bus arrives on time today.")
            ],
            grammar: "Use am with days and dates and um with clock times: am Dienstag, am dritten Mai, um zehn Uhr. Der Termin ist am dritten Mai um zehn Uhr. — The appointment is on the third of May at ten o'clock.",
            reading: ReadingPassage(
                "Mara hat am dritten Mai einen Termin im Sprachbüro. Auf ihrem Zettel steht die Uhrzeit zehn Uhr. Weil sie an diesem Vormittag arbeitet, ruft sie im Büro an. Sie verschiebt den Termin auf den vierten Mai um vierzehn Uhr.",
                "Mara has an appointment at the language office on the third of May. Her note says ten o'clock. Because she is working that morning, she calls the office. She reschedules the appointment for the fourth of May at two in the afternoon.",
                question: "When is Mara's new appointment?",
                answer: "It is on the fourth of May at two in the afternoon."),
            writing: WritingTask(
                "Write to a course office to move an imagined appointment to another day.",
                checklist: ["State the original day and time.", "Give a brief reason.", "Propose a new day and time."],
                model: "Ich habe am Dienstag um zehn Uhr einen Termin. Leider muss ich dann arbeiten. Können wir den Termin auf Donnerstag verschieben? Am Donnerstag habe ich um vierzehn Uhr Zeit."),
            partner: "Wir haben am Dienstag um zehn Uhr einen Termin. Passt Ihnen die Uhrzeit?",
            partnerEnglish: "We have an appointment on Tuesday at ten o'clock. Does that time suit you?",
            response: "Leider muss ich am Dienstag arbeiten. Können wir den Termin auf Donnerstag um vierzehn Uhr verschieben? Dann kann ich pünktlich kommen.",
            responseEnglish: "Unfortunately I have to work on Tuesday. Can we move the appointment to Thursday at two in the afternoon? Then I can arrive on time.",
            guided: "Explain a scheduling conflict and suggest another day using am and another time using um.",
            independent: "Negotiate an appointment change and repeat the agreed date and time to check them."
        ))

        days.append(CurriculumBuilder.day(
            18, "At the doctor's reception", "Describe symptoms and request an appointment without diagnosing yourself.",
            words: [
                NewWord("die Kopfschmerzen (usually plural)", "headache; headaches", "Seit gestern habe ich Kopfschmerzen.", "I have had a headache since yesterday."),
                NewWord("der Husten (usually uncountable)", "cough", "Mein Husten stört mich beim Sprechen.", "My cough bothers me when I speak."),
                NewWord("das Fieber (uncountable)", "fever", "Ich habe Fieber und bleibe heute zu Hause.", "I have a fever and am staying at home today."),
                NewWord("wehtun", "to hurt", "Mein Hals tut beim Schlucken weh.", "My throat hurts when I swallow."),
                NewWord("die Praxis (Praxen)", "medical practice", "Ich rufe morgens in der Praxis an.", "I call the medical practice in the morning.")
            ],
            grammar: "Seit introduces a starting point or duration; use the present for symptoms that continue now: Seit gestern habe ich Husten. — I have had a cough since yesterday. With wehtun, the painful part is the subject: Meine Ohren tun weh. — My ears hurt.",
            reading: ReadingPassage(
                "Ben hat seit gestern Husten und Kopfschmerzen. Am Morgen ruft er in einer Praxis an und beschreibt seine Beschwerden. Die Mitarbeiterin fragt, seit wann er krank ist. Ben bekommt einen Termin und notiert die Uhrzeit.",
                "Ben has had a cough and a headache since yesterday. In the morning he calls a medical practice and describes his symptoms. The staff member asks how long he has been ill. Ben gets an appointment and writes down the time.",
                question: "What does the staff member ask Ben?",
                answer: "She asks how long he has been ill."),
            writing: WritingTask(
                "Write a fictional message requesting a doctor's appointment for symptoms.",
                checklist: ["Describe two symptoms.", "Say when they began.", "Ask for an appointment."],
                model: "Seit gestern habe ich Husten und Kopfschmerzen. Mein Hals tut auch weh. Ich möchte einen Termin in Ihrer Praxis vereinbaren. Haben Sie heute Nachmittag einen Termin frei?"),
            partner: "Guten Morgen, Praxis Berg. Welche Beschwerden haben Sie und seit wann?",
            partnerEnglish: "Good morning, Berg medical practice. What symptoms do you have, and since when?",
            response: "Seit gestern habe ich Husten und Kopfschmerzen. Mein Hals tut weh. Kann ich heute einen Termin bekommen?",
            responseEnglish: "I have had a cough and a headache since yesterday. My throat hurts. Can I get an appointment today?",
            guided: "Use imagined symptoms only: name two, say seit gestern, and request an appointment.",
            independent: "Role-play a reception call with fictional symptoms, their duration, and a request for a suitable appointment."
        ))

        days.append(CurriculumBuilder.day(
            19, "Questions at a pharmacy", "Ask pharmacy staff for clarification rather than giving or following treatment advice.",
            words: [
                NewWord("die Apotheke (Apotheken)", "pharmacy", "Die Apotheke liegt neben der Praxis.", "The pharmacy is next to the medical practice."),
                NewWord("das Rezept (Rezepte)", "prescription; recipe", "Ich zeige der Apothekerin das Rezept.", "I show the pharmacist the prescription."),
                NewWord("die Packung (Packungen)", "package; box", "Auf der Packung steht der Name.", "The name is written on the box."),
                NewWord("die Packungsbeilage (Packungsbeilagen)", "package leaflet", "Die Packungsbeilage ist in der Schachtel.", "The package leaflet is inside the box."),
                NewWord("nachfragen", "to ask for clarification", "Ich frage nach, weil ich das Wort nicht verstehe.", "I ask for clarification because I do not understand the word.")
            ],
            grammar: "An indirect question has the verb at the end: Können Sie erklären, was das bedeutet? — Can you explain what that means? This lesson practises questions for qualified staff, not medical instructions.",
            reading: ReadingPassage(
                "Nach seinem Termin geht Ben in die Apotheke. Er zeigt sein Rezept und bekommt eine Packung. Ein Wort auf der Packungsbeilage versteht er nicht, deshalb fragt er nach. Die Apothekerin nimmt sich Zeit für seine Frage.",
                "After his appointment Ben goes to the pharmacy. He shows his prescription and receives a box. He does not understand a word in the package leaflet, so he asks for clarification. The pharmacist takes time for his question.",
                question: "Why does Ben ask for clarification?",
                answer: "Because he does not understand a word in the package leaflet."),
            writing: WritingTask(
                "Write a fictional request for a pharmacist to explain unclear written information; do not suggest a treatment.",
                checklist: ["Identify the leaflet or package.", "Say what you do not understand.", "Ask qualified staff for an explanation."],
                model: "Ich habe eine Frage zu dieser Packungsbeilage. Dieses Wort verstehe ich nicht. Können Sie mir bitte erklären, was es bedeutet? Ich möchte noch einmal nachfragen."),
            partner: "Guten Tag. Haben Sie eine Frage zu Ihrer Packung?",
            partnerEnglish: "Hello. Do you have a question about your package?",
            response: "Ja, ich verstehe ein Wort in der Packungsbeilage nicht. Können Sie mir bitte erklären, was es bedeutet? Ich möchte nachfragen.",
            responseEnglish: "Yes, I do not understand a word in the package leaflet. Could you please explain what it means? I would like to ask for clarification.",
            guided: "Point to an imagined leaflet, say a word is unclear, and politely ask the pharmacist to explain it.",
            independent: "Practise asking pharmacy staff to clarify information without proposing medicine, doses, or treatment."
        ))

        days.append(CurriculumBuilder.day(
            20, "Inviting and replying", "Invite someone, accept or decline, and agree on a contribution.",
            words: [
                NewWord("einladen", "to invite", "Ich lade meine Nachbarn zum Essen ein.", "I invite my neighbours for a meal."),
                NewWord("die Einladung (Einladungen)", "invitation", "Danke für deine Einladung zum Abendessen.", "Thank you for your invitation to dinner."),
                NewWord("mitbringen", "to bring along", "Meine Schwester bringt einen Salat mit.", "My sister brings a salad along."),
                NewWord("zusagen", "to accept; to confirm attendance", "Ben sagt für Samstag zu.", "Ben confirms that he will come on Saturday."),
                NewWord("absagen", "to cancel; to decline", "Leider sage ich das Treffen heute ab.", "Unfortunately I am cancelling today's meeting.")
            ],
            grammar: "Separable verbs keep their prefix at the end in main clauses: Ich lade dich ein. — I invite you. With a modal verb, use the whole infinitive at the end: Kannst du Brot mitbringen? — Can you bring bread?",
            reading: ReadingPassage(
                "Mara lädt ihre Nachbarn am Samstag zum Essen ein. Ben sagt zu und möchte einen Salat mitbringen. Seine Schwester muss leider absagen, weil sie arbeitet. Mara schreibt ihr, dass sie ein anderes Mal kommen kann.",
                "Mara invites her neighbours for a meal on Saturday. Ben accepts and would like to bring a salad. His sister unfortunately has to decline because she is working. Mara writes to her that she can come another time.",
                question: "Why does Ben's sister decline?",
                answer: "Because she is working."),
            writing: WritingTask(
                "Reply to a neighbour's dinner invitation and offer to contribute.",
                checklist: ["Thank the neighbour for the invitation.", "Confirm that you can come and mention the day.", "Offer to bring something and ask a question."],
                model: "Vielen Dank für deine Einladung. Am Samstag komme ich gern zum Essen. Ich kann einen Salat mitbringen. Um wie viel Uhr soll ich kommen?"),
            partner: "Ich lade dich am Samstag zum Essen ein. Kannst du kommen und etwas mitbringen?",
            partnerEnglish: "I am inviting you for a meal on Saturday. Can you come and bring something?",
            response: "Danke für die Einladung, ich komme gern. Ich bringe einen Salat mit. Um wie viel Uhr essen wir?",
            responseEnglish: "Thank you for the invitation; I would love to come. I will bring a salad. What time are we eating?",
            guided: "Thank your host, accept the Saturday invitation, and offer a food item.",
            independent: "Reply to an invitation with either acceptance or a polite refusal, a reason or contribution, and a follow-up question."
        ))

        days.append(CurriculumBuilder.review(
            21, "Review: finding places and making arrangements", previous: days,
            grammar: "Practise main clauses, weil clauses, and indirect questions together: Ich frage nach, weil ich die Uhrzeit nicht verstehe. — I ask for clarification because I do not understand the time. Können Sie sagen, wo die Praxis ist? — Can you say where the practice is?",
            reading: ReadingPassage(
                "Ben hat am Donnerstag einen Termin in einer neuen Praxis. Er fragt seine Nachbarin nach dem Weg und notiert die Uhrzeit. An der Kreuzung muss er links abbiegen; die Apotheke liegt neben der Praxis. Am Abend sagt er Maras Einladung zu und bietet an, Brot aus der Bäckerei mitzubringen.",
                "Ben has an appointment at a new medical practice on Thursday. He asks his neighbour for directions and writes down the time. He has to turn left at the intersection; the pharmacy is next to the practice. In the evening he accepts Mara's invitation and offers to bring bread from the bakery.",
                question: "What does Ben offer to bring to Mara's gathering?",
                answer: "He offers to bring bread from the bakery."),
            writing: WritingTask(
                "Write to a neighbour about a busy day with an appointment and an evening invitation.",
                checklist: ["State the appointment time.", "Ask for or give a short route.", "Reply to the evening invitation and offer a contribution."],
                model: "Am Donnerstag habe ich um zehn Uhr einen Termin in der Praxis. Muss ich an der Kreuzung links abbiegen? Danke für deine Einladung am Abend, ich komme gern. Ich bringe Brot aus der Bäckerei mit."),
            partner: "Du hast morgen einen Termin in unserer Nachbarschaft. Kommst du danach zu uns zum Essen?",
            partnerEnglish: "You have an appointment in our neighbourhood tomorrow. Will you come to our place for a meal afterwards?",
            response: "Ja, gern, danke für die Einladung. Mein Termin ist um vierzehn Uhr. Kannst du mir erklären, wo die Praxis ist? Danach bringe ich Brot zum Essen mit.",
            responseEnglish: "Yes, I would love to; thank you for the invitation. My appointment is at two in the afternoon. Can you explain where the medical practice is? Afterwards I will bring bread for the meal."
        ))

        days.append(CurriculumBuilder.day(
            22, "Looking for a home", "Ask about an apartment advertisement and arrange a viewing.",
            words: [
                NewWord("die Anzeige (Anzeigen)", "advertisement; listing", "Ich lese die Anzeige für eine kleine Wohnung.", "I read the listing for a small apartment."),
                NewWord("die Miete (Mieten)", "rent", "Wie hoch ist die monatliche Miete?", "How much is the monthly rent?"),
                NewWord("die Nebenkosten (plural only)", "additional housing charges", "Sind die Nebenkosten in der Miete enthalten?", "Are the additional charges included in the rent?"),
                NewWord("die Besichtigung (Besichtigungen)", "viewing", "Die Besichtigung findet am Freitag statt.", "The viewing takes place on Friday."),
                NewWord("der Balkon (Balkone)", "balcony", "Die Wohnung hat einen kleinen Balkon.", "The apartment has a small balcony.")
            ],
            grammar: "Use ob for an indirect yes-or-no question, with the verb last: Können Sie mir sagen, ob die Wohnung einen Balkon hat? — Can you tell me whether the apartment has a balcony?",
            reading: ReadingPassage(
                "Mara sucht eine Wohnung mit zwei Zimmern. In einer Anzeige findet sie eine Wohnung mit Balkon nahe einer Haltestelle. Die Miete steht im Text, aber die Nebenkosten fehlen. Sie schreibt eine Nachricht und fragt auch nach einem Termin für die Besichtigung.",
                "Mara is looking for an apartment with two rooms. In a listing she finds an apartment with a balcony near a public transport stop. The rent is in the text, but the additional charges are missing. She writes a message and also asks for a viewing appointment.",
                question: "Which cost information is missing from the listing?",
                answer: "The additional housing charges are missing."),
            writing: WritingTask(
                "Contact the writer of an imagined apartment listing to request more information.",
                checklist: ["Identify the apartment that interests you.", "Ask about additional charges.", "Request a viewing appointment."],
                model: "Ich interessiere mich für die Wohnung mit Balkon aus Ihrer Anzeige. Können Sie mir sagen, wie hoch die Nebenkosten sind? Ich möchte die Wohnung gern besichtigen. Haben Sie am Freitag einen Termin frei?"),
            partner: "Sie interessieren sich für unsere Wohnung. Welche Fragen haben Sie?",
            partnerEnglish: "You are interested in our apartment. What questions do you have?",
            response: "Sind die Nebenkosten in der Miete enthalten? Hat die Wohnung einen Balkon? Ich hätte gern einen Termin für eine Besichtigung.",
            responseEnglish: "Are the additional housing charges included in the rent? Does the apartment have a balcony? I would like an appointment for a viewing.",
            guided: "Ask about additional charges and a balcony, then request a viewing.",
            independent: "Enquire about an imagined rental listing with two specific questions and a proposed viewing time."
        ))

        days.append(CurriculumBuilder.day(
            23, "Reporting a rental problem", "Explain a problem at home and arrange access for a repair.",
            words: [
                NewWord("die Heizung (Heizungen)", "heating; heater", "Die Heizung im Schlafzimmer bleibt kalt.", "The heater in the bedroom stays cold."),
                NewWord("der Wasserhahn (Wasserhähne)", "tap; faucet", "Der Wasserhahn in der Küche tropft.", "The kitchen tap is dripping."),
                NewWord("kaputt", "broken", "Das Fenster im Flur ist kaputt.", "The window in the hallway is broken."),
                NewWord("die Reparatur (Reparaturen)", "repair", "Für die Reparatur bleibe ich zu Hause.", "I stay at home for the repair."),
                NewWord("der Hausmeister (Hausmeister)", "caretaker; building superintendent", "Der Hausmeister kommt am Nachmittag.", "The caretaker is coming in the afternoon.")
            ],
            grammar: "Use seit with the present for an ongoing fault, and können for arranging access: Seit Montag ist die Heizung kaputt. — The heating has been broken since Monday. Am Freitag kann ich zu Hause bleiben. — I can stay at home on Friday.",
            reading: ReadingPassage(
                "In Bens Küche tropft seit Montag der Wasserhahn. Er schreibt dem Hausmeister und beschreibt das Problem. Der Hausmeister bietet einen Termin am Freitagvormittag für die Reparatur an. Ben sagt zu, weil er an diesem Tag zu Hause arbeitet.",
                "The tap in Ben's kitchen has been dripping since Monday. He writes to the caretaker and describes the problem. The caretaker offers an appointment on Friday morning for the repair. Ben agrees because he is working from home that day.",
                question: "Why can Ben be at home for the repair?",
                answer: "Because he is working from home that day."),
            writing: WritingTask(
                "Write to a building caretaker about an imagined broken heater.",
                checklist: ["Name the fault and the room.", "Say how long it has been a problem.", "Suggest a time when you can provide access."],
                model: "Die Heizung in meinem Schlafzimmer ist kaputt. Seit Dienstag bleibt das Zimmer kalt. Können Sie bitte einen Termin für die Reparatur vereinbaren? Am Freitag bin ich ab neun Uhr zu Hause."),
            partner: "Hier ist der Hausmeister. Was ist in Ihrer Wohnung kaputt und wann sind Sie zu Hause?",
            partnerEnglish: "This is the caretaker. What is broken in your apartment, and when are you at home?",
            response: "Der Wasserhahn in der Küche tropft seit Montag. Ich bin am Freitagvormittag zu Hause. Können Sie dann für die Reparatur kommen?",
            responseEnglish: "The kitchen tap has been dripping since Monday. I will be at home on Friday morning. Can you come for the repair then?",
            guided: "Name one fault, use seit to describe its duration, and give an available time.",
            independent: "Report an imagined household problem clearly and agree on an access window for a repair."
        ))

        days.append(CurriculumBuilder.day(
            24, "Handling a telephone call", "Ask for a person and manage a difficult connection politely.",
            words: [
                NewWord("anrufen", "to call by telephone", "Ich rufe morgen im Büro an.", "I will call the office tomorrow."),
                NewWord("die Nachricht (Nachrichten)", "message", "Kann ich eine Nachricht hinterlassen?", "May I leave a message?"),
                NewWord("buchstabieren", "to spell", "Ich buchstabiere meinen Nachnamen.", "I spell my surname."),
                NewWord("zurückrufen", "to call back", "Die Mitarbeiterin ruft mich später zurück.", "The staff member calls me back later."),
                NewWord("die Verbindung (Verbindungen)", "connection", "Die Verbindung ist leider sehr schlecht.", "Unfortunately the connection is very bad.")
            ],
            grammar: "Könnten Sie is a polite way to request help: Könnten Sie das bitte wiederholen? — Could you repeat that, please? For a callback with a modal verb: Können Sie später zurückrufen? — Can you call back later?",
            reading: ReadingPassage(
                "Mara ruft wegen einer Besichtigung im Büro an. Die Verbindung ist schlecht, deshalb bittet sie die Mitarbeiterin, langsam zu sprechen. Mara buchstabiert ihren Nachnamen und hinterlässt eine Nachricht für Frau Winter. Frau Winter soll am Nachmittag zurückrufen.",
                "Mara calls the office about a viewing. The connection is bad, so she asks the staff member to speak slowly. Mara spells her surname and leaves a message for Ms Winter. Ms Winter is asked to call back in the afternoon.",
                question: "When should Ms Winter call back?",
                answer: "She should call back in the afternoon."),
            writing: WritingTask(
                "Write a short script for a fictional phone call about a viewing.",
                checklist: ["Give the reason for the call.", "Ask for repetition or slower speech.", "Request a callback at a suitable time."],
                model: "Guten Tag, ich rufe wegen der Besichtigung an. Die Verbindung ist schlecht. Könnten Sie bitte langsamer sprechen? Kann Frau Winter mich am Nachmittag zurückrufen?"),
            partner: "Frau Winter ist gerade nicht da. Möchten Sie eine Nachricht hinterlassen?",
            partnerEnglish: "Ms Winter is not here right now. Would you like to leave a message?",
            response: "Ja, ich rufe wegen der Besichtigung an. Kann Frau Winter mich am Nachmittag zurückrufen? Gern buchstabiere ich meinen Namen.",
            responseEnglish: "Yes, I am calling about the viewing. Can Ms Winter call me back in the afternoon? I am happy to spell my name.",
            guided: "Leave a viewing-related message and request an afternoon callback; use a fictional name if needed.",
            independent: "Handle a poor phone connection, explain why you called, and arrange a callback without sharing real contact details."
        ))

        days.append(CurriculumBuilder.day(
            25, "Sending and collecting parcels", "Ask about postage and collect an expected parcel.",
            words: [
                NewWord("das Paket (Pakete)", "parcel", "Ich schicke meiner Schwester ein Paket.", "I send my sister a parcel."),
                NewWord("die Briefmarke (Briefmarken)", "postage stamp", "Für den Brief brauche ich eine Briefmarke.", "I need a stamp for the letter."),
                NewWord("die Adresse (Adressen)", "address", "Die Adresse steht deutlich auf dem Paket.", "The address is written clearly on the parcel."),
                NewWord("abholen", "to collect; to pick up", "Ich hole das Paket am Samstag ab.", "I collect the parcel on Saturday."),
                NewWord("der Abholschein (Abholscheine)", "collection slip", "Auf dem Abholschein steht die Filiale.", "The branch is written on the collection slip.")
            ],
            grammar: "For a recipient, use the dative: Ich schicke meiner Schwester ein Paket. — I send my sister a parcel. For collection, abholen is separable: Ich hole es morgen ab. — I will collect it tomorrow.",
            reading: ReadingPassage(
                "Ben findet einen Abholschein im Briefkasten. Sein Paket liegt in einer Filiale neben der Bäckerei. Am Samstag geht er dorthin und zeigt den Schein. Danach kauft er eine Briefmarke für einen Brief an seine Eltern.",
                "Ben finds a collection slip in the letterbox. His parcel is at a branch next to the bakery. On Saturday he goes there and shows the slip. Afterwards he buys a stamp for a letter to his parents.",
                question: "Where can Ben collect his parcel?",
                answer: "At a branch next to the bakery."),
            writing: WritingTask(
                "Tell an imagined sister about a parcel you are sending, without using a real address.",
                checklist: ["Say what you are sending.", "Mention checking the address.", "Ask the recipient to tell you when it arrives."],
                model: "Ich schicke dir heute ein Paket mit deinem Pullover. Die Adresse habe ich noch einmal geprüft. Ich bringe das Paket am Nachmittag zur Post. Schreib mir bitte, wenn es bei dir ankommt."),
            partner: "Guten Tag. Möchten Sie etwas verschicken oder ein Paket abholen?",
            partnerEnglish: "Hello. Would you like to send something or collect a parcel?",
            response: "Ich möchte ein Paket abholen. Hier ist mein Abholschein. Außerdem brauche ich eine Briefmarke für einen Brief.",
            responseEnglish: "I would like to collect a parcel. Here is my collection slip. I also need a stamp for a letter.",
            guided: "Say that you want to collect a parcel, refer to the collection slip, and request a stamp.",
            independent: "Role-play a post-office visit with two errands and a question about sending or collecting an item."
        ))

        days.append(CurriculumBuilder.day(
            26, "Payments and bank enquiries", "Discuss payment methods using fictional details only.",
            words: [
                NewWord("das Konto (Konten)", "bank account", "Ich habe eine Frage zu meinem Konto.", "I have a question about my bank account."),
                NewWord("die Überweisung (Überweisungen)", "bank transfer", "Für die Miete mache ich eine Überweisung.", "I make a bank transfer for the rent."),
                NewWord("bar", "in cash", "Im Café bezahle ich heute bar.", "I pay cash at the café today."),
                NewWord("die Quittung (Quittungen)", "receipt", "Kann ich bitte eine Quittung bekommen?", "May I have a receipt, please?"),
                NewWord("die Gebühr (Gebühren)", "fee", "Gibt es für diesen Service eine Gebühr?", "Is there a fee for this service?")
            ],
            grammar: "Ask about payment options with können and costs with wie viel: Kann ich bar bezahlen? — Can I pay in cash? Wie viel kostet dieser Service? — How much does this service cost? Use invented situations; do not enter account numbers, passwords, or other real financial information.",
            reading: ReadingPassage(
                "Im Sprachkurs üben Mara und Ben ein erfundenes Gespräch über Zahlungen. Mara fragt nach einer Überweisung für die Miete. Ben spielt einen Mitarbeiter und bittet sie, nach möglichen Gebühren zu fragen. Sie verwenden keine echten Kontodaten und besprechen danach, wie man höflich um eine Quittung bittet.",
                "In the language class Mara and Ben practise an invented conversation about payments. Mara asks about a bank transfer for the rent. Ben plays a staff member and asks her to enquire about possible fees. They use no real account details and then discuss how to politely ask for a receipt.",
                question: "What information do Mara and Ben avoid using?",
                answer: "They avoid using real account details."),
            writing: WritingTask(
                "Prepare a fictional enquiry about payment options at a service counter; include no financial identifiers.",
                checklist: ["Ask which payment methods are available.", "Ask whether there is a fee.", "Request a receipt."],
                model: "Ich habe eine Frage zur Zahlung. Kann ich hier bar bezahlen oder ist eine Überweisung möglich? Gibt es dafür eine Gebühr? Ich hätte gern eine Quittung."),
            partner: "Welche Frage haben Sie zur Zahlung? Bitte nennen Sie keine Kontodaten.",
            partnerEnglish: "What question do you have about payment? Please do not give any account details.",
            response: "Kann ich bar bezahlen oder eine Überweisung machen? Gibt es eine Gebühr? Ich möchte bitte eine Quittung.",
            responseEnglish: "Can I pay in cash or make a bank transfer? Is there a fee? I would like a receipt, please.",
            guided: "In an invented situation, ask about two payment methods, a fee, and a receipt; give no real financial details.",
            independent: "Act out a fictional payment enquiry, clarify a cost, and request proof of payment without sharing private data."
        ))

        days.append(CurriculumBuilder.day(
            27, "Booking a short trip", "Enquire about a room and check arrival and departure details.",
            words: [
                NewWord("buchen", "to book", "Wir buchen ein Zimmer für zwei Nächte.", "We book a room for two nights."),
                NewWord("die Anreise (Anreisen)", "arrival; journey to a destination", "Unsere Anreise ist am Freitag.", "Our arrival is on Friday."),
                NewWord("die Abreise (Abreisen)", "departure", "Am Tag der Abreise frühstücken wir früh.", "On the day of departure we have breakfast early."),
                NewWord("das Doppelzimmer (Doppelzimmer)", "double room", "Ist ein Doppelzimmer für Samstag frei?", "Is a double room available for Saturday?"),
                NewWord("die Bestätigung (Bestätigungen)", "confirmation", "Das Hotel schickt eine Bestätigung per E-Mail.", "The hotel sends a confirmation by email.")
            ],
            grammar: "Use von ... bis ... for a time span and für for a booked duration: Wir bleiben von Freitag bis Sonntag. — We are staying from Friday to Sunday. Ich möchte für zwei Nächte buchen. — I would like to book for two nights.",
            reading: ReadingPassage(
                "Mara und ihre Schwester planen einen Ausflug mit zwei Übernachtungen. Sie möchten ein Doppelzimmer von Freitag bis Sonntag buchen. Mara fragt das Hotel, ob eine Anreise am späten Abend möglich ist. In der Bestätigung prüft sie die Daten und die Uhrzeit für die Abreise.",
                "Mara and her sister are planning a trip with two overnight stays. They would like to book a double room from Friday to Sunday. Mara asks the hotel whether a late-evening arrival is possible. In the confirmation she checks the dates and the departure time.",
                question: "What does Mara ask the hotel about arrival?",
                answer: "She asks whether a late-evening arrival is possible."),
            writing: WritingTask(
                "Write an enquiry to an imagined guesthouse for a two-night visit.",
                checklist: ["Give the room type and length of stay.", "Ask about arriving late.", "Request written confirmation."],
                model: "Ich möchte ein Doppelzimmer von Freitag bis Sonntag buchen. Wir bleiben zwei Nächte. Ist eine Anreise um einundzwanzig Uhr möglich? Bitte schicken Sie mir eine Bestätigung."),
            partner: "Guten Tag, Pension am Park. Für wann möchten Sie ein Zimmer buchen?",
            partnerEnglish: "Hello, Park Guesthouse. For when would you like to book a room?",
            response: "Ich möchte ein Doppelzimmer von Freitag bis Sonntag buchen. Wir reisen am Freitagabend an. Können Sie mir eine Bestätigung schicken?",
            responseEnglish: "I would like to book a double room from Friday to Sunday. We are arriving on Friday evening. Can you send me a confirmation?",
            guided: "Request a double room for two nights, give an arrival time, and ask for confirmation.",
            independent: "Make an imagined accommodation booking, clarify arrival and departure, and check one practical detail."
        ))

        days.append(CurriculumBuilder.review(
            28, "Review: home, services, and travel", previous: days,
            grammar: "Connect practical questions with ob and polite modal requests: Können Sie mir sagen, ob eine Überweisung möglich ist? — Can you tell me whether a bank transfer is possible? Ich möchte von Freitag bis Sonntag buchen. — I would like to book from Friday to Sunday.",
            reading: ReadingPassage(
                "Vor ihrem Ausflug hat Mara noch viel zu tun. Sie ruft wegen einer Besichtigung an und holt danach ein Paket ab. Der Hausmeister bestätigt am Telefon den Termin für die Reparatur ihrer Heizung. Am Abend liest sie die Bestätigung für das Doppelzimmer und fragt das Hotel nach den Zahlungsmöglichkeiten.",
                "Before her trip Mara still has a lot to do. She calls about a viewing and then collects a parcel. The caretaker confirms the appointment for repairing her heating over the phone. In the evening she reads the double-room confirmation and asks the hotel about payment options.",
                question: "What does the caretaker confirm on the phone?",
                answer: "He confirms the appointment for repairing Mara's heating."),
            writing: WritingTask(
                "Write a practical message to a travel companion about errands before an imagined trip.",
                checklist: ["Mention a housing-related arrangement.", "Describe a parcel or telephone errand.", "Confirm the trip dates and a question for the accommodation."],
                model: "Am Donnerstag kommt der Hausmeister für die Reparatur der Heizung. Danach hole ich mein Paket ab. Unser Doppelzimmer ist von Freitag bis Sonntag gebucht. Ich frage noch, ob wir im Hotel bar bezahlen können."),
            partner: "Was musst du vor unserem Ausflug noch erledigen? Ist das Zimmer schon gebucht?",
            partnerEnglish: "What do you still need to do before our trip? Is the room booked already?",
            response: "Ich muss noch ein Paket abholen und den Hausmeister anrufen. Das Doppelzimmer ist von Freitag bis Sonntag gebucht. Die Bestätigung ist da, aber ich möchte noch nach den Zahlungsmöglichkeiten fragen.",
            responseEnglish: "I still need to collect a parcel and call the caretaker. The double room is booked from Friday to Sunday. The confirmation has arrived, but I still want to ask about payment options."
        ))

        return days
    }()
}
