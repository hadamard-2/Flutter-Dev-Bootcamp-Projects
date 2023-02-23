import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'dart:math';

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
    return ReusableCard(
      onPressed: () {},
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.title,
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

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.iconData, required this.onPressed});

  final IconData iconData;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: kRoundIconButtonColor,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(
        iconData,
        size: 35,
        color: Colors.white,
      ),
    );
  }
}
