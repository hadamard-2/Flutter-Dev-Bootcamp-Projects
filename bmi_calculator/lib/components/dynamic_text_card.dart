import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'dart:math';
import 'round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class DynamicTextCard extends StatefulWidget {
  const DynamicTextCard({super.key, required this.title});

  final String title;

  @override
  State<DynamicTextCard> createState() => _DynamicTextCardState();
}

class _DynamicTextCardState extends State<DynamicTextCard> {
  int value = Random().nextInt(90) + 1;

  void incrementValue() {
    setState(() {
      value++;
    });
  }

  void decrementValue() {
    setState(() {
      if (value > 0) {
        value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title.toLowerCase() == "weight".toLowerCase()) {
      CalculatorBrain.weight = value.toDouble();
    }

    return ReusableCard(
      onPressed: () {},
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.title.toUpperCase(),
              style: kLabelTextStyle,
            ),
          ),
          Text(
            value.toString(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundIconButton(
                iconData: Icons.remove,
                onPressed: decrementValue,
              ),
              RoundIconButton(
                iconData: Icons.add,
                onPressed: incrementValue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
