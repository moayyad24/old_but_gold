import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/features/auth/data/repos/forget_password/forget_password_repo.dart';
import 'package:old_but_gold/features/auth/manager/forget_password_cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordCubit(this.forgetPasswordRepo) : super(ForgetPasswordInitial());
  Future<void> checkEmail(String email) async {
    emit(ForgetPasswordLoading());
    var result = await forgetPasswordRepo.checkEmail(email);
    result.fold(
      (f) {
        //failure
        emit(ForgetPasswordFailure(errorMessage: f.message));
      },
      (s) async {
        //success
        emit(ForgetPasswordSuccess());
      },
    );
  }

  Future<void> checkCode(FormData data) async {
    emit(ForgetPasswordLoading());
    var result = await forgetPasswordRepo.checkCode(data);
    result.fold(
      (f) {
        //failure
        emit(ForgetPasswordFailure(errorMessage: f.message));
      },
      (s) async {
        //success
        emit(ForgetPasswordSuccess());
      },
    );
  }
}
