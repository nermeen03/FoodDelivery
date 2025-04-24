import 'package:flutter/material.dart';

import '../../models/meal_model.dart';
import '../../storage/cart_database.dart';

class CounterSection extends StatefulWidget {
  const CounterSection({super.key,required this.mealInfo,});
  final MealModel mealInfo;

  @override
  State<CounterSection> createState() => _CounterSectionState(mealInfo: mealInfo);
}

class _CounterSectionState extends State<CounterSection> {
  var counter = 0;
  MealModel mealInfo;

  _CounterSectionState({required this.mealInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [

        RawMaterialButton(
          onPressed: () {
            setState(() {
              if (counter > 0) counter--;
            });
          },
          fillColor: Colors.grey,
          constraints: BoxConstraints.tight(Size(20, 20)),
          shape: const CircleBorder(),
          child: Image.asset(
            "assets/images/img_9.png",
            color: Colors.black,
            width: 10,
            height: 10,
          ),
        ),

        Text("$counter",style: TextStyle(
            fontSize: 16,color: Colors.white),
        ),
        RawMaterialButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          fillColor: Colors.grey,
          constraints: BoxConstraints.tight(Size(20, 20)),
          shape: const CircleBorder(),
          child: Image.asset(
            "assets/images/img_10.png",
            color: Colors.black,
            width: 10,
            height: 10,
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 20)),
        ElevatedButton(
          onPressed: () async {
            var result = await CartDBHelper().insert(mealInfo);
            if(result>0){
              print("Done insertion");
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Added $counter item(s) to basket - \$${(11.18 * counter).toStringAsFixed(2)}"),
                  duration: Duration(seconds: 2),
                ),);
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Color(0xFFFF6B57)),
          ),
          child: Text(
            "Add $counter to basket ${11.18*counter}",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],);
  }
}