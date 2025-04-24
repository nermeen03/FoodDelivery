import 'package:comida_food_delivery_app/models/user_model.dart';
import 'package:comida_food_delivery_app/storage/authentication_database.dart';
import 'package:comida_food_delivery_app/storage/shared_preference.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class SignUpFormFields extends StatelessWidget {
  SignUpFormFields({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full name",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your Full name";
                }
                return null;
              },
            ),
            const SizedBox(height: 35),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "E-mail",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your E-mail";
                }
                return null;
              },
            ),
            const SizedBox(height: 35),
            TextFormField(
              controller: passController,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your Password";
                }
                return null;
              },
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final name = nameController.text;
                  final email = emailController.text;
                  final pass = passController.text;

                  var i = await UserDBHelper().insertUser(
                      UserModel(name: name, email: email, pass: pass));
                  if (i > 0) {
                    await SharedPreference.setShared();
                    Navigator.pushNamed(context, AppRoutes.homeScreen);
                    print(await UserDBHelper().getAll());
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFFFF6B57)),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                padding: WidgetStateProperty.all(EdgeInsets.symmetric(
                    horizontal: 80, vertical: 10)),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Or Sign up with",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
