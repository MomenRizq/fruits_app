import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exception.dart';

class FirebaseAuthService {

    Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Eception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة ');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد تم استخدام هذا البريد الإلكتروني من قبل.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. يرجى المحاولة مرة أخرى.');
      }
    } catch (e) {
      log("Eception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");
      throw CustomException(
          message: 'لقد حدث خطأ ما. يرجى المحاولة مرة أخرى.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Eception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: "كلمة المرور أ, البريد الإلكتروني غير صحيح.");
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور أ, البريد الإلكتروني غير صحيح.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. يرجى المحاولة مرة أخرى.');
      }
    }
  }

  Future<User> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return  (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
}
}