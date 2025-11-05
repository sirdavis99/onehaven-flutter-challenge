import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:ride_hailing/utils/toast.dart';

class SuccessScreen extends StatelessWidget {
  final String? text;
  const SuccessScreen({super.key, this.text});

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
        backgroundColor: whiteColor,
        body: WillPopScope(
          onWillPop: () async {
            showToast(
                "Can not return to previous screen\nYou can go back home");
            return false;
          },
          child: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(successIcon),
                  38.0.verticalSpace,
                  Text(
                    "Great",
                    textAlign: TextAlign.center,
                    style: semiLargeTextRubik().copyWith(
                        fontWeight: FontWeight.w600, color: blackColor),
                  ),
                  16.0.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Text(
                     text ?? "You have successfully posted your trip, hang on till a rider finds you",
                      textAlign: TextAlign.center,
                      style: mediumTextRubik()
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                  48.0.verticalSpace,
                  CustomButton(
                    size: size,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.bottomBarPage);
                    },
                    text: "Go back home",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
