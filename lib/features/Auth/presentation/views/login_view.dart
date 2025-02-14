import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/features/Auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/services/get_it_services.dart';
import '../../../../core/widgets/custom_snackBar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
          appBar: CustomAppBar(context, title: "تسجيل الدخول"),
          body: BlocConsumer<SigninCubit, SigninState>(
            listener: (context, state) {
              if (state is SigninSuccess) {
                CustomSnackBar(context, "تم تسجيل الدخول بنجاح" , color: Colors.green);
               
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              }if(state is SigninFairlure){
                CustomSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is SigninLoading ? true : false, 
                child: LoginViewBody());
            },
          )),
    );
  }
}
