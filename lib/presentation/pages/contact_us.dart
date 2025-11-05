import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 23.0.w),
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
                      "Contact Us",
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
                  height: 20.0.h,
                ),
                Container(
                  height: 50.0.h,
                  width: size.width,
                  color: Colors.transparent,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: blueColor1,
                              shape: BoxShape.circle,
                            ),
                            width: 46.0.w,
                            height: 46.0.h,
                            child: Center(
                              child: SvgPicture.asset(callIcon),
                            ),
                          ),
                          SizedBox(
                            width: 10.0.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "+234 (0) 70 6742 1332",
                                style: mediumTextRubik()
                                    .copyWith(color: primaryColor),
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              Text(
                                "Beepiee hotline 24/7 toll free",
                                style: normalTextRubik().copyWith(
                                  color: blackColor2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: dividerColor,
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Container(
                  height: 70.0.h,
                  width: size.width,
                  color: Colors.transparent,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.messageUsPage);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: blueColor1,
                              shape: BoxShape.circle,
                            ),
                            width: 46.0.w,
                            height: 46.0.h,
                            child: Center(
                              child: SvgPicture.asset(contactUsIcon),
                            ),
                          ),
                          SizedBox(
                            width: 10.0.h,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Contact Us",
                                  style: mediumTextRubik()
                                      .copyWith(color: blackColor),
                                ),
                                SizedBox(
                                  height: 5.0.h,
                                ),
                                Text(
                                  "Send us a message and get response\nwithin 24 hours",
                                  style: normalTextRubik().copyWith(
                                    color: blackColor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(rightIosIcon)
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: dividerColor,
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                Container(
                  height: 50.0.h,
                  width: size.width,
                  color: Colors.transparent,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.supportChatPage);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: blueColor1,
                              shape: BoxShape.circle,
                            ),
                            width: 46.0.w,
                            height: 46.0.h,
                            child: Center(
                              child: SvgPicture.asset(supportIcon),
                            ),
                          ),
                          SizedBox(
                            width: 10.0.h,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Support Chat",
                                  style: mediumTextRubik()
                                      .copyWith(color: blackColor),
                                ),
                                SizedBox(
                                  height: 5.0.h,
                                ),
                                Text(
                                  "Live chat 24/7",
                                  style: normalTextRubik().copyWith(
                                    color: blackColor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(rightIosIcon)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
