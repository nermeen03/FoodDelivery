import 'package:comida_food_delivery_app/widgets/Cart/cart_list_widget.dart';
import 'package:comida_food_delivery_app/widgets/Cart/cart_delivery_details.dart';
import 'package:comida_food_delivery_app/widgets/Cart/cart_item_cost.dart';
import 'package:comida_food_delivery_app/widgets/Cart/cart_promo_code.dart';
import 'package:comida_food_delivery_app/widgets/Cart/cart_top_section.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: TopSection(),
        ),
      ),
      body: Column(children: [
        CardListWidget(),
        Padding(padding: EdgeInsets.only(top: 20)),
        PromoCode(),
        Padding(padding: EdgeInsets.only(top: 50)),
        ItemCost(),
        Padding(padding: EdgeInsets.only(top: 20)),
        DeliveryDetails(),
      ],)
    );
  }

}












