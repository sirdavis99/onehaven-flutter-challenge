import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ride_hailing/domain/entities/gender_enum.dart';
import 'package:ride_hailing/domain/entities/hive/user.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/logic/provider/profile.dart';
import 'package:ride_hailing/logic/state/success_state.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/presentation/widgets/custom_text_field.dart';
import 'package:ride_hailing/presentation/widgets/ui/ui.dart';
import 'package:ride_hailing/services/services.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/hive_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:ride_hailing/utils/toast.dart';
import 'package:provider/provider.dart';

class EditProfile extends ConsumerStatefulWidget {
  final String? route;
  const EditProfile({super.key, this.route});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  bool _loading = false;
  var userInfoBox = Hive.box<UserHive>(HiveConst.userInfoBox);
  File? _avatarFile;

  UserHive? userHive;
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? linkedInNameController;
  TextEditingController? phoneNumberController;
  TextEditingController? dobController;
  String? gender;

  DateTime selectedDate = DateTime.now();
  DateFormat dateOfBirthFormat = DateFormat('dd MMMM yyyy', 'en_US');

  final _formKey = GlobalKey<FormState>();

  void _handleSubmit() async {
    setState(() {
      _loading = true;
    });

    // Capture the service and notifier now, *before* any awaits:
    final thisContext = context;
    final httpService = context.read<HttpService>();
    final updateProfileNotifier = ref.read(updateProfileProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_avatarFile != null) {
        String fileName = _avatarFile!.path.split('/').last;
        FormData data = FormData.fromMap({
          "profile": await MultipartFile.fromFile(
            _avatarFile!.path,
            filename: fileName,
          ),
        });

        var response = await httpService.user.updateProfilePicture(data);
        debugPrint("Response: ${response.message}");

        if (response.ok) {
          showToast("Profile picture updated successfully");
        } else {
          showToast("Failed to update profile picture");
        }
      }

      if (_formKey.currentState!.validate() && gender != null && gender != "") {
        var response = await httpService.user.updateUser(
          dob: selectedDate.toString(),
          gender: gender,
          firstName: firstNameController!.text,
          lastName: lastNameController!.text,
          phoneNumber: phoneNumberController!.text,
        );

        debugPrint("User Update Response: ${response.message}");

        if (response.ok) {
          updateProfileNotifier.updateProfile(
            dob: selectedDate.toString(),
            gender: gender!,
            phoneNumber: phoneNumberController!.text,
            firstName: firstNameController!.text,
            lastName: lastNameController!.text,
            context: thisContext,
          );
        } else {
          showToast("Failed to update profile");
        }
      } else {
        showToast("Please fill in the empty fields to continue");
      }

      setState(() {
        _loading = false;
      });
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(selectedDate.year - 50),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController = TextEditingController(
          text: dateOfBirthFormat.format(selectedDate),
        );
      });
    }
  }

  void setAvatarFile(File file) {
    setState(() {
      _avatarFile = file;
    });
  }

  @override
  void initState() {
    super.initState();
    userHive = userInfoBox.get(HiveConst.userInfoKey);
    DateTime dateOfBirth = DateTime.parse(userHive!.dob ?? "");
    String formattedDate = dateOfBirthFormat.format(dateOfBirth);

    firstNameController = TextEditingController(text: userHive!.firstName);
    lastNameController = TextEditingController(text: userHive!.lastName);
    linkedInNameController = TextEditingController(
        text: "${userHive!.firstName} ${userHive!.lastName}");
    phoneNumberController =
        TextEditingController(text: userHive!.phoneNumber ?? "");

    dobController = TextEditingController(text: formattedDate);
    gender = userHive!.gender ?? "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: whiteColor1,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.0.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            arrowLeft,
                            colorFilter:
                                ColorFilter.mode(blackColor, BlendMode.srcIn),
                          ),
                        ),
                        Text(
                          "Edit Profile",
                          textAlign: TextAlign.center,
                          style: normalTextRubik().copyWith(
                              color: blackColor, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 50.0.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.0.h,
                    ),
                    Center(
                      child: AvatarManager(
                        onFileSelected: setAvatarFile,
                      ),
                    ),
                    SizedBox(
                      height: 40.0.h,
                    ),
                    CustomTextField(
                      label: "First Name",
                      controller: firstNameController,
                      readOnly: true,
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    CustomTextField(
                      label: "Last Name",
                      controller: lastNameController,
                      readOnly: true,
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    CustomTextField(
                      label: "Date of birth",
                      readOnly: true,
                      onTap: () {
                        _selectDate(context);
                      },
                      controller: dobController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill in you date of birth to continue';
                        }
                        return null;
                      },
                      suffixIcon: SvgPicture.asset(
                        calendarIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    CustomTextField(
                      label: "LinkedIn Username",
                      controller: linkedInNameController,
                      readOnly: true,
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    CustomTextField(
                      label: "Phone Number",
                      textInputType: TextInputType.number,
                      controller: phoneNumberController,
                      maxLength: 11,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill in you phone number to continue';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    Text(
                      "Choose your Gender",
                      style: normalTextRubik().copyWith(color: blackColor),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 189.0.w,
                          height: 52.0.h,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(9.0.r),
                            border: Border.all(
                              color: gender == Gender.female.name
                                  ? primaryColor
                                  : lightBorderColor,
                              width: 0.50,
                            ),
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  gender = Gender.female.name;
                                });
                              },
                              borderRadius: BorderRadius.circular(9.0.r),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    femaleIcon,
                                    colorFilter: ColorFilter.mode(
                                      gender == Gender.female.name
                                          ? primaryColor
                                          : blackColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0.w,
                                  ),
                                  Text(
                                    "Female",
                                    style: normalTextRubik().copyWith(
                                      color: gender == Gender.female.name
                                          ? primaryColor
                                          : blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 189.0.w,
                          height: 52.0.h,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(9.0.r),
                            border: Border.all(
                              color: gender == Gender.male.name
                                  ? primaryColor
                                  : lightBorderColor,
                              width: 0.50,
                            ),
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  gender = Gender.male.name;
                                });
                              },
                              borderRadius: BorderRadius.circular(9.0.r),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    maleIcon,
                                    colorFilter: ColorFilter.mode(
                                        gender == Gender.male.name
                                            ? primaryColor
                                            : blackColor,
                                        BlendMode.srcIn),
                                  ),
                                  SizedBox(
                                    width: 15.0.w,
                                  ),
                                  Text(
                                    "Male",
                                    style: normalTextRubik().copyWith(
                                        color: gender == Gender.male.name
                                            ? primaryColor
                                            : blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.0.verticalSpace,
                    ThemeButton(
                      'Update',
                      onPressed: _handleSubmit,
                      isLoading: _loading ||
                          ref.watch(updateProfileProvider).isLoading,
                    ),
                    // ref.watch(updateProfileProvider).isLoading
                    //     ? CustomLoadingButtonBack(
                    //         size: size,
                    //         onTap: () {},
                    //         text: "Update",
                    //       )
                    //     : CustomButton(
                    //         size: size,
                    //         onTap: () {
                    //           if (_formKey.currentState!.validate() &&
                    //               gender != null &&
                    //               gender != "") {
                    //             ref
                    //                 .watch(updateProfileProvider.notifier)
                    //                 .updateProfile(
                    //                   dob: selectedDate.toString(),
                    //                   gender: gender!,
                    //                   phoneNumber: phoneNumberController!.text,
                    //                   context: context,
                    //                 );
                    //           } else {
                    //             showToast(
                    //                 "Please fill in the empty fields to continue");
                    //           }
                    //         },
                    //         text: "Update",
                    //       ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
