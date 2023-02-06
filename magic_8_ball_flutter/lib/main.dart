import "dart:math";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[700],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: const Text('Ask Me Anything'),
        ),
        body: const Center(
          child: Magic8BallPage(),
        ),
      ),
    );
  }
}

class Magic8BallPage extends StatefulWidget {
  const Magic8BallPage({super.key});

  @override
  State<StatefulWidget> createState() => Magic8BallPageState();
}

class Magic8BallPageState extends State<Magic8BallPage> {
  int ballNum = 1 + Random().nextInt(4);

  void pickRandomResponse() {
    setState(() {
      ballNum = 1 + Random().nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: pickRandomResponse,
      child: Expanded(
        child: Image.asset('images/ball$ballNum.png'),
      ),
    );
  }
}
