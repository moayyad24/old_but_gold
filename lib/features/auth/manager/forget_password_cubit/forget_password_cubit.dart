import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/features/auth/manager/forget_password_cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(SetNewPasswordInitial());
}
