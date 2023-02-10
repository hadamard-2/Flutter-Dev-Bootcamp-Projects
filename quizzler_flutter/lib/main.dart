import 'package:flutter/material.dart';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({super.key});

  final List<Map> myQuestions = [
    {'You can lead a cow down stairs but not up stairs.': false},
    {'Approximately one quarter of human bones are in the feet.': true},
    {'A slug\'s blood is green.': true},
    // {'A penguin is a bird that can fly.': false},
    // {'The Great Wall of China is visible from the moon.': false},
    // {
    //   'The average person will swallow about eight spiders in their lifetime.':
    //       false
    // },
    // {'The tallest mammal in the world is the giraffe.': true},
    // {'The capital city of Australia is Sydney.': false},
    // {
    //   'The shortest war in history was between Britain and Zanzibar on 27 August 1896.':
    //       true
    // },
    // {'The human nose can detect more than 1 trillion different scents.': true},
    // {'Cats have better memories than dogs.': false},
    // {
    //   'The only letter that doesn\'t appear in any U.S. state name is \'Q\'.':
    //       true
    // },
    // {'A group of flamingos is called a flamboyance.': true}
  ];

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  List<Widget> resultList = [];
  String? currentQuestion;
  bool lastQuestionIsEvaluated = false;

  void evaluateAnswerAndGoToNextQuestion(bool userResponse) {
    bool nextQuestionExists = questionIndex < widget.myQuestions.length - 1;

    if (nextQuestionExists) {
      evaluateAnswer(userResponse);
      goToNextQuestion();
    } else if (!lastQuestionIsEvaluated) {
      lastQuestionIsEvaluated = true;
      evaluateAnswer(userResponse);
    }
  }

  void evaluateAnswer(bool userResponse) {
    setState(() {
      bool answer = widget.myQuestions[questionIndex][currentQuestion];
      resultList.add(
        PointIndicator(correctAnswer: answer == userResponse),
      );
    });
  }

  void goToNextQuestion() {
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    currentQuestion = widget.myQuestions[questionIndex].keys.single;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        QuestionCard(questionText: currentQuestion.toString()),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              color: Colors.green,
              child: TextButton(
                onPressed: () {
                  evaluateAnswerAndGoToNextQuestion(true);
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
                  evaluateAnswerAndGoToNextQuestion(false);
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
          children: resultList,
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

class PointIndicator extends StatelessWidget {
  final bool correctAnswer;

  const PointIndicator({super.key, required this.correctAnswer});

  @override
  Widget build(BuildContext context) {
    if (correctAnswer) {
      return const Icon(
        Icons.done,
        color: Colors.green,
      );
    }
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }
}
