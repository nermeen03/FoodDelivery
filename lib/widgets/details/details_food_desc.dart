import 'package:flutter/material.dart';

import 'details_expandable_text.dart';

class DetailsFoodDesc extends StatelessWidget {
  const DetailsFoodDesc({
    super.key, required this.mealDesc
  });

  final String mealDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
      width: double.infinity,
      child: ExpandableText(text: mealDesc),
    );
  }
}

