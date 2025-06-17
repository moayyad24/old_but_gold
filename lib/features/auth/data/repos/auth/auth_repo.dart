import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:old_but_gold/core/errors/failures.dart';
import 'package:old_but_gold/features/auth/data/models/login_model.dart';
import 'package:old_but_gold/features/auth/data/models/register_model.dart';
import 'package:old_but_gold/features/auth/data/models/verify_email_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterModel>> register(FormData data);
  Future<Either<Failure, LoginModel>> login(FormData data);
  Future<Either<Failure, VerifyEmailModel>> verifyEmail(FormData data);
  Future<Either<Failure, bool>> resendCode(String email);
}
