import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../routes/app_routes.dart';
import '../../screens/splash/auth_check_cubit.dart';

class SplashImageText extends StatelessWidget {
  const SplashImageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCheckCubit, AuthCheckState>(
      builder: (context, state) => Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context,  AppRoutes.homeScreen);

                // if(state is Authenticated){
                //   Navigator.pushNamed(context,  AppRoutes.homeScreen);
                // }else{
                //   Navigator.pushNamed(context,  AppRoutes.onBoardingScreen);
                // }
              }, child: Image.asset("assets/images/img.png",width: 187.99,height: 187.99,)),
          Text(
            "Comida",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      )),
    );
  }
}