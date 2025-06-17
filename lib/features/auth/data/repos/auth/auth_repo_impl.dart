import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:old_but_gold/core/errors/failures.dart';
import 'package:old_but_gold/core/helper/api_service.dart';
import 'package:old_but_gold/features/auth/data/models/login_model.dart';
import 'package:old_but_gold/features/auth/data/models/register_model.dart';
import 'package:old_but_gold/features/auth/data/models/verify_email_model.dart';
import 'package:old_but_gold/features/auth/data/repos/auth/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, RegisterModel>> register(data) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'register',
        data: data,
      );
      RegisterModel registerModel = RegisterModel.fromJson(response);
      return right(registerModel);
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 400) {
          return left(ServerFailure('should_resend_code'));
        }
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginModel>> login(data) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'login',
        data: data,
      );
      LoginModel loginModel = LoginModel.fromJson(response);
      return right(loginModel);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyEmailModel>> verifyEmail(data) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'verify-email',
        data: data,
      );
      VerifyEmailModel verifyEmailModel = VerifyEmailModel.fromJson(response);
      return right(verifyEmailModel);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> resendCode(String email) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'resendCode',
        data: FormData.fromMap({'email': email}),
      );
      String status = response['status'];
      return right(status == 'success' ? true : false);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
