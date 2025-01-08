import 'package:flutter/material.dart';
import 'package:fruits_app/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboaringView extends StatelessWidget {
  const OnboaringView({super.key});
  static const routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnboardingViewBody()));
  }
}
