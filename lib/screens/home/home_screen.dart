import 'package:comida_food_delivery_app/models/category_list_model.dart';
import 'package:comida_food_delivery_app/models/meal_details_model.dart';
import 'package:comida_food_delivery_app/models/meal_model.dart';
import 'package:comida_food_delivery_app/utils/services/api_end_point.dart';
import 'package:comida_food_delivery_app/utils/services/network_service.dart';
import 'package:comida_food_delivery_app/widgets/home/home_meal_list_widget.dart';
import 'package:comida_food_delivery_app/widgets/home/home_restaurant_list_widget.dart';
import 'package:comida_food_delivery_app/widgets/home/home_search_section.dart';
import 'package:comida_food_delivery_app/widgets/home/home_special_offer_list_widget.dart';
import 'package:comida_food_delivery_app/widgets/home/home_text_section.dart';
import 'package:comida_food_delivery_app/widgets/home/home_top_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/categories_model.dart';
import 'home_screen_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<MealModel>? categoriesData;
  List<MealModel>? categoryData;

  @override
  void initState() {
    super.initState();
  }
  void _loadCategories() async {

    final result = await MealsService.fetchData(path:ApiEndPoint.categories);
    if (result.success) {
      CategoriesModel categoriesModel = CategoriesModel.fromJson(result.data);
        List<Categories>? categories = categoriesModel.categories;
        if (categories != null) {
          categoriesData = [];
          for (var cat in categories) {
            categoriesData!.add(MealModel(image: cat.strCategoryThumb ?? "", mealName: cat.strCategory ?? ""));
          }
          loadCategoryList(categories[0].strCategory!);
        }
    } else {
      print("Error: ${result.message}");
    }
  }
  void loadCategoryList(String categoryName) async {
    final result = await MealsService.fetchData(path:ApiEndPoint.categoryList,category: categoryName);
    if (result.success) {
      CategoryListModel categoriesList = CategoryListModel.fromJson(result.data);
      setState(() {
        List<Meals>? mealsList = categoriesList.meals;
        if (mealsList != null) {
          categoryData = [];
          for (var meals in mealsList) {
            categoryData!.add(MealModel(image: meals.strMealThumb??"",mealName: meals.strMeal??"",mealId: meals.idMeal));
          }
        }
      });
    } else {
      print("Error: ${result.message}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: TopSection(),
          ),
        ),
        body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            if(state is HomeScreenLoading){
              return const Center(child: CircularProgressIndicator());
            }else if (state is HomeScreenListLoaded ) {
              final model = state.categoriesModel;
              final categories = state.categoriesModel?.categories;
              final meals = state.categoriesList.meals;

              print("object");
              if (categories != null && meals != null) {
                final categoriesData = categories
                    .map((cat) => MealModel(
                  image: cat.strCategoryThumb ?? "",
                  mealName: cat.strCategory ?? "",
                ))
                    .toList();

                final categoryData = meals
                    .map((meal) => MealModel(
                  image: meal.strMealThumb ?? "",
                  mealName: meal.strMeal ?? "",
                  mealId: meal.idMeal,
                ))
                    .toList();

                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: SearchSection()),
                    MealListWidget(
                      meals: categoriesData,
                      onTap: (categoryName) {
                        context.read<HomeScreenCubit>().loadCategoryList(categoryName: categoryName,cateory: model);
                      },
                    ),
                    const SliverToBoxAdapter(child: TextSection(txt: "Special Offers")),
                    SpecialOfferListWidget(meals: categoryData),
                    const SliverToBoxAdapter(child: Padding(padding: EdgeInsets.only(top: 15))),
                    const SliverToBoxAdapter(child: TextSection(txt: "Restaurant")),
                    RestaurantListWidget(),
                  ],
                );
              }
            } else if (state is HomeScreenFailed) {
              print('Error: ${state.message}');
              return Center(child: Text('Error: ${state.message}'));
            }

            return const Center(child: CircularProgressIndicator());
          })

      ),
    );
  }
}





















