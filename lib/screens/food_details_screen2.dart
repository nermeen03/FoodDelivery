import 'package:comida_food_delivery_app/widgets/details/details_check_out_section.dart';
import 'package:comida_food_delivery_app/widgets/details/details_food_info_section.dart';
import 'package:comida_food_delivery_app/widgets/details/details_toping_section.dart';
import 'package:flutter/material.dart';

import '../models/meal_details_model.dart';
import '../models/meal_model.dart';
import '../utils/services/api_end_point.dart';
import '../utils/services/network_service.dart';

class FoodDetails2 extends StatefulWidget {
  const FoodDetails2({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  State<FoodDetails2> createState() => _FoodDetailsState(mealModel);
}

class _FoodDetailsState extends State<FoodDetails2> {
  _FoodDetailsState(this.meal);

  MealModel? mealDetails;
  MealModel? meal;
  List<MealModel>? ingredients;

  void _loadMealDetails(String mealId) async {
    final result = await MealsService.fetchData(path: ApiEndPoint.mealDetail, mealId: mealId);
    if (result.success) {
      MealDetailsModel mealDetailsModel = MealDetailsModel.fromJson(result.data);
      setState(() {
        List<MealsInfo>? mealDetail = mealDetailsModel.meals;
        if (mealDetail != null) {
          mealDetails = MealModel(
            mealId: mealId,
            image: mealDetail[0].strMealThumb ?? "",
            mealName: mealDetail[0].strMeal ?? "",
            mealDesc: mealDetail[0].strInstructions,
          );
          ingredients = [];
          for (var i = 1; i <= 20; i++) {
            final ingredient = mealDetail[0].getIngredient(i);
            if (ingredient != null && ingredient.isNotEmpty) {
              ingredients?.add(MealModel(image: getIngredientImageUrl(ingredient), mealName: ingredient));
            }
          }
        }
      });
    } else {
      print("Error: ${result.message}");
    }
  }

  String getIngredientImageUrl(String ingredient) {
    String formattedIngredient = ingredient.toLowerCase().replaceAll(' ', '_');
    return 'https://www.themealdb.com/images/ingredients/$formattedIngredient.png';
  }

  @override
  @override
  void initState() {
    super.initState();
    if (meal != null) {
      print("before load");
      _loadMealDetails(meal!.mealId!);
    } else {
      print("Error: No MealModel passed to the route");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (mealDetails != null && ingredients != null) {
            return Column(
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: DetailsFoodInfoSection(mealInfo: mealDetails!),
                  ),
                ),
                DetailsTopingSection(meals: ingredients!),
                DetailsCheckOutSection(mealInfo: mealDetails!,),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


