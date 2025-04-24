import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
class OnBoardingSignUpButton extends StatelessWidget {
  const OnBoardingSignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.signUp);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0xFFFFFFFF).withOpacity(0.2),
          side: BorderSide(
            color: Color(0xFFFFFFFF),
            width: 1.5,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
        ),
        child: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}