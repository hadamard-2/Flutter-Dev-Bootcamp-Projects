import 'package:flutter/material.dart';

const defaultContentColor = Color(0xFF8C8D99);

class IconContent extends StatelessWidget {
  const IconContent(
      {super.key,
      required this.iconData,
      required this.cardText,
      this.contentColor = defaultContentColor});

  final IconData iconData;
  final String cardText;
  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          color: contentColor,
          iconData,
          size: 90,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          cardText,
          style: TextStyle(
            color: contentColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
