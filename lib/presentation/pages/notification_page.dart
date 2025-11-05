import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';

class NotificationPage extends StatelessWidget {
  final bool backButton;
  const NotificationPage({super.key, required this.backButton});

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.0.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      backButton == true?
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(arrowLeft, colorFilter: ColorFilter.mode(
                                    blackColor, BlendMode.srcIn),
                              ),
                        )
                        : SizedBox(
                              width: 50.0.w,
                            ),
                      Text(
                        "Notification",
                        style: normalTextRubik().copyWith(
                            color: blackColor, fontWeight: FontWeight.w100),
                      ),
                      SizedBox(
                        width: 50.0.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 42.0.h,
                ),
                Container(
                  width: size.width,
                  height: 46.0.h,
                  color: primaryColor1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "2 Unread Notifications",
                          style: normalTextRubik().copyWith(color: greyColor3),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Mark as read",
                            style:
                                normalTextRubik().copyWith(color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const CustomNotificationWidget();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNotificationWidget extends StatelessWidget {
  const CustomNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            SizedBox(
              height: 5.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 39.0.w,
                  height: 39.0.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "N",
                      style: mediumTextRubik().copyWith(color: whiteColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25.0.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Ride Hailing",
                        style: mediumTextRubik().copyWith(
                            color: textColor1, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 6.0.h,
                      ),
                      Text(
                        "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: normalTextRubik().copyWith(
                            color: textColor1, fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}
