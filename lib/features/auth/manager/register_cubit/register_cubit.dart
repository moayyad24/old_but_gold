import 'package:dio/dio.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/features/auth/data/repos/auth/auth_repo.dart';
import 'package:old_but_gold/features/auth/manager/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  Future<void> storeUserEmail(String email) async {
    final LocalStorageService storage = getIt<LocalStorageService>();
    await storage.setString('user_email', email);
  }

  Future<void> register(FormData data) async {
    emit(RegisterLoading());
    var result = await authRepo.register(data);
    result.fold(
      (f) {
        //failure
        if (f.message == 'should_resend_code') {
          emit(RegisterSuccess());
        } else {
          emit(RegisterFailure(errorMessage: f.message));
        }
      },
      (s) async {
        //success
        emit(RegisterSuccess());
      },
    );
  }
}
