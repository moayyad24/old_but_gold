import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/features/auth/data/repos/auth/auth_repo.dart';
import 'package:old_but_gold/features/auth/manager/login_cubit/login_state.dart';
import 'package:old_but_gold/features/profile/data/repos/profile_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  final ProfileRepo profileRepo;
  LoginCubit(this.authRepo, this.profileRepo) : super(LoginInitial());
  Future<void> _storeUserToken(String token) async {
    final LocalStorageService storage = getIt<LocalStorageService>();
    await storage.setSecuredString(DbKeys.userToken, token);
  }

  Future<void> _storeProfileStatus(bool status) async {
    final LocalStorageService storage = getIt<LocalStorageService>();
    await storage.setBool(DbKeys.hasProfileInfo, status);
  }

  //check if the user has a profile information
  Future<void> _checkUserProfile() async {
    var result = await profileRepo.getPersonalInformation();
    result.fold(
      (f) {
        _storeProfileStatus(false);
      },
      (s) async {
        _storeProfileStatus(true);
      },
    );
  }

  Future<void> login(FormData data) async {
    emit(LoginLoading());
    var result = await authRepo.login(data);

    result.fold(
      (f) {
        //failure
        emit(LoginFailure(errorMessage: f.message));
      },
      (s) async {
        //success
        await _storeUserToken(s.data.token);
        await _checkUserProfile();
        emit(LoginSuccess());
      },
    );
  }
}
