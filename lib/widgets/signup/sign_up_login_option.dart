import 'package:flutter/material.dart';

class SignUpLoginOption extends StatelessWidget {
  const SignUpLoginOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account? ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          Text("Login",style: TextStyle(color: Color(0xFFFF6B57),fontSize: 15,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
