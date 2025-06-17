import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/features/auth/data/repos/auth/auth_repo.dart';
import 'package:old_but_gold/features/auth/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

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
        emit(LoginSuccess());
      },
    );
  }
}
