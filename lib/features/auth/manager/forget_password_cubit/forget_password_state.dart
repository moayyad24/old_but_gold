abstract class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMessage;
  ForgetPasswordFailure({required this.errorMessage});
}
