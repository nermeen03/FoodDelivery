import 'package:flutter/material.dart';

import 'onboarding_login_button.dart';
import 'onboarding_sign_up_button.dart';


class OnBoardingButtonsSection extends StatelessWidget {
  const OnBoardingButtonsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 30.0,
        right: 25,
      ),
      child: Row(
        children: [
          OnBoardingSignUpButton(),
          SizedBox(width: 10),
          OnBoardingLogInButton(),
        ],
      ),
    );
  }
}