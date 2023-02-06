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
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Dicee'),
        ),
        body: const Center(
          child: DicePair(),
        ),
      ),
    );
  }
}

class DicePair extends StatefulWidget {
  const DicePair({super.key});

  @override
  State<StatefulWidget> createState() => DicePairState();
}

class DicePairState extends State<DicePair> {
  int dice0Num = 1 + Random().nextInt(6);
  int dice1Num = 1 + Random().nextInt(6);

  void rollDice() {
    setState(() {
      dice0Num = 1 + Random().nextInt(6);
      dice1Num = 1 + Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: TextButton(
              onPressed: rollDice,
              child: Image.asset('images/dice$dice0Num.png'),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: TextButton(
              onPressed: rollDice,
              child: Image.asset('images/dice$dice1Num.png'),
            ),
          ),
        ),
      ],
    );
  }
}
