import 'package:flutter/material.dart';

import '../../models/meal_model.dart';
import '../../routes/app_routes.dart';
import '../../screens/food_details_screen.dart';
import '../../screens/food_details_screen2.dart';

class SpecialOfferListWidget extends StatelessWidget {
  const SpecialOfferListWidget({super.key,required this.meals});

  final List<MealModel> meals;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return SpecialOfferItemWidget(meal: meals[index]);
          },
        ),
      ),
    );
  }
}
class SpecialOfferItemWidget extends StatelessWidget {
  const SpecialOfferItemWidget({super.key, required this.meal});
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetails(),
            settings: RouteSettings(arguments: meal),
          ),
        );*/
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Container(
              height: 751,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: FoodDetails2(mealModel: meal),
            );
          },
        );
      },
      child: Card(
        color: Colors.red,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: 360,
          height: 110,
          child: Row(
            spacing: 15,
            children: [
              Padding(padding: EdgeInsets.only(left: 1)),
              Image.network(
                meal.image,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.star, size: 16, color: Colors.orange),
                      SizedBox(width: 4),
                      Text("4.5", style: TextStyle(fontSize: 15)),
                    ],
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        meal.mealName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.local_shipping, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("Free delivery",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 10,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color(0xFFE54630))),
                        onPressed: () {},
                        child: const Text("Buy Now",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                      ),
                      Text(
                        "\$${meal.price?.toStringAsFixed(2) ?? "0.00"}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}