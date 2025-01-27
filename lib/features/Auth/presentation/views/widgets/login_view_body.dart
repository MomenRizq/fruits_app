import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constant.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_password_field.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/features/Auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_app/features/Auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/social_login_button.dart';

import '../signup_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email , password;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (value){
                  email = value!;
                },
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              PasswordField(
                onSaved: (value){
                  password = value!;
                },
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
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signInWithEmailAndPassword(email, password);
                  }else {
                    _autovalidateMode = AutovalidateMode.always;
                    setState(() {});

                  }    

                },
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
