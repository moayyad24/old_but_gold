import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/features/auth/data/repos/auth_repo.dart';
import 'package:old_but_gold/features/auth/manager/verify_email_cubit/verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepo authRepo;
  VerifyEmailCubit(this.authRepo) : super(VerifyEmailInitial());

  Future<void> verifyEmail(FormData data) async {
    emit(VerifyEmailLoading());
    var result = await authRepo.verifyEmail(data);
    result.fold(
      (f) {
        //failure
        emit(VerifyEmailFailure(errorMessage: f.message));
      },
      (s) {
        //success
        emit(VerifyEmailSuccess());
      },
    );
  }
}
