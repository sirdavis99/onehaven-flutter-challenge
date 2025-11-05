import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_hailing/utils/theme.dart';

import '../../utils/color_const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });

  final Size size;
  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0.h,
      width: size.width,
      decoration: BoxDecoration(
        color: backgroundColor ?? primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Center(
            child: Text(
              text,
              style: mediumTextRubik().copyWith(color: textColor ?? whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLoadingButtonBack extends StatelessWidget {
  const CustomLoadingButtonBack({
    super.key,
    required this.size,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });

  final Size size;
  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0.h,
      width: size.width,
      decoration: BoxDecoration(
        color: backgroundColor ?? primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16.0.h,
                width: 16.0.w,
                child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(whiteColor)),
              ),
              SizedBox(
                width: 12.0.w,
              ),
              Text(
                text,
                style: mediumTextRubik()
                    .copyWith(color: textColor ?? whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAssetButton extends StatelessWidget {
  const CustomAssetButton({
    super.key,
    required this.size,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.textColor,
    required this.asset,
    this.borderColor,
  });

  final Size size;
  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final String asset;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0.h,
      width: size.width,
      decoration: BoxDecoration(
          color: backgroundColor ?? primaryColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: borderColor ?? primaryColor,
            width: 1.0,
          )),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style:
                    mediumTextRubik().copyWith(color: textColor ?? whiteColor),
              ),
              SizedBox(
                width: 12.0.w,
              ),
              SvgPicture.asset(
                asset,
                height: 20.0.h,
                width: 20.0.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    super.key,
    required this.size,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.onTap,
  });

  final Size size;
  final VoidCallback? onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0.h,
      width: size.width,
      decoration: BoxDecoration(
        color: backgroundColor ?? whiteColor,
        border: Border.all(color: lightBorderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16.0.h,
                width: 16.0.w,
                child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(linkedinTextColor)),
              ),
              SizedBox(
                width: 12.0.w,
              ),
              Text(
                text,
                style: mediumTextRubik()
                    .copyWith(color: textColor ?? linkedinTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
