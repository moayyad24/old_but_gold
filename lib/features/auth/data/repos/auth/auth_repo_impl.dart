import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:old_but_gold/core/errors/failures.dart';
import 'package:old_but_gold/core/helper/api_service.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/features/auth/data/models/login_model.dart';
import 'package:old_but_gold/features/auth/data/models/register_model.dart';
import 'package:old_but_gold/features/auth/data/models/verify_email_model.dart';
import 'package:old_but_gold/features/auth/data/repos/auth/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, RegisterModel>> register(data) async {
    logger.i('🚀 Starting registration process');
    try {
      logger.d('📤 Sending registration data: ${data.toString()}');
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'register',
        data: data,
      );
      logger.d('📥 Received registration response: $response');

      RegisterModel registerModel = RegisterModel.fromJson(response);
      logger.i('✅ Registration successful for ${registerModel.data.email}');
      return right(registerModel);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        logger.w('⚠️ Registration failed: should_resend_code');
        return left(ServerFailure('should_resend_code'));
      }
      logger.e(
        '❌ Registration failed with DioError',
        error: e,
        stackTrace: e.stackTrace,
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e, stackTrace) {
      logger.e(
        '❌ Unexpected registration error',
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginModel>> login(data) async {
    logger.i('🔑 Starting login process');
    try {
      logger.d('📤 Sending login data: ${data.toString()}');
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'login',
        data: data,
      );
      logger.d('📥 Received login response: $response');

      LoginModel loginModel = LoginModel.fromJson(response);
      logger.i('✅ Login successful for ${loginModel.data.type}');
      return right(loginModel);
    } on DioException catch (e) {
      logger.e(
        '❌ Login failed with DioError',
        error: e,
        stackTrace: e.stackTrace,
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e, stackTrace) {
      logger.e('❌ Unexpected login error', error: e, stackTrace: stackTrace);
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyEmailModel>> verifyEmail(data) async {
    logger.i('📧 Starting email verification');
    try {
      logger.d('📤 Sending verification data: ${data.toString()}');
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'verify-email',
        data: data,
      );
      logger.d('📥 Received verification response: $response');

      VerifyEmailModel verifyEmailModel = VerifyEmailModel.fromJson(response);
      logger.i('✅ Email verification successful');
      return right(verifyEmailModel);
    } on DioException catch (e) {
      logger.e(
        '❌ Email verification failed with DioError',
        error: e,
        stackTrace: e.stackTrace,
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e, stackTrace) {
      logger.e(
        '❌ Unexpected email verification error',
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> resendCode(String email) async {
    logger.i('🔄 Starting code resend for email: $email');
    try {
      final formData = FormData.fromMap({'email': email});
      logger.d('📤 Sending resend code request');
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'resendCode',
        data: formData,
      );
      logger.d('📥 Received resend code response: $response');

      String status = response['status'];
      bool success = status == 'success';
      logger.i(
        success
            ? '✅ Code resend successful'
            : '⚠️ Code resend failed with status: $status',
      );
      return right(success);
    } on DioException catch (e) {
      logger.e(
        '❌ Code resend failed with DioError',
        error: e,
        stackTrace: e.stackTrace,
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e, stackTrace) {
      logger.e(
        '❌ Unexpected code resend error',
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure(e.toString()));
    }
  }
}
