import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:old_but_gold/core/errors/failures.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, bool>> checkEmail(String email);
  Future<Either<Failure, bool>> checkCode(FormData data);
  Future<Either<Failure, bool>> changePassword(FormData data);
}
