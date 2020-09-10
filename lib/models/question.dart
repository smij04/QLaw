class cQuestion {

  final int     _questionIndex;
  final String  questionTxt;
  final String  answerATxt;
  final String  answerBTxt;
  final String  answerCTxt;
  final String  answerDTxt;
  final int     correctAnsw;
        bool    verified;
  
  cQuestion(
    this._questionIndex, {
      this.questionTxt,
      this.answerATxt,
      this.answerBTxt,
      this.answerCTxt,
      this.answerDTxt,
      this.correctAnsw,
      this.verified,
    }
    
  );

}

List<cQuestion> Questions = [
  cQuestion(1, 
    questionTxt: "Vysvětlete princip kolegiality.",
    answerATxt: "vždy několik úředníků ve stejném postavení. např. 2 konzulové",
    answerBTxt: "Závislost úředniků jeden na druhém",
    answerCTxt: "Jeden úředník v čele všech", 
    answerDTxt: "absolutní nevázanost úředníků",
    correctAnsw: 1,
    verified: true
    ),

  cQuestion(2, 
    questionTxt: "Vysvětlete princip annuity.",
    answerATxt: "Úředníci jsou voleni na dobu neurčitou",
    answerBTxt: "Všichni úředníci jsou voleni na dobu 1 rok",
    answerCTxt: "Úředníci jsou voleni na dobu určitou", 
    answerDTxt: "Úředníci zastávají úřad po dobu trvání své bezúhonnosti",
    correctAnsw: 3,
    verified:  true
    ),

  cQuestion(3, 
    questionTxt: "V jakém století byl vydán citační zákon Theodosia II. a Valentiniana III. ?",
    answerATxt: "Ve 2. století n.l.",
    answerBTxt: "Ve 4. století n.l.",
    answerCTxt: "Ve 2. století př.n.l.", 
    answerDTxt: "V 5. století n.l.",
    correctAnsw: 4,
    verified:  true
    ),
  
  cQuestion(4, 
    questionTxt: "Jaký právník měl nejvyšší postavení v citačním zákoně z roku 426 n.l.?",
    answerATxt: "Paulus",
    answerBTxt: "Papinianus",
    answerCTxt: "Ulpus", 
    answerDTxt: "Gaius",
    correctAnsw: 2,
    verified:  true
    ),

  cQuestion(5, 
    questionTxt: "Co je census?",
    answerATxt: "Evidence dobytka občanů Říma",
    answerBTxt: "Nařízení císaře o zapalování novinářů",
    answerCTxt: "Obecná doporučení praetorů k rodinnému soužití", 
    answerDTxt: "Evidence římských občanů a jejich odhadovaného majetku",
    correctAnsw: 4, 
    verified: true
    ),

  cQuestion(6, 
    questionTxt: "Co jsou to Mandata?",
    answerATxt: "Rozsudky císařského soudu",
    answerBTxt: "Branná povinnost",
    answerCTxt: "Instrukce pro podřízené úředníky",
    answerDTxt: "Odpovědi císaře na dotazy", 
    correctAnsw: 3, 
    verified: true
    ),

  cQuestion(7, 
    questionTxt: "Kdy byla vydána Digesta?",
    answerATxt: "533 n. l.",
    answerBTxt: "532 n. l.",
    answerCTxt: "433 n. l.",
    answerDTxt: "535 n. l.", 
    correctAnsw: 1,
    verified: true
    ),

  cQuestion(8, 
    questionTxt: "Co by lex Hortensia?",
    answerATxt: "Založení Svaté říše řimske",
    answerBTxt: "Zákon upravující postavení žen",
    answerCTxt: "Plebiscita byla zrovnoprávněna se zákony",
    answerDTxt: "Vyhlášení války Řecku", 
    correctAnsw: 3,
    verified:  true
    ),

  cQuestion(9, 
    questionTxt: "Kdo je libertinus?",
    answerATxt: "Osvobozený trestanec",
    answerBTxt: "Otrok propuštěný na svobodu svým pánem",
    answerCTxt: "Dítě naverbované do armády",
    answerDTxt: "Svobodný občan Říma", 
    correctAnsw: 2,
    verified:  true
    ),

  cQuestion(10, 
    questionTxt: "Co je Civis?",
    answerATxt: "Římský občan",
    answerBTxt: "Římský otrok",
    answerCTxt: "Římský voják",
    answerDTxt: "Římský senátor", 
    correctAnsw: 1,
    verified:  true
    ),
  
  cQuestion(11, 
    questionTxt: "Otazka 11",
    answerATxt: "AAA",
    answerBTxt: "BBB",
    answerCTxt: "CCC",
    answerDTxt: "DDD", 
    correctAnsw: 1,
    verified:  true
    ),

  cQuestion(12, 
    questionTxt: "Otazka 12",
    answerATxt: "AAA",
    answerBTxt: "BBB",
    answerCTxt: "CCC",
    answerDTxt: "DDD", 
    correctAnsw: 1,
    verified:  true
    ),
  
  cQuestion(13, 
    questionTxt: "Otazka 13",
    answerATxt: "AAA",
    answerBTxt: "BBB",
    answerCTxt: "CCC",
    answerDTxt: "DDD", 
    correctAnsw: 1,
    verified:  true
    ),


];
