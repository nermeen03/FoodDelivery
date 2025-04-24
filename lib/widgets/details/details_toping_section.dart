import 'package:flutter/material.dart';

import '../../models/meal_model.dart';

class DetailsTopingSection extends StatelessWidget {
  const DetailsTopingSection({
    super.key, required this.meals,
  });

  final List<MealModel> meals;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF242731),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const Text(
            "Toppings for you",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: SizedBox(
              height: 150,
              child: IngredientListWidget(ingredients: meals),
            ),
          ),
        ],
      ),
    );
  }
}

class IngredientListWidget extends StatelessWidget {
  const IngredientListWidget({super.key, required this.ingredients});

  final List<MealModel> ingredients;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return IngredientItemWidget(ingredient: ingredients[index]);
        },
      ),
    );
  }
}

class IngredientItemWidget extends StatelessWidget {
  const IngredientItemWidget({super.key, required this.ingredient});
  final MealModel ingredient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              ingredient.image,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 8),
            Text(
              ingredient.mealName,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Icon(
              Icons.circle,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

