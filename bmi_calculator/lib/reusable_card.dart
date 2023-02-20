import 'package:flutter/material.dart';

const activeCardColor = Color(0xFF101427);

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, this.cardColor = activeCardColor, required this.cardChild});

  final Color cardColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}
