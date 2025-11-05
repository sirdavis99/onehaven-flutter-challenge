import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';

class SecuritySettings extends StatelessWidget {
  const SecuritySettings({super.key});

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
        body: SafeArea(
          top: true,
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
                    "Security Settings",
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
              SizedBox(
                height: 135.0.h,
                width: size.width,
                child: Image.asset(securitySetting),
              ),
              SizedBox(
                height: 30.0.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Activate your setting", style: semiLargeTextRubik().copyWith(color: boldTextColor,),),
                    SizedBox(
                      height: 11.0.h,
                    ),
                    Text(
                      "To help keep yourself safe on every trip, kindly activate these settings",
                      style: mediumTextRubik().copyWith(
                        color: lightTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 27.0.h,
                    ),
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: whiteColor2,
                        borderRadius: BorderRadius.circular(13.0.r),
                        border: Border.all(
                          color: whiteColor3,
                        ),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 19.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Trusted Contact", style: normalTextRubik().copyWith(color: blackColor,),),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  Text("Store friends and family info so you can quickly share your location details and status", style: smallTextRubik().copyWith(color: blackColor,),),
                                ],
                              ),
                            ),
                            SvgPicture.asset(arrowRight, colorFilter:
                              ColorFilter.mode(blackColor, BlendMode.srcIn),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        
        ),
      ),
    );
  }
}
