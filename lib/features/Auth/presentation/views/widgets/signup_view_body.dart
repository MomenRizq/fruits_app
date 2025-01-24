import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/constant.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/features/Auth/presentation/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/terms_and_condition.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, name, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            spacing: 16,
            children: [
              SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: "الاسم كامل",
                textInputType: TextInputType.name,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: "كلمة المرور",
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
              ),
              TermsAndConditionsWidget(),
              SizedBox(height: 16),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                              email, password, name);
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: "إنشاء حساب جديد"),
              HaveAnAccountWidget(
                  firstWord: "لديك حساب بالفعل",
                  secondWord: 'تسجيل الدخول',
                  onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}
