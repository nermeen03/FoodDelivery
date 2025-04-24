import 'package:comida_food_delivery_app/screens/food_details_screen.dart';
import 'package:comida_food_delivery_app/routes/routes_generator.dart';
import 'package:comida_food_delivery_app/routes/app_routes.dart';
import 'package:comida_food_delivery_app/screens/home/home_screen.dart';
import 'package:comida_food_delivery_app/screens/splash/auth_check_cubit.dart';
import 'package:comida_food_delivery_app/screens/splash/splash_screen.dart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        startLocale: Locale('en'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: RoutesGenerator.generator,
      home: BlocProvider(create: (_) => AuthCheckCubit(),
        child: SplashScreen(),)
    );
  }
}

