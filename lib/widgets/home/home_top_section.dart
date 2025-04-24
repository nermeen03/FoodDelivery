import 'package:comida_food_delivery_app/storage/shared_preference.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: SizedBox(height: 60,child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.cart);
                },
                child: Icon(Icons.menu)),
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Deliver to", style: TextStyle(fontSize: 10)),
                Text("place", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ],
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                SharedPreference.clear();
                Navigator.pushNamed(context, AppRoutes.onBoardingScreen);

              },
              child: Icon(Icons.person),
            ),
          )

        ],
      ),),
    );
  }
}