import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';

class SupportChatPage extends StatelessWidget {
  const SupportChatPage({super.key});

  @override
  Widget build(BuildContext context) {
   
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
                height: 30.0.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Today",
                  style: normalTextRubik().copyWith(
                    color: boldTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 36.0.h,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 18.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.zero,
                                    bottomLeft: Radius.circular(10.0.r),
                                    topRight: Radius.circular(10.0.r),
                                    bottomRight: Radius.circular(10.0.r),
                                  ),
                                  border: Border.all(
                                    color: whiteColor3,
                                    width: 0.50,
                                  ),
                                  color: greyColor5.withOpacity(0.14),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 17.0.h),
                                  child: SelectableText("Hi jay, how can i help you today", style: normalTextRubik().copyWith(color: blackColor,),),
                                ),
                              ),
                            ),
                            Text("10:17am", style: smallTextRubik().copyWith(color: blackColor,),),

                          ],
                        ),
                      );
                    },),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(12.0.r),
                ),
                margin: EdgeInsets.only(
                    bottom: 20.0.h,
                    left: 25.0.w,
                    right: 25.0.w,
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type a Message",
                              hintStyle: normalTextRubik().copyWith(color: textColor1,),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: SvgPicture.asset(attachIcon),),
                        SizedBox(
                          width: 19.0.w,
                        ),
                        InkWell(
                          onTap: (){},
                          child: SvgPicture.asset(sendIcon),)
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
