import 'package:flutter/material.dart';

import '../common_widgets.dart';

class DetailsFoodName extends StatelessWidget {
  const DetailsFoodName({super.key, required this.mealName});

  final String mealName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10,right: 20),
      child: Row(
        children: [
          ExpandSingleText(text: mealName,size: 26,),
          const SizedBox(width: 10),
          const Text(
            "15.30",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF6B57),
            ),
          ),
        ],
      ),
    );
  }
}


