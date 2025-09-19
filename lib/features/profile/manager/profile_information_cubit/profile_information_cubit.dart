import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/features/profile/data/repos/profile_repo.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_state.dart';

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
        emit(ProfileInformationSuccess());
      },
    );
  }

  Future<void> updatePersonalInformation(FormData data) async {
    emit(ProfileInformationLoading());
    var result = await profileRepo.updatePersonalInformation(data);
    result.fold(
      (f) {
        //failure
        emit(ProfileInformationFailure(errorMessage: f.message));
      },
      (s) async {
        //success
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
}
