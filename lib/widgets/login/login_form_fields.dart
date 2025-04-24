import 'package:comida_food_delivery_app/models/user_model.dart';
import 'package:comida_food_delivery_app/storage/authentication_database.dart';
import 'package:comida_food_delivery_app/storage/shared_preference.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class LoginFormFields extends StatelessWidget {
  LoginFormFields({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
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
            const SizedBox(height: 30),
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
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final name = nameController.text;
                  final pass = passController.text;

                  var i = await UserDBHelper().search(
                      UserModel(name: name, pass: pass));
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
                "LogIn",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
