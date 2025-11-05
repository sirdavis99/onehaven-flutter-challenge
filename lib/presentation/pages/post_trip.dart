import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_hailing/domain/entities/profile_status_enum.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/logic/provider/location_provider.dart';
import 'package:ride_hailing/logic/state/location_data_state.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/utils/hive_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:ride_hailing/utils/toast.dart';

import '../../utils/color_const.dart';

class PostTrip extends ConsumerStatefulWidget {
  const PostTrip({super.key});

  @override
  ConsumerState<PostTrip> createState() => _PostTripState();
}

class _PostTripState extends ConsumerState<PostTrip> {
  final String _rider = "rider";
  final String _driver = "driver";
  String? _selectedItem;

  var profileBox = Hive.box<String>(HiveConst.profileStatusBox);
  var driverProfileBox = Hive.box<String>(HiveConst.driverProfileStatusBox);

  String? profileStatus;
  String? driverProfileStatus;

  @override
  void initState() {
    profileStatus = profileBox.get(HiveConst.profileStatusKey);
    driverProfileStatus =
        driverProfileBox.get(HiveConst.driverProfileStatusKey);
    super.initState();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Post a Trip",
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
                height: 42.0.h,
              ),
              Text(
                "Create a trip as",
                textAlign: TextAlign.center,
                style: largeTextRubik().copyWith(
                  color: boldTextColor,
                ),
              ),
              SizedBox(
                height: 40.0.h,
              ),
              SizedBox(
                height: 200.0.h,
                width: 200.0.w,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedItem = _driver;
                      });
                    },
                    borderRadius: BorderRadius.circular(100.0.r),
                    child: Image.asset(
                      _selectedItem == _driver
                          ? circleBorderDriverActive
                          : circleBorderDriver,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "A Driver",
                textAlign: TextAlign.center,
                style: semiLargeTextRubik().copyWith(
                  color: boldTextColor,
                ),
              ),
              SizedBox(
                height: 39.0.h,
              ),
              SizedBox(
                height: 200.0.h,
                width: 200.0.w,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedItem = _rider;
                      });
                    },
                    borderRadius: BorderRadius.circular(100.0.r),
                    child: Image.asset(
                      _selectedItem == _rider
                          ? circleBorderRiderActive
                          : circleBorderRider,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "A Passenger",
                textAlign: TextAlign.center,
                style: semiLargeTextRubik().copyWith(
                  color: boldTextColor,
                ),
              ),
              SizedBox(
                height: 80.0.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: CustomButton(
                  backgroundColor:
                      _selectedItem == null ? greyColor6 : primaryColor,
                  size: size,
                  onTap: () {
                    if (_selectedItem != null) {
                      ref.read(tripType.notifier).state = _selectedItem;
                      if (ref.watch(getLocationProvider).isLoading) {
                        showToast(
                            "Trying to get your location\nplease try again");
                      } else {
                        if (_selectedItem == _driver) {
                          if (driverProfileStatus == ProfileStatus.none.name) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CompleteProfileDialog(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context,
                                      RouteGenerator.driverKycPage,
                                    );
                                  },
                                );
                              },
                            );
                          } else if (driverProfileStatus ==
                              ProfileStatus.procesing.name) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ProcessingProfileDialog(
                                  onPressed: () {},
                                );
                              },
                            );
                          } else if (driverProfileStatus ==
                              ProfileStatus.failed.name) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return FailedProfileDialog(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, RouteGenerator.driverKycPage);
                                  },
                                );
                              },
                            );
                          } else {
                            Navigator.pushNamed(
                                context, RouteGenerator.driverAddLocation);
                          }
                        } else {
                          if (profileStatus == ProfileStatus.none.name) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CompleteProfileDialog(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, RouteGenerator.editPage,
                                        arguments:
                                            RouteGenerator.driverAddLocation);
                                  },
                                );
                              },
                            );
                          } else if (profileStatus ==
                              ProfileStatus.procesing.name) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ProcessingProfileDialog(
                                  onPressed: () {},
                                );
                              },
                            );
                          } else if (profileStatus ==
                              ProfileStatus.failed.name) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return FailedProfileDialog(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, RouteGenerator.editPage);
                                  },
                                );
                              },
                            );
                          } else {
                            Navigator.pushNamed(
                                context, RouteGenerator.driverAddLocation);
                          }
                        }
                      }
                    }
                  },
                  text: "Continue",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteProfileDialog extends StatelessWidget {
  final void Function()? onPressed;
  const CompleteProfileDialog({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: whiteColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      icon: Image.asset(
        errorGif,
        width: 100.0.w,
        height: 100.0.h,
      ),
      title: const Text(
        "Incomplete Profile",
      ),
      titleTextStyle: largeTextRubik().copyWith(color: blackColor),
      content: const Text(
        "Complete your profile to continue",
        textAlign: TextAlign.center,
      ),
      contentTextStyle: mediumTextRubik().copyWith(color: blackColor),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsOverflowDirection: VerticalDirection.up,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      actions: [
        SizedBox(
          width: size.width,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: raisedButtonStyle,
            child: Text(
              "Go Back",
              style: normalTextRubik().copyWith(color: whiteColor),
            ),
          ),
        ),
        SizedBox(
          width: size.width,
          child: ElevatedButton(
            onPressed: onPressed,
            style: raisedButtonStyle,
            child: Text(
              "Complete Profile",
              style: normalTextRubik().copyWith(color: whiteColor),
            ),
          ),
        ),
      ],
    );
  }
}

class FailedProfileDialog extends StatelessWidget {
  final void Function()? onPressed;
  const FailedProfileDialog({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: whiteColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      icon: Image.asset(
        errorGif,
        width: 100.0.w,
        height: 100.0.h,
      ),
      title: const Text(
        "Incomplete Profile",
      ),
      titleTextStyle: largeTextRubik().copyWith(color: blackColor),
      content: const Text(
        "We found some issues with your profile data kindly fill it in again",
        textAlign: TextAlign.center,
      ),
      contentTextStyle: mediumTextRubik().copyWith(color: blackColor),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsOverflowDirection: VerticalDirection.up,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      actions: [
        SizedBox(
          width: size.width,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: raisedButtonStyle,
            child: Text(
              "Go Back",
              style: normalTextRubik().copyWith(color: whiteColor),
            ),
          ),
        ),
        SizedBox(
          width: size.width,
          child: ElevatedButton(
            onPressed: onPressed,
            style: raisedButtonStyle,
            child: Text(
              "Complete Profile",
              style: normalTextRubik().copyWith(color: whiteColor),
            ),
          ),
        ),
      ],
    );
  }
}

class ProcessingProfileDialog extends StatelessWidget {
  final void Function()? onPressed;
  const ProcessingProfileDialog({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: whiteColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      icon: Image.asset(
        errorGif,
        width: 100.0.w,
        height: 100.0.h,
      ),
      title: const Text(
        "Incomplete Profile",
      ),
      titleTextStyle: largeTextRubik().copyWith(color: blackColor),
      content: const Text(
        "Your profile is currently being verified\nwe will get back to you once we are done",
        textAlign: TextAlign.center,
      ),
      contentPadding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 30),
      contentTextStyle: mediumTextRubik().copyWith(color: blackColor),
      //actionsAlignment: MainAxisAlignment.spaceBetween,
      //actionsOverflowDirection: VerticalDirection.up,
      //actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );
  }
}
