import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> answers = [];

  int idxQuestion = 0;

  final Icon correctAnswer = const Icon(
    Icons.check,
    color: Colors.green,
  );

  final Icon wrongAnswer = const Icon(
    Icons.close,
    color: Colors.red,
  );

  @override
  void initState() {
    super.initState();
    listQuestions.shuffle();
  }

  void checkAnswer(Question question, bool userAnswer) {
    if (idxQuestion == 0) answers.clear();
    answers.add(question.answer == userAnswer ? correctAnswer : wrongAnswer);
    setState(() {
      if ((listQuestions.length - 1) > idxQuestion) {
        idxQuestion++;
      } else {
        idxQuestion = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                listQuestions[idxQuestion].question,
                style: const TextStyle(color: Colors.white, fontSize: 40.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          MyButton(
            color: Colors.green,
            function: () => checkAnswer(listQuestions[idxQuestion], true),
            title: 'Correct',
          ),
          MyButton(
            color: Colors.red,
            function: () => checkAnswer(listQuestions[idxQuestion], false),
            title: 'Incorrect',
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              dragStartBehavior: DragStartBehavior.start,
              child: Row(
                children: answers,
              ),
            ),
          )
        ],
      ),
    );
  }
}
