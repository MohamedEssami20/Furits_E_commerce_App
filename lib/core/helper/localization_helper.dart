import 'package:flutter/material.dart';
import 'package:fruits_hub/generated/l10n.dart';

class LocalizationHelper {
  static final Map<String, String Function(BuildContext)> _authErrorMap = {
    'auth_userMismatch': (context) => S.of(context).auth_userMismatch,
    'auth_userNotFound': (context) => S.of(context).auth_userNotFound,
    'auth_emailAlreadyInUse': (context) => S.of(context).auth_emailAlreadyInUse,
    'auth_invalidCredential': (context) => S.of(context).auth_invalidCredential,
    'auth_invalidEmail': (context) => S.of(context).auth_invalidEmail,
    'auth_wrongPassword': (context) => S.of(context).auth_wrongPassword,
    'auth_invalidVerificationCode': (context) =>
        S.of(context).auth_invalidVerificationCode,
    'auth_invalidVerificationId': (context) =>
        S.of(context).auth_invalidVerificationId,
    'auth_requiresRecentLogin': (context) =>
        S.of(context).auth_requiresRecentLogin,
    'auth_missingAndroidPkgName': (context) =>
        S.of(context).auth_missingAndroidPkgName,
    'auth_missingContinueUri': (context) =>
        S.of(context).auth_missingContinueUri,
    'auth_missingIosBundleId': (context) =>
        S.of(context).auth_missingIosBundleId,
    'auth_invalidContinueUri': (context) =>
        S.of(context).auth_invalidContinueUri,
    'auth_unauthorizedContinueUri': (context) =>
        S.of(context).auth_unauthorizedContinueUri,
    'auth_unexpectedError': (context) => S.of(context).auth_unexpectedError,
  };

  static String getAuthErrorMessage(BuildContext context, String messageKey) {
    return _authErrorMap[messageKey]?.call(context) ??
        S.of(context).auth_unexpectedError;
  }

  static final Map<String, String Function(BuildContext)> _appleErrorMap = {
    'apple_not_supported': (context) => S.of(context).apple_not_supported,
    'apple_canceled': (context) => S.of(context).apple_canceled,
    'apple_failed': (context) => S.of(context).apple_failed,
    'apple_invalid_response': (context) => S.of(context).apple_invalid_response,
    'apple_not_handled': (context) => S.of(context).apple_not_handled,
    'apple_not_interactive': (context) => S.of(context).apple_not_interactive,
    'apple_unknown': (context) => S.of(context).apple_unknown,
    'apple_credentials_error': (context) =>
        S.of(context).apple_credentials_error,
  };

  static String getAppleErrorMessage(BuildContext context, String messageKey) {
    return _appleErrorMap[messageKey]?.call(context) ??
        S.of(context).apple_unknown;
  }

  // create static map that get tarnslation of firebase exceptions;
  static final Map<String, String Function(BuildContext)> _firebaseErrorMap = {
    // Firestore specific errors
    'firebase_cancelled': (context) => S.of(context).firebase_cancelled,
    'firebase_unknown': (context) => S.of(context).firebase_unknown,
    'firebase_invalid_argument': (context) =>
        S.of(context).firebase_invalid_argument,
    'firebase_deadline_exceeded': (context) =>
        S.of(context).firebase_deadline_exceeded,
    'firebase_not_found': (context) => S.of(context).firebase_not_found,
    'firebase_already_exists': (context) =>
        S.of(context).firebase_already_exists,
    'firebase_permission_denied': (context) =>
        S.of(context).firebase_permission_denied,
    'firebase_resource_exhausted': (context) =>
        S.of(context).firebase_resource_exhausted,
    'firebase_failed_precondition': (context) =>
        S.of(context).firebase_failed_precondition,
    'firebase_aborted': (context) => S.of(context).firebase_aborted,
    'firebase_out_of_range': (context) => S.of(context).firebase_out_of_range,
    'firebase_unimplemented': (context) => S.of(context).firebase_unimplemented,
    'firebase_internal': (context) => S.of(context).firebase_internal,
    'firebase_unavailable': (context) => S.of(context).firebase_unavailable,
    'firebase_data_loss': (context) => S.of(context).firebase_data_loss,
    'firebase_unauthenticated': (context) =>
        S.of(context).firebase_unauthenticated,

    // Storage errors
    'firebase_object_not_found': (context) =>
        S.of(context).firebase_object_not_found,
    'firebase_bucket_not_found': (context) =>
        S.of(context).firebase_bucket_not_found,
    'firebase_project_not_found': (context) =>
        S.of(context).firebase_project_not_found,
    'firebase_quota_exceeded': (context) =>
        S.of(context).firebase_quota_exceeded,
    'firebase_unauthorized': (context) => S.of(context).firebase_unauthorized,

    // Default
    'firebase_unexpected_error': (context) =>
        S.of(context).firebase_unexpected_error,
  };

  static String getFirebaseErrorMessage(
      BuildContext context, String messageKey) {
    return _firebaseErrorMap[messageKey]?.call(context) ??
        S.of(context).firebase_unexpected_error;
  }
}
