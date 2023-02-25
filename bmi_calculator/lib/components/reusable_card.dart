import 'package:flutter/material.dart';

const defaultCardColor = Color(0xFF101427);

class ReusableCard extends StatefulWidget {
  const ReusableCard(
      {super.key,
      this.cardColor = defaultCardColor,
      required this.cardChild,
      required this.onPressed});

  final Color cardColor;
  final Widget cardChild;
  final void Function() onPressed;

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.cardChild,
      ),
    );
  }
}
