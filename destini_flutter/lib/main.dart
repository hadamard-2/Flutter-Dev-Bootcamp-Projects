import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'story.dart';

void main() => runApp(const MyApp());

StoryBrain storyBrain = StoryBrain();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/sherlock.jpg'),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: StoryPage(),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  String option1Text = storyBrain.currentStory!.option1.toString();
  bool option2ButtonVisible = true;

  void reset() {
    option2ButtonVisible = true;
    storyBrain.currentStory = storyBrain.rootStory;
  }

  bool reachedTheEnd() {
    return (storyBrain.currentStory!.option1 == null &&
        storyBrain.currentStory!.option2 == null);
  }

  @override
  Widget build(BuildContext context) {
    if (reachedTheEnd()) {
      option1Text = 'Restart';
      option2ButtonVisible = false;
    } else {
      option1Text = storyBrain.currentStory!.option1.toString();
    }
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                storyBrain.currentStory!.storyText,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.3,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                if (reachedTheEnd()) {
                  reset();
                } else {
                  storyBrain.choosePath(1);
                }
              });
            },
            child: Card(
              color: const Color(0xFF8B0000),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Text(
                    option1Text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
          visible: option2ButtonVisible,
          child: Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  storyBrain.choosePath(2);
                });
              },
              child: Card(
                color: const Color(0xFF0C50A1),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Text(
                      storyBrain.currentStory!.option2.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
