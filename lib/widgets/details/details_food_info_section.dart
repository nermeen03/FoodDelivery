import 'package:flutter/material.dart';

import '../../models/meal_model.dart';
import 'details_food_desc.dart';
import 'details_food_name.dart';
import 'details_options.dart';
import 'details_top_section.dart';
class DetailsFoodInfoSection extends StatelessWidget {
  const DetailsFoodInfoSection({
    super.key, required this.mealInfo,
  });

  final MealModel mealInfo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            DetailsTopSection(image: mealInfo.image),
            DetailsFoodName(mealName: mealInfo.mealName),
            DetailsOptions(),
            DetailsFoodDesc(mealDesc: mealInfo.mealDesc!),
          ],
        ),
      ),
    );
  }
}
