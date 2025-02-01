import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/Auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo ;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    final result =
        await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
        (failure) => emit(
              SigninFairlure(message: failure.message),
            ),
        (userEntity) => emit(
              SigninSuccess(userEntity: userEntity),
            )); //if success emit this state and pass the user to UI
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
        (failure) => emit(
              SigninFairlure(message: failure.message),
            ),
        (userEntity) => emit(
              SigninSuccess(userEntity: userEntity),
            )); //if success emit this state and pass the user to UI
  }
}
