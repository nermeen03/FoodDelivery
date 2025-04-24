import 'package:flutter/material.dart';

import '../widgets/onboarding/onboarding_buttons_section.dart';
import '../widgets/onboarding/onboarding_text_section.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/img_17.png", fit: BoxFit.cover),
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnBoardingTextSection(),
                OnBoardingButtonsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








