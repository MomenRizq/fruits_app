import 'package:flutter/material.dart';
import 'package:fruits_app/features/Auth/presentation/views/login_view.dart';
import 'package:fruits_app/features/Auth/presentation/views/signup_view.dart';
import 'package:fruits_app/features/best_selling/view/best_selling_view.dart';
import 'package:fruits_app/features/onboarding/presentation/views/onboaring_view.dart';
import 'package:fruits_app/features/splash/presentation/views/splash_view.dart';

import '../../features/Home/presentation/views/home_view.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) 
{

switch (settings.name) {
  case SplashView.routeName:
    return MaterialPageRoute(builder: (_) => const SplashView()); 

  case LoginView.routeName:
    return MaterialPageRoute(builder: (_) => const LoginView()); 

  case SignUpView.routeName:
    return MaterialPageRoute(builder: (_) => const SignUpView()); 
  
  case OnboaringView.routeName:
    return MaterialPageRoute(builder: (_) => const OnboaringView());

  case HomeView.routeName:
    return MaterialPageRoute(builder: (_) => const HomeView());

  case BestSellingView.routeName:
    return MaterialPageRoute(builder: (_) => const BestSellingView());

  default:
    return MaterialPageRoute(builder: (_) => const Scaffold());
}

}
