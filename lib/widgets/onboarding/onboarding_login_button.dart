import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
class OnBoardingLogInButton extends StatelessWidget {
  const OnBoardingLogInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.login);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0xFF000000),
          padding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
        ),
        child: Text(
          "Log In",
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