import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  // create an signup method that takes email and password ;
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
      log("Exception in Firebase Auth service= ${e.toString()} and  e.code=${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(errorMessage: "كلمة المرور ضعيفة");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(errorMessage: "البريد الالكتروني مستخدم بالفعل");
      } else if (e.code == 'network-request-failed') {
        throw CustomException(errorMessage: "تأكد من اتصالك بالانترنت");
      } else {
        throw CustomException(
            errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى");
      }
    } catch (e) {
      log("Exception in Firebase Auth service= ${e.toString()}");
      throw CustomException(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى");
    }
  }

//create signin method that takes email and password;
  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(
            errorMessage: "البريد الالكتروني أو كلمة المرور غير صحيحة");
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            errorMessage: "البريد الالكتروني أو كلمة المرور غير صحيحة");
      } else if (e.code == 'network-request-failed') {
        throw CustomException(errorMessage: "تأكد من اتصالك بالانترنت");
      } else {
        throw CustomException(
            errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى");
      }
    } catch (e) {
      log("Exception in Firebase Auth service= ${e.toString()}");
      throw CustomException(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى");
    }
  }

  //create google sign in method
  Future<User> signInWithGoogle() async {
  
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user!;
  }
}
