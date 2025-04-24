import 'package:comida_food_delivery_app/widgets/details/details_check_out_section.dart';
import 'package:comida_food_delivery_app/widgets/details/details_food_info_section.dart';
import 'package:comida_food_delivery_app/widgets/details/details_toping_section.dart';
import 'package:flutter/material.dart';

import '../models/meal_details_model.dart';
import '../models/meal_model.dart';
import '../utils/services/api_end_point.dart';
import '../utils/services/network_service.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {

  MealModel? mealDetails;
  List<MealModel>? ingredients;

  void _loadMealDetails(String mealId) async {
    final result = await MealsService.fetchData(path:ApiEndPoint.mealDetail,mealId: mealId);
    if (result.success) {
      MealDetailsModel mealDetailsModel = MealDetailsModel.fromJson(
          result.data);
      setState(() {
        List<MealsInfo>? mealDetail = mealDetailsModel.meals;
        if (mealDetail != null) {
          mealDetails = MealModel(image: mealDetail[0].strMealThumb ?? "",
              mealName: mealDetail[0].strMeal ?? "",
              mealDesc: mealDetail[0].strInstructions);
          ingredients= [];
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
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    print("Arguments received: $arguments");
    if (arguments != null && arguments is MealModel) {
      final MealModel meal = arguments;
      _loadMealDetails(meal.mealId!);
    } else {
      print("Error: No MealModel passed to the route");
    }
    return Scaffold(
          backgroundColor: Colors.white,
          body: LayoutBuilder(builder: (context,constraints){
          if(mealDetails != null && ingredients!=null){
            return Column(
              children: [
                DetailsFoodInfoSection(mealInfo: mealDetails!,),
                DetailsTopingSection(meals: ingredients!),
                DetailsCheckOutSection(mealInfo: mealDetails!,)
              ],
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
    },));
  }
}



