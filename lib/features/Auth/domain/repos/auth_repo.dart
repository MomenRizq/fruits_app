import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/faluire.dart';
import 'package:fruits_app/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password , String name);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

    Future<Either<Failure, UserEntity>> signInWithGoogle();

    Future<Either<Failure, UserEntity>> signInWithFacebook();

    Future addUserData({required UserEntity userEntity});

    Future <UserEntity> getUserData({required String uid});

    Future saveUserData({required UserEntity user});

      
}
