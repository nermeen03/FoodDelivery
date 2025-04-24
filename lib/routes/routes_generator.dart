import 'package:comida_food_delivery_app/screens/cart/cart_cu_cubit.dart';
import 'package:comida_food_delivery_app/screens/cart/cart_screen.dart';
import 'package:comida_food_delivery_app/screens/food_details_screen.dart';
import 'package:comida_food_delivery_app/screens/home/home_screen_cubit.dart';
import 'package:comida_food_delivery_app/screens/log_in_screen.dart';
import 'package:comida_food_delivery_app/screens/onboarding_screen.dart';
import 'package:comida_food_delivery_app/screens/sign_up_screen.dart';
import 'package:comida_food_delivery_app/screens/splash/splash_screen.dart.dart';
import 'package:comida_food_delivery_app/routes/app_routes.dart';
import 'package:comida_food_delivery_app/utils/services/api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/home_screen.dart';
import '../screens/splash/auth_check_cubit.dart';

class RoutesGenerator{
  static Route generator(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen() );
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnBoarding() );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => BlocProvider(create: (_) => HomeScreenCubit(ApiRepository())..fetchData()
          ,child: HomeScreen(),));
      case AppRoutes.detail:
        return MaterialPageRoute(builder: (context) => FoodDetails() );
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (context) => BlocProvider(create: (_) => CartCubit()..fetchFavMeals()
          ,child: CartScreen(),));
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (context) => Signup() );
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => Login() );
      default:
        return MaterialPageRoute(builder: (context) => Scaffold() );
    }
  }
}