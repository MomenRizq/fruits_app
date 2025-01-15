import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/constant.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title, required this.isvisible});

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isvisible ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                backgroundImage,
                fit: BoxFit.fill,
              )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    image,
                  )),
              Visibility(
                visible: isvisible,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("تخط",
                     style: TextStyles.regular13.copyWith(
                        color: const Color(0xFF949D9E),
                      ),),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 64,
        ),
        title,
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
             style: TextStyles.semiBold13.copyWith(
              color: const Color(0xFF4E5456),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
