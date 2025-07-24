abstract class ProfileInformationState {}

final class ProfileInformationInitial extends ProfileInformationState {}

final class ProfileInformationLoading extends ProfileInformationState {}

final class ProfileInformationSuccess extends ProfileInformationState {}

final class ProfileInformationFailure extends ProfileInformationState {
  final String errorMessage;
  ProfileInformationFailure({required this.errorMessage});
}
