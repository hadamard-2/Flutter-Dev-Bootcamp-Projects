import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

final myPlayer = AudioPlayer();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            XylophoneKey(noteNumber: 1, keyColor: Colors.red),
            XylophoneKey(noteNumber: 2, keyColor: Colors.orange),
            XylophoneKey(noteNumber: 3, keyColor: Colors.yellow),
            XylophoneKey(noteNumber: 4, keyColor: Colors.green),
            XylophoneKey(noteNumber: 5, keyColor: Colors.blue),
            XylophoneKey(noteNumber: 6, keyColor: Colors.indigo),
            XylophoneKey(noteNumber: 7, keyColor: Colors.purple),
          ],
        ),
      ),
    );
  }
}

class XylophoneKey extends StatelessWidget {
  final int noteNumber;
  final Color keyColor;

  const XylophoneKey(
      {super.key, required this.noteNumber, required this.keyColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: keyColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Container(),
        onPressed: () {
          myPlayer.play(AssetSource('note$noteNumber.wav'));
        },
      ),
    );
  }
}
