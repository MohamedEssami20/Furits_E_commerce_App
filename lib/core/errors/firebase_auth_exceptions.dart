import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/failure.dart';

class FirebaseAuthErrorHandler extends Failure {
  FirebaseAuthErrorHandler({required super.errorMessage});

  // create factory constructor that returns an instance of the class;
  factory FirebaseAuthErrorHandler.fromFirebaseAuthException(
          FirebaseAuthException e) =>
      FirebaseAuthErrorHandler(
        errorMessage: getErrorMessage(e),
      );
  static String getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-mismatch':
        return 'بيانات تسجيل الدخول لا تتطابق مع المستخدم الحالي.';
      case 'user-not-found':
        return 'لا يوجد مستخدم مسجل بهذه البيانات.';
      case 'invalid-credential':
        return 'كلمة المرور الحالية غير صحيحة.';
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح.';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة.';
      case 'invalid-verification-code':
        return 'رمز التحقق غير صحيح.';
      case 'invalid-verification-id':
        return 'معرّف التحقق غير صالح.';
      case 'requires-recent-login':
        return 'لأسباب أمان، يجب تسجيل الدخول مرة أخرى قبل تنفيذ هذه العملية.';
      case 'missing-android-pkg-name':
        return 'يجب توفير اسم الحزمة (Package Name) لتطبيق أندرويد إذا كان مطلوب تثبيت التطبيق.';
      case 'missing-continue-uri':
        return 'يجب توفير رابط متابعة (Continue URL) في الطلب.';
      case 'missing-ios-bundle-id':
        return 'يجب توفير iOS Bundle ID إذا تم توفير App Store ID.';
      case 'invalid-continue-uri':
        return 'رابط المتابعة (Continue URL) غير صالح.';
      case 'unauthorized-continue-uri':
        return 'النطاق الخاص برابط المتابعة غير مضاف إلى قائمة النطاقات المصرح بها في وحدة تحكم Firebase.';
      default:
        return 'حدث خطأ غير متوقع. حاول مرة أخرى.';
    }
  }
}
