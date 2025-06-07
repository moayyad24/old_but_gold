import 'package:dio/dio.dart';
import 'package:old_but_gold/features/auth/data/repos/auth_repo.dart';
import 'package:old_but_gold/features/auth/manager/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  Future<void> register(FormData data) async {
    emit(RegisterLoading());
    var result = await authRepo.register(data);
    result.fold(
      (f) {
        //failure
        emit(RegisterFailure(errorMessage: f.message));
      },
      (s) {
        //success
        emit(RegisterSuccess());
      },
    );
  }
}
