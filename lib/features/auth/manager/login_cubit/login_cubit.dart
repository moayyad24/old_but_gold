import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/features/auth/data/repos/auth/auth_repo.dart';
import 'package:old_but_gold/features/auth/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());
  Future<void> storeUserToken(String token) async {
    final LocalStorageService storage = getIt<LocalStorageService>();
    await storage.setSecuredString('token', token);
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
        await storeUserToken(s.data.token);
        emit(LoginSuccess());
      },
    );
  }
}
