import 'package:flutter/material.dart';

class OnBoardingTextSection extends StatelessWidget {
  const OnBoardingTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 280.0,
        left: 30.0,
        right: 25,
      ),
      child: Text(
        "I don't feel like cooking. Let's order food delivery.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 42,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}