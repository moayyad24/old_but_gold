import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/image_uploader.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/features/profile/data/repos/profile_repo.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_state.dart';
import 'package:path/path.dart';

class ProfileInformationCubit extends Cubit<ProfileInformationState> {
  final ProfileRepo profileRepo;
  ProfileInformationCubit(this.profileRepo)
    : super(ProfileInformationInitial());
  Future<void> _storeProfileStatus() async {
    final LocalStorageService storage = getIt<LocalStorageService>();
    await storage.setBool(DbKeys.hasProfileInfo, true);
  }

  Future<void> createPersonalInformation(FormData data) async {
    emit(ProfileInformationLoading());
    var result = await profileRepo.createPersonalInformation(data);
    result.fold(
      (f) {
        //failure
        emit(ProfileInformationFailure(errorMessage: f.message));
      },
      (s) async {
        //success
        _storeProfileStatus();
        await getPersonalInformation();
        emit(ProfileInformationSuccess());
      },
    );
  }

  Future<void> updatePersonalInformation(Map<String, dynamic> data) async {
    emit(ProfileInformationLoading());
    var result = await profileRepo.updatePersonalInformation(data);
    result.fold(
      (f) {
        //failure
        emit(ProfileInformationFailure(errorMessage: f.message));
      },
      (s) async {
        //success
        await getPersonalInformation();
        emit(ProfileInformationSuccess());
      },
    );
  }

  Future<void> getPersonalInformation() async {
    emit(GetProfileInformationLoading());
    var result = await profileRepo.getPersonalInformation();
    result.fold(
      (f) {
        //failure
        emit(ProfileInformationFailure(errorMessage: f.message));
      },
      (s) async {
        //success
        emit(GetProfileInformationSuccess(personalInformationModel: s));
      },
    );
  }

  Future<void> updateImage() async {
    File? file = await ImageUploader.uploadImage();
    if (file != null) {
      String fileName = basename(file.path);
      var result = await profileRepo.updateImage(
        FormData.fromMap({
          'photo_url': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
          '_method': 'PUT',
        }),
      );
      result.fold(
        (f) {
          //failure
          emit(ProfileInformationFailure(errorMessage: f.message));
        },
        (s) async {
          //success
          await getPersonalInformation();
          emit(ProfileInformationSuccess());
        },
      );
    }
  }
}
