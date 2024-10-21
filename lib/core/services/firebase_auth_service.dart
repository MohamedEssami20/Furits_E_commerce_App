import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';

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
      if (e.code == 'weak-password') {
        throw CustomException(errorMessage: "كلمة المرور ضعيفة");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(errorMessage: "البريد الالكتروني مستخدم بالفعل");
      } else {
        throw CustomException(
            errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى");
      }
    } catch (e) {
      throw CustomException(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى");
    }
  }
}
