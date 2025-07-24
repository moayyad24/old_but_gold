import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:old_but_gold/core/errors/failures.dart';
import 'package:old_but_gold/features/profile/data/models/personal_information_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, bool>> createPersonalInformation(FormData data);
  Future<Either<Failure, PersonalInformationModel>> getPersonalInformation();
}
