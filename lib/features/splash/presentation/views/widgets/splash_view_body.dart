import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/constant.dart';
import 'package:fruits_app/core/services/firebase_auth_service.dart';
import 'package:fruits_app/core/services/shared_preference_singleton.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/features/Auth/presentation/views/login_view.dart';
import 'package:fruits_app/features/Home/presentation/views/home_view.dart';
import 'package:fruits_app/features/onboarding/presentation/views/onboaring_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    
    excuteNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imgPlanet),
          ],
        ),
        SvgPicture.asset(Assets.imgLogo),
        SvgPicture.asset(Assets.imgBottomSplash),
      ],
    );
  }
  
  void excuteNavigation() {

    bool isOnBoardingViewSeen = Prefs.getBool(KIsSeenOnBoardView);
    Future.delayed(const Duration(seconds: 3), () {
      if(isOnBoardingViewSeen){var isLoggedIn = FirebaseAuthService().isLoggedIn();
 
         if (isLoggedIn) {
           Navigator.pushReplacementNamed(context, LoginView.routeName);
         } else {
           Navigator.pushReplacementNamed(context, LoginView.routeName);
         }
      }
      else{
      Navigator.pushReplacementNamed(context, OnboaringView.routeName);
      }
    });
  }
}