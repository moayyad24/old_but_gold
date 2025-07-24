import 'package:old_but_gold/features/profile/data/models/personal_information_model.dart';

abstract class ProfileInformationState {}

final class ProfileInformationInitial extends ProfileInformationState {}

final class GetProfileInformationLoading extends ProfileInformationState {}

final class ProfileInformationLoading extends ProfileInformationState {}

final class GetProfileInformationSuccess extends ProfileInformationState {
  final PersonalInformationModel personalInformationModel;
  GetProfileInformationSuccess({required this.personalInformationModel});
}

final class ProfileInformationSuccess extends ProfileInformationState {}

final class ProfileInformationFailure extends ProfileInformationState {
  final String errorMessage;
  ProfileInformationFailure({required this.errorMessage});
}
