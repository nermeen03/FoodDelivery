import 'package:flutter/material.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}
class _DeliveryDetailsState extends State<DeliveryDetails> {
  var total = 20;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      child: Column(
        spacing: 10,
        children: [
          Text("Delivery Address",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          Text("Avinguda Meridiana, 350, 358, 08027 Barcelona",style: TextStyle(color: Colors.black,fontSize: 23),),
          Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Row(spacing: 10,
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Text("Total",style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
                Text("$total",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                Padding(padding: EdgeInsets.only(left: 80)),
                ElevatedButton(onPressed: (){},style:
                ButtonStyle(backgroundColor: WidgetStateProperty.all(Color(0xFFE54630))),
                  child: Text("Go to Checkout",style: TextStyle(color: Colors.white,fontSize: 20),),),

              ],),
          )
        ],),
    );
  }
}