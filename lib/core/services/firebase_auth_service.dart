import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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

  // create method that deletes user;
  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
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
    if (googleUser == null) {
      throw CustomException(errorMessage: "تم إلغاء تسجيل الدخول");
    }
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user!;
  }

  //create sigin method with facebook
  Future<User> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    final OAuthCredential credential = FacebookAuthProvider.credential(
      result.accessToken!.tokenString,
    );
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user!;
  }

  //create sigin method with apple;
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    return userCredential.user!;
  }

  // create method that check if user is authenticated
  bool isUserAuthenticated() {
    return FirebaseAuth.instance.currentUser != null;
  }

  // create method that sign out user
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // create method that send reset password link
  Future<void> sendPasswordResetEmail({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  // create method that update passqord
  Future<void> updatePassword({required String newPassword}) async {
    await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
  }

  // create methodt that get current user;
  String? getCurrentUser() => FirebaseAuth.instance.currentUser!.uid;

  // create method that make reAuth
  Future<void> reAuth({required String email, required String password}) async {
    await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
  }

  // create method that update email
  Future<void> updateEmail({required String email}) async {
    await FirebaseAuth.instance.currentUser!.verifyBeforeUpdateEmail(email);
  }
}
