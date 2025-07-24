import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/input_validator.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/app_snack_bar.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/features/auth/ui/widgets/custom_stepper.dart';
import 'package:old_but_gold/features/profile/data/models/personal_information_model.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_cubit.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_state.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/date_picker_row.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/first_and_last_name_field.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/location_picker_field.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/phone_number_field.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController locationController;
  late LocalStorageService storage;
  late GlobalKey<FormState> formkey;
  late DateTime? birthDate;
  late String? lat;
  late String? long;
  @override
  void initState() {
    formkey = GlobalKey<FormState>();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    locationController = TextEditingController();
    storage = getIt.get<LocalStorageService>();
    super.initState();
  }

  void _getLatLong() {
    lat = storage.getString(DbKeys.latitude);
    long = storage.getString(DbKeys.latitude);
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
      body: Column(
        children: [
          AuthAppBar(
            dots: [DotState.completed, DotState.completed, DotState.current],
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
                    initialDate: DateTime(1998, 1, 1),
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
                  BlocConsumer<
                    ProfileInformationCubit,
                    ProfileInformationState
                  >(
                    listener: (context, state) {
                      if (state is ProfileInformationFailure) {
                        AppSnackBar.showError(
                          context,
                          message: state.errorMessage,
                        );
                      } else if (state is ProfileInformationSuccess) {
                        AppSnackBar.showSuccess(
                          context,
                          message: 'Successfully Updated',
                        );
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return AppConfirmButton(
                        text: t.personalInfo.confirmYourInfo,
                        isLoading: state is ProfileInformationLoading,
                        onPressed: () async {
                          _getLatLong();
                          if (formkey.currentState!.validate()) {
                            FormData data = FormData.fromMap(
                              PersonalInformationModel(
                                name:
                                    '${firstNameController.text} ${lastNameController.text}',
                                birthday: birthDate!,
                                phone: phoneNumberController.text,
                                longitude: long!,
                                latitude: lat!,
                                address: locationController.text,
                              ).toMap(),
                            );
                            await context
                                .read<ProfileInformationCubit>()
                                .createPersonalInformation(data);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
