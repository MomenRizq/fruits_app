import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper_functions/on_generate_route.dart';
import 'package:fruits_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}