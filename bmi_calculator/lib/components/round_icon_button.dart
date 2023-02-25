import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

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
