import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void evaluateAnswer(bool userResponse) {
    if (quizBrain.isFinished()) {
      Alert(
        context: context,
        title: "Finished",
        desc: "You've reached the end of the quiz.",
        closeIcon: const Icon(Icons.close),
      ).show();
      quizBrain.reset();
    } else {
      if (quizBrain.answer == userResponse) {
        quizBrain.resultList.add(
          const Icon(
            Icons.done,
            color: Colors.green,
          ),
        );
      } else {
        quizBrain.resultList.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    }

    quizBrain.goToNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        QuestionCard(questionText: quizBrain.question),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              color: Colors.green,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    evaluateAnswer(true);
                  });
                },
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    evaluateAnswer(false);
                  });
                },
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: quizBrain.resultList,
        ),
      ],
    );
  }
}

class QuestionCard extends StatelessWidget {
  final String questionText;

  const QuestionCard({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
