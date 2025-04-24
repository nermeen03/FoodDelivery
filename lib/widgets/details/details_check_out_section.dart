import 'package:comida_food_delivery_app/widgets/details/details_counter_section.dart';
import 'package:flutter/material.dart';

import '../../models/meal_model.dart';

class DetailsCheckOutSection extends StatelessWidget {
  const DetailsCheckOutSection({
    super.key,required this.mealInfo,
  });

  final MealModel mealInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 22,bottom: 23),
      decoration: BoxDecoration(
        color: Colors.black,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterSection(mealInfo: mealInfo,),
        ],
      ),
    );
  }
}
