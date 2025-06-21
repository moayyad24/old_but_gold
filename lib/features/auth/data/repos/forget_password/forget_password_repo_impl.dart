import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:old_but_gold/core/errors/failures.dart';
import 'package:old_but_gold/core/helper/api_service.dart';
import 'package:old_but_gold/features/auth/data/repos/forget_password/forget_password_repo.dart';

class ForgetPasswordRepoImpl extends ForgetPasswordRepo {
  final ApiService apiService;

  ForgetPasswordRepoImpl(this.apiService);
  @override
  Future<Either<Failure, bool>> checkEmail(email) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'checkEmail',
        data: FormData.fromMap({'email': email}),
      );
      String status = response['status'];
      return right(status == 'success' ? true : false);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkCode(data) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'checkCode',
        data: data,
      );
      String status = response['status'];
      return right(status == 'success' ? true : false);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword(data) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'changePassword',
        data: data,
      );
      String status = response['status'];
      return right(status == 'success' ? true : false);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
