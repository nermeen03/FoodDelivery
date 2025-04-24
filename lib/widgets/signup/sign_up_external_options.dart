import 'package:flutter/material.dart';

class SignUpExternalOptions extends StatelessWidget {
  const SignUpExternalOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/img_20.png",
            width: 20,
          ),
          label: Text("Facebook"),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/img_21.png",
              width: 20,
            ),
            label: Text("Google"),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
