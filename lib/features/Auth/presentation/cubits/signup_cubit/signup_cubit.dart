import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/Auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
        (failure) => emit(
              SignupFairlure(message: failure.message),
            ),
        (userEntity) => emit(
              SignupSuccess(userEntity: userEntity),
            )); //if success emit this state and pass the user to UI
  }
}
