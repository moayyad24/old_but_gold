import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:old_but_gold/core/errors/failures.dart';
import 'package:old_but_gold/core/helper/api_service.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/profile_information_storage.dart';
import 'package:old_but_gold/features/profile/data/models/personal_information_model.dart';
import 'package:old_but_gold/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, bool>> createPersonalInformation(data) async {
    logger.i('🔄 Starting personal information creation with data: $data');
    try {
      logger.d('📤 Sending personal information request');
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'profile',
        data: data,
      );
      logger.d('📥 Received personal information response: $response');

      String status = response['status'];
      bool success = status == 'success';
      logger.i(
        success
            ? '✅ Personal information creation successful'
            : '⚠️ Personal information creation failed with status: $status',
      );
      return right(success);
    } on DioException catch (e) {
      logger.e(
        '❌ Personal information creation failed with DioError',
        error: e,
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      logger.e('❌ Unexpected personal information creation error', error: e);
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePersonalInformation(data) async {
    logger.i('🔄 Starting personal information updating with data: $data');
    try {
      logger.d('📤 Sending update personal information request');
      Map<String, dynamic> response = await apiService.put(
        endPoint: 'profile/1',
        data: data,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      logger.d('📥 Received update personal information response: $response');

      String status = response['status'];
      bool success = status == 'success';
      logger.i(
        success
            ? '✅ Personal information updated successfully'
            : '⚠️ Personal information update failed with status: $status',
      );
      return right(success);
    } on DioException catch (e) {
      logger.e('❌ Personal information update failed with DioError', error: e);
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      logger.e('❌ Unexpected personal information update error', error: e);
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PersonalInformationModel>>
  getPersonalInformation() async {
    logger.i('🔄 Fetching personal information...');
    try {
      logger.d('📤 Sending GET request to "me" endpoint');
      Map<String, dynamic> response = await apiService.get(endPoint: 'me');
      logger.d('📥 Received response: ${response.toString()}');

      logger.d('🔨 Parsing response into PersonalInformationModel');
      var user = PersonalInformationModel.fromJson(response['data']);
      logger.i(
        '✅ Successfully fetched personal information for user ID: ${user.id}',
      );
      //store user profile info
      ProfileInformationStorage.save(user);
      return right(user);
    } on DioException catch (e) {
      logger.e(
        '❌ Failed to fetch personal information - DioError',
        error: e,
        time: DateTime.now(),
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      logger.e(
        '❌ Unexpected error while fetching personal information',
        error: e,
        time: DateTime.now(),
      );
      return left(ServerFailure(e.toString()));
    }
  }
}
