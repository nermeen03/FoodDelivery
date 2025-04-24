import 'package:flutter/material.dart';

import '../../models/meal_model.dart';
import '../common_widgets.dart';

class MealListWidget extends StatelessWidget {
  const MealListWidget({super.key,required this.meals,required this.onTap,});

  final List<MealModel> meals;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 95,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItemWidget(meal: meals[index],onTap: onTap,);
          },
        ),
      ),
    );
  }
}
class MealItemWidget extends StatelessWidget {
  const MealItemWidget({super.key, required this.meal,required this.onTap,});
  final MealModel meal;
  final Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(meal.mealName);
      },
      child: Container(
          margin: EdgeInsets.all(10),
          width: 80,
          child:Column(
            children: [
              Image.network(
                meal.image,
                fit: BoxFit.cover,
              ),
              ExpandSingleText(text: meal.mealName,size: 16,)
          ]
          )

      ),
    );
  }
}