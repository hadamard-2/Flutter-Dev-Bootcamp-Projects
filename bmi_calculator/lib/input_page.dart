import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF101427);
const bottomContainerColor = Color(0xFFEA1556);
const floatingActionButtonColor = Color(0xFF1C2033);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 183;
  int weight = 74;
  int age = 19;

  void incrementWeight() {
    setState(() {
      weight++;
    });
  }

  void decrementWeight() {
    setState(() {
      if (weight > 0) {
        weight--;
      }
    });
  }

  void incrementAge() {
    setState(() {
      age++;
    });
  }

  void decrementAge() {
    setState(() {
      if (age > 0) {
        age--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.mars,
                        size: 75,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'MALE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.venus,
                        size: 75,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'FEMALE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('HEIGHT'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      const Text(' cm'),
                    ],
                  ),
                  Slider(
                    activeColor: bottomContainerColor,
                    min: 10,
                    max: 300,
                    value: height.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        height = value.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text('WEIGHT'),
                      ),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            backgroundColor: floatingActionButtonColor,
                            onPressed: decrementWeight,
                            child: const Icon(
                              Icons.remove,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: floatingActionButtonColor,
                            onPressed: incrementWeight,
                            child: const Icon(
                              Icons.add,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text('AGE'),
                      ),
                      Text(
                        age.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            backgroundColor: floatingActionButtonColor,
                            onPressed: incrementAge,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: floatingActionButtonColor,
                            onPressed: decrementAge,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
            child: const Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatefulWidget {
  const ReusableCard(
      {super.key, this.cardColor = activeCardColor, required this.cardChild});

  final Color cardColor;
  final Widget cardChild;

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: widget.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.cardChild,
      ),
    );
  }
}
