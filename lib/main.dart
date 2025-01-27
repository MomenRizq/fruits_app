import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_app/core/helper_functions/on_generate_route.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
import 'package:fruits_app/core/services/shared_preference_singleton.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_app/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/widgets/custom_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver(); 
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await Prefs.init();
  setupGetIt();
  runApp(FruitsHub());
  
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.getFont("Cairo").fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: Colors.white
      
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
