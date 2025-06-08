class QuizEntity{
  final String question;
  final List<String> options;
  const QuizEntity({required this.question,required this.options});

  static final List<QuizEntity> forexQuizQuestions = [
    QuizEntity(
      question: "What does 'forex' stand for?",
      options: [
        "Foreign Exchange",
        "Foreign Expense",
        "Federal Exchange",
        "Finance and Export"
      ],
    ),
    QuizEntity(
      question: "What is a currency pair?",
      options: [
        "Two currencies traded together",
        "A single currency",
        "A country’s local money",
        "A comparison between gold and silver"
      ],
    ),
    QuizEntity(
      question: "What is the base currency in the pair EUR/USD?",
      options: [
        "EUR",
        "USD",
        "GBP",
        "JPY"
      ],
    ),
    QuizEntity(
      question: "Which of the following is a major currency pair?",
      options: [
        "EUR/USD",
        "USD/ZAR",
        "NZD/SGD",
        "GBP/TRY"
      ],
    ),
    QuizEntity(
      question: "What is a 'pip' in forex trading?",
      options: [
        "A unit of price movement",
        "A type of trading strategy",
        "A trading platform",
        "An economic indicator"
      ],
    ),
    QuizEntity(
      question: "What does leverage in forex allow you to do?",
      options: [
        "Control a large position with a small amount of money",
        "Avoid paying taxes",
        "Buy crypto directly",
        "Remove trading fees"
      ],
    ),
    QuizEntity(
      question: "Which type of order executes a trade at the current market price?",
      options: [
        "Market order",
        "Limit order",
        "Stop-loss order",
        "Trailing stop"
      ],
    ),
    QuizEntity(
      question: "What does 'spread' refer to in forex?",
      options: [
        "The difference between the bid and ask price",
        "The length of the trading session",
        "The number of trades in a day",
        "The distance between trading indicators"
      ],
    ),
    QuizEntity(
      question: "Which indicator measures market momentum?",
      options: [
        "Relative Strength Index (RSI)",
        "Moving Average",
        "Fibonacci Retracement",
        "Bollinger Bands"
      ],
    ),
    QuizEntity(
      question: "What kind of analysis is based on news, interest rates, and GDP data?",
      options: [
        "Fundamental Analysis",
        "Technical Analysis",
        "Sentiment Analysis",
        "Algorithmic Analysis"
      ],
    ),
  ];

}