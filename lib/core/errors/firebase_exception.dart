import 'package:firebase_core/firebase_core.dart';
import 'package:fruits_hub/core/errors/failure.dart';

class FirebaseExceptionHandler extends Failure {
  FirebaseExceptionHandler({required super.errorMessage});

  // create factory method;
  factory FirebaseExceptionHandler.fromFirebaseException(
      FirebaseException exception) {
    return FirebaseExceptionHandler(errorMessage: getErrorKey(exception));
  }

  static String getErrorKey(FirebaseException exception) {
    switch (exception.code) {
      // Firestore specific errors
      case 'cancelled':
        return 'firebase_cancelled';
      case 'unknown':
        return 'firebase_unknown';
      case 'invalid-argument':
        return 'firebase_invalid_argument';
      case 'deadline-exceeded':
        return 'firebase_deadline_exceeded';
      case 'not-found':
        return 'firebase_not_found';
      case 'already-exists':
        return 'firebase_already_exists';
      case 'permission-denied':
        return 'firebase_permission_denied';
      case 'resource-exhausted':
        return 'firebase_resource_exhausted';
      case 'failed-precondition':
        return 'firebase_failed_precondition';
      case 'aborted':
        return 'firebase_aborted';
      case 'out-of-range':
        return 'firebase_out_of_range';
      case 'unimplemented':
        return 'firebase_unimplemented';
      case 'internal':
        return 'firebase_internal';
      case 'unavailable':
        return 'firebase_unavailable';
      case 'data-loss':
        return 'firebase_data_loss';
      case 'unauthenticated':
        return 'firebase_unauthenticated';

      // Storage errors
      case 'object-not-found':
        return 'firebase_object_not_found';
      case 'bucket-not-found':
        return 'firebase_bucket_not_found';
      case 'project-not-found':
        return 'firebase_project_not_found';
      case 'quota-exceeded':
        return 'firebase_quota_exceeded';
      case 'unauthorized':
        return 'firebase_unauthorized';

      default:
        return 'firebase_unexpected_error';
    }
  }
}
