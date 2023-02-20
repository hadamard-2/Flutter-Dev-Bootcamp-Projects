import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconContentCard extends StatelessWidget {
  const IconContentCard(
      {super.key, required this.iconData, required this.cardText});

  final IconData iconData;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            iconData,
            size: 75,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            cardText,
            style: const TextStyle(
              color: Color(0XFF8D8E98),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
