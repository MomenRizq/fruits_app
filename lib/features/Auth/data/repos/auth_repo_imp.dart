import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/exception.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/utils/endpoint.dart';
import 'package:fruits_app/features/Auth/data/models/user_model.dart';
import 'package:fruits_app/features/Auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/faluire.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/entities/user_entity.dart';


class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices databaseServices;

  AuthRepoImpl({required this.databaseServices, required this.firebaseAuthService});

  
  @override
Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password , String name) async {
      User?  user ;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);

      var userEntity  =   UserEntity(uid: user.uid, email: email, name: name) ; 
      await addUserData(userEntity: userEntity); 
      return right(
       userEntity 
      );
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      log("Eception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}");
       if(user != null) await firebaseAuthService.deleteUser();
      return left(
        ServerFailure(
          'هناك خطأ ما يرجى المحاولة في وقت لاحق',
        ),
      );
    }
  }

  
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password) async{
        try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await  getUserData(uid: user.uid);
      return right(
       userEntity 
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log("Eception in AuthRepoImpl.loginWithEmailAndPassword: ${e.toString()}");
      return left(
        ServerFailure(
          'هناك خطأ ما يرجى المحاولة في وقت لاحق',
        ),
      );
    }
  } 

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async{
     User? user;
    try {
      user= await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseServices.checkIfDataExist(path: EndPoint.isUserExist, docId: user.uid);
      if(isUserExist)
      {
        await getUserData(uid: user.uid);
      }
      else{
await addUserData(userEntity: userEntity); 
      }
     
      return right(userEntity);

    } catch (e) {
       await deleteUser(user);
      log("Eception in AuthRepoImpl.signInWithGoogle: ${e.toString()}");
      return left(
        ServerFailure(
          'هناك خطأ ما يرجى المحاولة في وقت لاحق',
        ),
      );
    }
    
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async{
     User? user;
    try {
       user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
       await addUserData(userEntity: userEntity); 


      return right(
        userEntity
      );
    } catch (e) {
       await deleteUser(user);
      log("Eception in AuthRepoImpl.loginWithEmailAndPassword: ${e.toString()}");
      return left(
        ServerFailure(
          'هناك خطأ ما يرجى المحاولة في وقت لاحق',
        ),
      );
    }
    
  }
  
  @override
  Future addUserData({required UserEntity userEntity}) async{

  await databaseServices.addData(path: EndPoint.addUserData, data: userEntity.toMap() , docId: userEntity.uid); 
  }

  
  Future<void> deleteUser(User? user) async {
    if(user != null) await firebaseAuthService.deleteUser();
  }
  
  @override
  Future<UserEntity> getUserData({required String uid}) async{
    var userData = await databaseServices.getData(path: EndPoint.getUserData, docId: uid);
    return UserModel.fromJson(userData);
  }

  

}