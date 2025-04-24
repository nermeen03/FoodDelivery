import 'package:flutter/material.dart';

class ItemCost extends StatefulWidget {
  const ItemCost({super.key});

  @override
  State<ItemCost> createState() => _ItemCostState();
}
class _ItemCostState extends State<ItemCost> {
  var total = 12;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,

      children: [
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20)),
            Text("Subtotal",style: TextStyle(color: Colors.black,fontSize: 24),),
            Padding(padding: EdgeInsets.only(left: 240)),
            Text("$total",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
          ],
        ),
        const Divider(thickness: 1, color: Colors.grey),
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20)),
            Text("Tax and Fees",style: TextStyle(color: Colors.black,fontSize: 24),),
            Padding(padding: EdgeInsets.only(left: 190)),
            Text("$total",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
          ],
        ),
        const Divider(thickness: 1, color: Colors.grey),
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20)),
            Text("Delivery",style: TextStyle(color: Colors.black,fontSize: 24),),
            Padding(padding: EdgeInsets.only(left: 250)),
            Text("$total",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
          ],
        ),
      ],
    );
  }
}