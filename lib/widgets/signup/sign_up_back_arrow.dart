import 'package:flutter/material.dart';

class SignUpBackArrow extends StatelessWidget {
  const SignUpBackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.pop(context);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: BoxConstraints.tightFor(width: 40, height: 40),
      child: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
        size: 20,
      ),
    );
  }
}