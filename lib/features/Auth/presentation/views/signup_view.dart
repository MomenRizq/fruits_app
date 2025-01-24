import 'package:flutter/material.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/features/Auth/presentation/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/Auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(context, title: "حساب جديد"),
        body: Builder(builder: (context) {
          return BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccess) {
              } else if (state is SignupFairlure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is SignupLoading ? true : false,
                  child: SignupViewBody());
            },
          );
        }),
      ),
    );
  }
}
