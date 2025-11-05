import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/onboarding_const.dart';
import 'package:ride_hailing/utils/theme.dart';

import 'login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  PageController backgGroundController = PageController(initialPage: 0);
  PageController containerController = PageController(initialPage: 0);

  void onItemTapped(index) {
    setState(() {
      _currentIndex = index;
    });
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
        backgroundColor: whiteColor,
        body: Container(
          color: whiteColor,
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                left: 0.0,
                right: 0.0,
                top: 0.0,
                child: SizedBox(
                  height: 675.0.h,
                  width: size.width,
                  child: PageView.builder(
                    controller: backgGroundController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: onItemTapped,
                    itemCount: onboardingList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(onboardingList[index].image,
                          fit: BoxFit.fill);
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomSheetTopWidget(size: size),
                    Container(
                      width: size.width,
                      height: 350.0.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0.r),
                          topRight: Radius.circular(40.0.r),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200.0.h,
                            child: PageView.builder(
                              controller: containerController,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: onboardingList.length,
                              onPageChanged: onItemTapped,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 68.0.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 50.0.h,
                                      ),
                                      Text(
                                        onboardingList[index].title,
                                        textAlign: TextAlign.center,
                                        style: largeTextRubik().copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: boldTextColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25.0.h,
                                      ),
                                      Text(
                                        onboardingList[index].subtitle,
                                        textAlign: TextAlign.center,
                                        style: mediumTextRubik().copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: lightTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AnimatedSize(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      for (int i = 0;
                                          i < onboardingList.length;
                                          i++)
                                        if (i == _currentIndex) ...[
                                          circularIndicator(true, null, null)
                                        ] else
                                          circularIndicator(false, null, null),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 64.0.w,
                                  height: 64.0.h,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: primaryColor.withOpacity(0.37),
                                        offset: const Offset(-15, 20),
                                        blurRadius: 30.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      borderRadius:
                                          BorderRadius.circular(50.0.r),
                                      onTap: () {
                                        if (_currentIndex !=
                                            (onboardingList.length - 1)) {
                                          containerController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                          backgGroundController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                        } else {
                                          Navigator.pushNamed(
                                              context, RouteGenerator.joinPage);
                                        }
                                      },
                                      child: Center(
                                        child: SvgPicture.asset(arrowRight),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: SafeArea(
                      top: true,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _currentIndex != 0
                                ? IconButton(
                                    onPressed: () {
                                      containerController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                      backgGroundController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    icon: SvgPicture.asset(arrowLeft),
                                  )
                                : const SizedBox.shrink(),
                            TextButton(
                              onPressed: () {
                                 Navigator.pushNamed(
                                    context, RouteGenerator.joinPage);
                              },
                              child: Text(
                                "Skip",
                                style: normalTextRubik().copyWith(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

Widget circularIndicator(
  bool value,
  double? height,
  double? width,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2.0.w),
    //duration: const Duration(milliseconds: 300),
    height: value == true ? height ?? 7.0.h : height ?? 7.0.h,
    width: value == true ? 28.0.w : width ?? 7.0.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0.r),
        color: value == true ? greyColor1 : greyColor),
  );
}
