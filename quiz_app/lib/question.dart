class Question {
  String question;
  bool answer;

  Question({required this.question, required this.answer});
}

List<Question> listQuestions = [
  Question(question: 'Australia is wider than the moon.', answer: true),
  Question(
      question: 'Alaska is the biggest American state in square miles.',
      answer: true),
  Question(question: 'There are five different blood groups.', answer: false),
  Question(
      question: 'Monaco is the smallest country in the world.', answer: false),
  Question(
      question: 'A is the most common letter used in the English language.',
      answer: true),
  Question(
      question: 'The unicorn is the national animal of Scotland.',
      answer: true),
];
