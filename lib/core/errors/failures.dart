import 'package:dio/dio.dart';

/// Abstract class representing a generic failure.
abstract class Failure {
  final String message;

  const Failure(this.message);
}

/// Handles API-related failures by mapping Dio exceptions to readable error messages.
class ServerFailure extends Failure {
  ServerFailure(super.message);

  /// Factory constructor to parse Dio errors efficiently.
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with the server.");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout occurred. Please try again.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          "Receive timeout. Server is taking too long to respond.",
        );

      case DioExceptionType.badCertificate:
        return ServerFailure("Invalid server certificate detected.");

      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response?.statusCode ?? 500,
          dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure("Request was canceled.");

      case DioExceptionType.connectionError:
        return ServerFailure("Connection error. Please check your internet.");

      case DioExceptionType.unknown:
        if (dioException.message?.contains("SocketException") ?? false) {
          return ServerFailure("No internet connection.");
        }
        return ServerFailure("Unexpected error occurred. Please try again.");
    }
  }

  /// Handles bad responses with appropriate error messages.
  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode >= 500) {
      return ServerFailure(
        "Server error ($statusCode). Please try again later.",
      );
    } else if (statusCode == 422) {
      return ServerFailure(response['errors']['email'][0]);
    } else if (statusCode == 400) {
      return ServerFailure(response['message']['errorDetails'][0]);
    } else if (statusCode == 401) {
      return ServerFailure(response['message']['errorDetails'][0]);
    } else {
      return ServerFailure("Unexpected response from the server.");
    }
  }
}
