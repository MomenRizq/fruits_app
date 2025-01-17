import 'package:flutter/material.dart';
import 'package:fruits_app/core/constant.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/terms_and_condition.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          spacing: 16,
          children: [
            SizedBox(height: 20),
            CustomTextFormField(
              hintText: "الاسم كامل",
              textInputType: TextInputType.name,
            ),
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
            TermsAndConditionsWidget(),
            SizedBox(height: 16),
            CustomButton(onPressed: () {}, text: "إنشاء حساب جديد"),
            HaveAnAccountWidget(
                firstWord: "لديك حساب بالفعل",
                secondWord: 'تسجيل الدخول',
                onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
