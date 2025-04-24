import 'package:flutter/material.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Color(0xFFFF6B57)),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            padding: WidgetStateProperty.all(EdgeInsets.only(left: 80,right: 80,top: 10,bottom: 10)), // Padding inside the button
          ),
          child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ),
        Text(
          "Or Sign up with",
          style: TextStyle(color: Colors.grey),
        ),
      ],);
  }
}
