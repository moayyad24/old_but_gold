import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/features/profile/data/repos/profile_repo.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_state.dart';

class ProfileInformationCubit extends Cubit<ProfileInformationState> {
  final ProfileRepo profileRepo;
  ProfileInformationCubit(this.profileRepo)
    : super(ProfileInformationInitial());

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
        emit(ProfileInformationSuccess());
      },
    );
  }
}
