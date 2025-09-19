import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/helper/input_validator.dart';
import 'package:old_but_gold/core/helper/profile_information_storage.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/app_snack_bar.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/core/widgets/custom_stepper.dart';
import 'package:old_but_gold/features/profile/data/models/personal_information_model.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_cubit.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_state.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/date_picker_row.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/first_and_last_name_field.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/location_picker_field.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/phone_number_field.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class UpdatePersonalInformationScreen extends StatefulWidget {
  const UpdatePersonalInformationScreen({super.key});

  @override
  State<UpdatePersonalInformationScreen> createState() =>
      _UpdatePersonalInformationScreenState();
}

class _UpdatePersonalInformationScreenState
    extends State<UpdatePersonalInformationScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController locationController;
  late GlobalKey<FormState> formkey;
  DateTime? birthDate;
  late String? lat;
  late String? long;
  @override
  void initState() {
    BlocProvider.of<ProfileInformationCubit>(context).getPersonalInformation();
    formkey = GlobalKey<FormState>();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    locationController = TextEditingController();
    super.initState();
  }

  void _getLatLong() {
    lat = ProfileInformationStorage.load()!.latitude;
    long = ProfileInformationStorage.load()!.longitude;
    if (lat == null || long == null) {
      AppSnackBar.showError(context, message: 'Please Select Your Location');
      return;
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileInformationCubit, ProfileInformationState>(
        listener: (context, state) {
          if (state is ProfileInformationFailure) {
            AppSnackBar.showError(context, message: state.errorMessage);
          } else if (state is GetProfileInformationSuccess) {
            firstNameController.text = state.personalInformationModel.firstName;
            lastNameController.text = state.personalInformationModel.lastName;
            phoneNumberController.text = state.personalInformationModel.phone;
            locationController.text = state.personalInformationModel.address;
            birthDate = state.personalInformationModel.birthday;
          } else if (state is ProfileInformationSuccess) {
            AppSnackBar.showSuccess(
              context,
              message: 'Your profile updated successfully',
            );
          }
        },
        builder: (context, state) {
          return state is GetProfileInformationLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    AuthAppBar(
                      dots: [
                        DotState.completed,
                        DotState.completed,
                        DotState.current,
                      ],
                    ),
                    ContentArea(
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            DragHandle(),
                            SizedBox(height: 20.h),
                            Text(
                              t.personalInfo.personalInformation,
                              style: AppTextStyles.bold26,
                            ),
                            SizedBox(height: 36.h),
                            FirstAndLastNameField(
                              firstName: firstNameController,
                              lastName: lastNameController,
                            ),
                            SizedBox(height: 30.h),
                            DatePickerRow(
                              initialDate: birthDate ?? DateTime(1998, 1, 1),
                              onDateSelected: (date) {
                                birthDate = date;
                              },
                            ),
                            SizedBox(height: 30.h),
                            LocationPickerField(location: locationController),
                            SizedBox(height: 30.h),
                            PhoneNumberField(
                              fieldTitle: t.personalInfo.phoneNumber,
                              hintText: '+213 542-382-179',
                              myController: phoneNumberController,
                              checkValid: (v) {
                                return InputValidator.validatePhone(v!);
                              },
                              countryCode: '+963', // Syria country code
                            ),
                            SizedBox(height: 40.h),
                            Text(
                              t.personalInfo.weMayUseYourPhoneNumber,
                              style: AppTextStyles.medium14.copyWith(
                                color: AppColors.grey666666,
                              ),
                            ),
                            SizedBox(height: 35.h),
                            AppConfirmButton(
                              text: 'Update Your Info',
                              isLoading: state is ProfileInformationLoading,
                              onPressed: () async {
                                _getLatLong();
                                if (formkey.currentState!.validate()) {
                                  var data = PersonalInformationModel(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    birthday: birthDate!,
                                    phone: '+${phoneNumberController.text}',
                                    longitude: long!,
                                    latitude: lat!,
                                    address: locationController.text,
                                  ).toMap();
                                  await context
                                      .read<ProfileInformationCubit>()
                                      .updatePersonalInformation(data);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
