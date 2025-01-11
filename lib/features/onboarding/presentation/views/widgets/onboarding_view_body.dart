import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/constant.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingPageView(),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor.withAlpha(120),
          ),
        ),
        const SizedBox(
          height: 29,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizintalPadding,
          ),
          child: CustomButton(
            onPressed: () {},
            text: 'ابدأ الان',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
      ],
    );
  }
}
