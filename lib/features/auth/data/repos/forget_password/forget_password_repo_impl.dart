import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:old_but_gold/core/errors/failures.dart';
import 'package:old_but_gold/core/helper/api_service.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/features/auth/data/repos/forget_password/forget_password_repo.dart';

class ForgetPasswordRepoImpl extends ForgetPasswordRepo {
  final ApiService apiService;

  ForgetPasswordRepoImpl(this.apiService);

  @override
  Future<Either<Failure, bool>> checkEmail(String email) async {
    logger.i('📧 Starting email verification for password recovery');
    try {
      logger.d('📤 Sending email: ${_obscureEmail(email)}');
      final formData = FormData.fromMap({'email': email});

      Map<String, dynamic> response = await apiService.post(
        endPoint: 'checkEmail',
        data: formData,
      );
      logger.d('📥 Received response: ${_sanitizeResponse(response)}');

      String status = response['status'];
      bool success = status == 'success';

      logger.i(
        success
            ? '✅ Email verification successful'
            : '⚠️ Email verification failed with status: $status',
      );

      return right(success);
    } on DioException catch (e) {
      logger.e(
        '❌ Email verification failed with DioError',
        error: e,
        stackTrace: e.stackTrace,
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e, stackTrace) {
      logger.e(
        '❌ Unexpected error during email verification',
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkCode(data) async {
    logger.i('🔢 Starting verification code check');
    try {
      logger.d('📤 Sending verification code');
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'checkCode',
        data: data,
      );
      logger.d('📥 Received response: ${_sanitizeResponse(response)}');

      String status = response['status'];
      bool success = status == 'success';

      logger.i(
        success
            ? '✅ Code verification successful'
            : '⚠️ Code verification failed with status: $status',
      );

      return right(success);
    } on DioException catch (e) {
      logger.e(
        '❌ Code verification failed with DioError',
        error: e,
        stackTrace: e.stackTrace,
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e, stackTrace) {
      logger.e(
        '❌ Unexpected error during code verification',
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword(data) async {
    logger.i('🔑 Starting password change process');
    try {
      logger.d('📤 Sending password change request');
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'changePassword',
        data: data,
      );
      logger.d('📥 Received response: ${_sanitizeResponse(response)}');

      String status = response['status'];
      bool success = status == 'success';

      logger.i(
        success
            ? '✅ Password changed successfully'
            : '⚠️ Password change failed with status: $status',
      );

      return right(success);
    } on DioException catch (e) {
      logger.e(
        '❌ Password change failed with DioError',
        error: e,
        stackTrace: e.stackTrace,
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e, stackTrace) {
      logger.e(
        '❌ Unexpected error during password change',
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure(e.toString()));
    }
  }

  // Helper method to obscure sensitive email information in logs
  String _obscureEmail(String email) {
    if (email.isEmpty) return 'empty';
    final parts = email.split('@');
    if (parts.length != 2) return email;
    return '${parts[0].substring(0, 1)}****@${parts[1]}';
  }

  // Helper method to sanitize sensitive data in response
  Map<String, dynamic> _sanitizeResponse(Map<String, dynamic> response) {
    final sanitized = Map<String, dynamic>.from(response);
    if (sanitized.containsKey('token')) {
      sanitized['token'] = '****';
    }
    if (sanitized.containsKey('password')) {
      sanitized['password'] = '****';
    }
    return sanitized;
  }
}
