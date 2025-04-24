import 'package:comida_food_delivery_app/models/meal_model.dart';
import 'package:comida_food_delivery_app/screens/cart/cart_cu_cubit.dart';
import 'package:comida_food_delivery_app/storage/cart_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CardListWidget extends StatefulWidget {
  const CardListWidget({super.key});

  @override
  State<CardListWidget> createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {

  List<MealModel> meals = [];

  @override
  void initState() {
    super.initState();
    /*_loadMeals();*/
  }
/*
  void _loadMeals() async {
    meals = await CartDBHelper().getAll();
    setState(() {});
  }*/



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state){
          if(state is CartLoad){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is CartSuccess){
            meals = state.favMeals;
            return ListView.builder(itemBuilder: (context, index) => CardItemWidget(meal: meals[index],
              onDelete: () {
                context.read<CartCubit>().delete(meals[index].mealId!);
              },
            ),itemCount:
            meals.length);
          }else if (state is CartFail){
            return Text("fail");
          }else{
            return Text("else");
          }

        }));
      /*
      */

  }
}
class CardItemWidget extends StatefulWidget {
  const CardItemWidget({
    super.key,
    required this.meal,
    required this.onDelete,
  });

  final MealModel meal;
  final VoidCallback onDelete;

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  var counter = 0;

  delete(String id) {

    widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => delete(widget.meal.mealId!),
      child: Card(
        color: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          margin: EdgeInsets.all(5),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(widget.meal.image, width: 150, height: 150),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.meal.mealName, maxLines: 1,style: TextStyle(fontSize: 24),),
                    Text("$counter", style: TextStyle(fontSize: 20, color: Colors.orange)),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                  onTap: () async {
                    await delete(widget.meal.mealId!);
                    },
                      child: Icon(Icons.highlight_remove)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          fontSize: 16,color: Colors.orange),
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