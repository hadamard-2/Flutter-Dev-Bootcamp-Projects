import 'package:flutter/material.dart';
import 'reusable_card.dart';

const floatingActionButtonColor = Color(0xFF1C2033);

class DynamicTextCard extends StatefulWidget {
  const DynamicTextCard({super.key, required this.title});

  final String title;

  @override
  State<DynamicTextCard> createState() => _DynamicTextCardState();
}

class _DynamicTextCardState extends State<DynamicTextCard> {
  int value = 0;

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
              style: const TextStyle(
                color: Color(0XFF8D8E98),
              ),
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: floatingActionButtonColor,
                onPressed: decrementValue,
                child: const Icon(
                  Icons.remove,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              FloatingActionButton(
                backgroundColor: floatingActionButtonColor,
                onPressed: incrementValue,
                child: const Icon(
                  Icons.add,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
