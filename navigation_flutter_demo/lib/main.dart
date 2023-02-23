import 'package:flutter/material.dart';
import 'screen_0.dart';
import 'screen_1.dart';
import 'screen_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => const Screen0(),
      '/screen1': (context) => const Screen1(),
      '/screen2': (context) => const Screen2(),
    });
  }
}
