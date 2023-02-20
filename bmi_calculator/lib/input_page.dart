import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'dynamic_text_card.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEA1556);
const activeIconContentColor = Colors.white;
const inactiveIconContentColor = Color(0XFF8D8E98);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 183;

  Gender selectedGender = Gender.male;

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
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardColor: const Color(0xFF1D1F33),
                    cardChild: IconContent(
                      contentColor: selectedGender == Gender.male
                          ? activeIconContentColor
                          : inactiveIconContentColor,
                      iconData: Icons.male,
                      cardText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardColor: const Color(0xFF1D1F33),
                    cardChild: IconContent(
                      contentColor: selectedGender == Gender.female
                          ? activeIconContentColor
                          : inactiveIconContentColor,
                      iconData: Icons.female,
                      cardText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPressed: () {},
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
                      const Text(
                        ' cm',
                        style: TextStyle(
                          color: Color(0XFF8D8E98),
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: bottomContainerColor,
                    min: 50,
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
              children: const [
                Expanded(
                  child: DynamicTextCard(title: 'WEIGHT'),
                ),
                Expanded(
                  child: DynamicTextCard(title: 'AGE'),
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
