import 'package:flutter/material.dart';
import 'package:fruits_app/core/constant.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/social_login_button.dart';

import '../signup_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hintText: "كلمة المرور",
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                onPressed: () {},
                text: 'تسجيل دخول',
              ),
              HaveAnAccountWidget(
                firstWord: 'لا تملك حساب؟',
                secondWord: "انشاء حساب",
                onTap: () {
                  Navigator.of(context).pushNamed(SignUpView.routeName);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const OrDivider(),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imgGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imgAppleIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imgFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
