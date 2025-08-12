import 'package:dio/dio.dart';
import 'package:fruits_hub/core/errors/failure.dart';

class ApiServerErrors extends Failure {
  final String message;
  ApiServerErrors(this.message) : super(errorMessage: message);

  factory ApiServerErrors.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ApiServerErrors("Connection Time out error, try later.");
      case DioExceptionType.receiveTimeout:
        return ApiServerErrors("Receive time out error, try later.");
      case DioExceptionType.sendTimeout:
        return ApiServerErrors("Send time out, try later.");
      case DioExceptionType.badCertificate:
        return ApiServerErrors("Bad certificate error, try later.");
      case DioExceptionType.connectionError:
        return ApiServerErrors("Enternet connection error, try later.");
      case DioExceptionType.badResponse:
        return ApiServerErrors.fromStatusCode(
            dioError.response!.data['status_code']);
      case DioExceptionType.unknown:
        return ApiServerErrors("Unknown error, try later.");

      default:
        return ApiServerErrors("Unknown error, try later.");
    }
  }

  // create factory constsractor to handele status code messages;
  factory ApiServerErrors.fromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 1:
        return ApiServerErrors("Success.");
      case 2:
        return ApiServerErrors("Invalid service: this service does not exist.");
      case 3:
        return ApiServerErrors(
            "Authentication failed: You do not have permissions to access the service.");
      case 4:
        return ApiServerErrors(
            "Invalid format: This service doesn't exist in that format.");
      case 5:
        return ApiServerErrors(
            "Invalid parameters: Your request parameters are incorrect.");
      case 6:
        return ApiServerErrors(
            "Invalid ID: The pre-requisite ID is invalid or not found.");
      case 7:
        return ApiServerErrors(
            "Invalid API key: You must be granted a valid key.");
      case 8:
        return ApiServerErrors(
            "Duplicate entry: The data you tried to submit already exists.");
      case 9:
        return ApiServerErrors(
            "Service offline: This service is temporarily offline, try again later.");
      case 10:
        return ApiServerErrors(
            "Suspended API key: Access to your account has been suspended, contact TMDB.");
      case 11:
        return ApiServerErrors(
            "Internal error: Something went wrong, contact TMDB.");
      case 12:
        return ApiServerErrors("The item/record was updated successfully.");
      case 13:
        return ApiServerErrors("The item/record was deleted successfully.");
      case 14:
        return ApiServerErrors("Authentication failed.");
      case 15:
        return ApiServerErrors("Failed.");
      case 16:
        return ApiServerErrors("Device denied.");
      case 17:
        return ApiServerErrors("Session denied.");
      case 18:
        return ApiServerErrors("Validation failed.");
      case 19:
        return ApiServerErrors("Invalid accept header.");
      case 20:
        return ApiServerErrors(
            "Invalid date range: Should be a range no longer than 14 days.");
      case 21:
        return ApiServerErrors(
            "Entry not found: The item you are trying to edit cannot be found.");
      case 22:
        return ApiServerErrors(
            "Invalid page: Pages start at 1 and max at 500.");
      case 23:
        return ApiServerErrors("Invalid date: Format needs to be YYYY-MM-DD.");
      case 24:
        return ApiServerErrors(
            "Timeout: Request to the backend server timed out.");
      case 25:
        return ApiServerErrors(
            "Too many requests: You are over the allowed request limit.");
      case 26:
        return ApiServerErrors("Username and password required.");
      case 27:
        return ApiServerErrors(
            "Too many appended response objects: Max is 20.");
      case 28:
        return ApiServerErrors("Invalid timezone: Check documentation.");
      case 29:
        return ApiServerErrors(
            "Action not confirmed: Please confirm with confirm=true.");
      case 30:
        return ApiServerErrors("Invalid username or password.");
      case 31:
        return ApiServerErrors("Account disabled: Contact TMDB.");
      case 32:
        return ApiServerErrors("Email not verified.");
      case 33:
        return ApiServerErrors("Invalid request token: Expired or invalid.");
      case 34:
        return ApiServerErrors("Resource not found.");
      case 35:
        return ApiServerErrors("Invalid token.");
      case 36:
        return ApiServerErrors("Token lacks write permission.");
      case 37:
        return ApiServerErrors("Session not found.");
      case 38:
        return ApiServerErrors("No permission to edit this resource.");
      case 39:
        return ApiServerErrors("This resource is private.");
      case 40:
        return ApiServerErrors("Nothing to update.");
      case 41:
        return ApiServerErrors("Request token not approved by user.");
      case 42:
        return ApiServerErrors("Request method not supported.");
      case 43:
        return ApiServerErrors("Cannot connect to backend server.");
      case 44:
        return ApiServerErrors("Invalid ID.");
      case 45:
        return ApiServerErrors("User suspended.");
      case 46:
        return ApiServerErrors("API under maintenance. Try again later.");
      case 47:
        return ApiServerErrors("Invalid input.");
      default:
        return ApiServerErrors("Unknown error, please try again later.");
    }
  }
}
