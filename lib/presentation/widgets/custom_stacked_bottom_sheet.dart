import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';

void customShowStackedBottomSheet(
    {required Widget child,
    required BuildContext context,
    bool? isDismissible,
    Size? size,
    Color? backColor,
    void Function()? onPressedCancel,
    BoxConstraints? constraints}) {
  showModalBottomSheet(
    isDismissible: isDismissible ?? true,
    isScrollControlled: true,
    constraints: constraints,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24.0),
      ),
    ),
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      // height: 800.0.h,
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 77.0.h,
             
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0.r),
                    topRight: Radius.circular(30.0.r),
                  ),
                  color: drawerColor),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 21.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Post a Trip",
                      style: semiLargeTextRubik().copyWith(color: whiteColor),
                    ),
                    IconButton(
                      onPressed: onPressedCancel ?? (){
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(cancelIcon,   colorFilter:
                            ColorFilter.mode(whiteColor, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
             // height: 700.0.h,
             width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0.r),
                  topRight: Radius.circular(15.0.r),
                ),
                color: backColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    child,
                  ],
                ),
              ),
            ),
            Container(
              color: whiteColor,
              height: 32.0.h,
            ),
          ],
        ),
      ),
    ),
  );
}
