import 'package:flutter/material.dart';
import 'package:fruits_hub/generated/l10n.dart';

class LocalizationHelper {
  static final Map<String, String Function(BuildContext)> _authErrorMap = {
    'auth_userMismatch': (context) => S.of(context).auth_userMismatch,
    'auth_userNotFound': (context) => S.of(context).auth_userNotFound,
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
}
