import 'package:dio/dio.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

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
        return ServerFailure(t.failures.connectionTimeoutWithTheServer);

      case DioExceptionType.sendTimeout:
        return ServerFailure(t.failures.sendTimeoutOccurred);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(t.failures.receiveTimeout);

      case DioExceptionType.badCertificate:
        return ServerFailure(t.failures.invalidServerCertificate);

      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response?.statusCode ?? 500,
          dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(t.failures.requestCanceled);

      case DioExceptionType.connectionError:
        return ServerFailure(t.failures.connectionError);

      case DioExceptionType.unknown:
        if (dioException.message?.contains("SocketException") ?? false) {
          return ServerFailure(t.failures.noInternetConnection);
        }
        return ServerFailure(t.failures.unexpectedError);
    }
  }

  /// Handles bad responses with appropriate error messages.
  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode >= 500) {
      return ServerFailure(t.failures.serverError(statusCode: statusCode));
    } else if (statusCode == 422) {
      return ServerFailure(
        response['errors']['email'][0] ?? response.toString(),
      );
    } else if (statusCode == 400) {
      return ServerFailure(response['message']['errorDetails'][0]);
    } else if (statusCode == 401) {
      return ServerFailure(
        response['error'] as String? ?? response['message']['errorDetails'][0],
      );
    } else {
      return ServerFailure(t.failures.unexpectedResponse);
    }
  }
}
