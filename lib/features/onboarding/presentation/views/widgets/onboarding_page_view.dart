import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/features/onboarding/presentation/views/widgets/page_view_item.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView(
      children: [
        PageViewItem(
            image: Assets.imgItem1OnboardingImg,
            backgroundImage: Assets.imgBG1OnboardingImg,
            subTitle: "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
            title: Row(
              children: [
                Text("مرحبًا بك في"),
                Text("Fruit"),
                Text("HUB"),

              ],
            )
             )
      ],
    ));
  }
}
