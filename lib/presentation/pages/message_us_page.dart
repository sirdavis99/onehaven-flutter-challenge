

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/presentation/widgets/custom_text_field.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';

class MessageUsPage extends StatelessWidget {
  const MessageUsPage({super.key});

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
            padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
            child: SingleChildScrollView(
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
                    height: 42.0.h,
                  ),
                  Text("Message Us", style: largeTextRubik().copyWith(color: boldTextColor,),),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Text(
                    "Need help or have complaint? Contact us and one of our representative will get back to you within 24hrs",
                    style: normalTextRubik().copyWith(
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 27.0.h,
                  ),
                  const CustomTextField(label: "Full Name"),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  const CustomTextField(label: "Email", textInputType: TextInputType.emailAddress,),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  const  CustomTextField(label: "Your Message", hintText: "Type your message", maxLines: 6, ),
                  SizedBox(
                    height: 25.0.h,
                  ),
                  CustomButton(size: size, onTap: (){}, text: "Send Message",),
                ],
              ),
            ),
          ),
        
        ),
      ),
    );
  }
}