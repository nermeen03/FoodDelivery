import 'package:flutter/material.dart';

import '../../models/meal_model.dart';

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({super.key});

  final List<MealModel> meals = const [
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger',price: 20.0),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),
    MealModel(image: "assets/images/img_3.png", mealName: 'Burger'),

  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 350,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return RestaurantItemWidget(meal: meals[index]);
          },
        ),
      ),
    );
  }
}
class RestaurantItemWidget extends StatelessWidget {
  const RestaurantItemWidget({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "");
      },
      child: Card(
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            margin: const EdgeInsets.all(10),
            width: 350,
            height: 400,
            child: Card(
                child: Column(
                  spacing: 10,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/img_6.png",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        meal.mealName,
                        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),
                      ),

                      Padding(padding: EdgeInsets.only(left: 150)),
                      Row(
                        children: const [
                          Icon(Icons.star, size: 16, color: Colors.orange),
                          SizedBox(width: 4),
                          Text("4.5",style: TextStyle(fontSize: 15),),
                        ],
                      ),

                    ],),
                    Row(
                      spacing: 5,
                      children: const [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Icon(Icons.local_shipping, size: 16,color: Colors.grey,),
                        SizedBox(width: 4),
                        Text("Free delivery",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey)),
                        Padding(padding: EdgeInsets.only(left: 100)),
                        Icon(Icons.alarm, size: 16,color: Colors.grey,),
                        SizedBox(width: 4),
                        Text("45 min",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey)),
                      ],
                    ),
                  ],
                )
            )
        ),
      ),
    );
  }
}