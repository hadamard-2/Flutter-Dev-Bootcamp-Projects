import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/dynamic_text_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_text_bar.dart';
import 'dart:math';
import 'package:bmi_calculator/calculator_brain.dart';

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
  int height = Random().nextInt(100) + 120;

  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    CalculatorBrain.height = height.toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
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
                          ? kActiveIconContentColor
                          : kInactiveIconContentColor,
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
                          ? kActiveIconContentColor
                          : kInactiveIconContentColor,
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
                      style: kLabelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        ' cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kInactiveIconContentColor,
                      thumbColor: kBottomContainerColor,
                      overlayColor: const Color(0x29EA1556),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 24),
                    ),
                    child: Slider(
                      min: 120,
                      max: 220,
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: DynamicTextCard(title: 'Weight'),
                ),
                Expanded(
                  child: DynamicTextCard(title: 'Age'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomTextBar(
        text: 'CALCULATE',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ResultPage()),
          );
        },
      ),
    );
  }
}
