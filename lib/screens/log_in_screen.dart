import 'package:comida_food_delivery_app/widgets/login/login_form_fields.dart';
import 'package:comida_food_delivery_app/widgets/signup/sign_up_back_arrow.dart';
import 'package:comida_food_delivery_app/widgets/signup/sign_up_external_options.dart';
import 'package:comida_food_delivery_app/widgets/signup/sign_up_form_fields.dart';
import 'package:comida_food_delivery_app/widgets/signup/sign_up_login_option.dart';
import 'package:comida_food_delivery_app/widgets/signup/sign_up_options.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/img_11.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: SignUpBackArrow(),
          ),

          Positioned(child: Column(children: [
              const SizedBox(height: 100),
              Text(
              "Sign Up",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                width: 150,
              child: Text(
              "Please sign up to get started",
              style: TextStyle(color: Colors.white,fontSize: 15),
              ),
              ),
              ])),

          Align(
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginFormFields(),
                  ],
                ),

          ),
        ],
      ),
    );
  }
}






