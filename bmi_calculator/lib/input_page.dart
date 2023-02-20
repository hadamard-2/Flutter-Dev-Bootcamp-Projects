import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content_card.dart';
import 'dynamic_text_card.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEA1556);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 183;

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
              children: const [
                IconContentCard(
                  iconData: FontAwesomeIcons.mars,
                  cardText: 'MALE',
                ),
                IconContentCard(
                  iconData: FontAwesomeIcons.venus,
                  cardText: 'FEMALE',
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
                    child: Text(
                      'HEIGHT',
                      style: TextStyle(
                        color: Color(0XFF8D8E98),
                      ),
                    ),
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
                    min: 50,
                    max: 300,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                DynamicTextCard(title: 'WEIGHT'),
                DynamicTextCard(title: 'AGE'),
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
