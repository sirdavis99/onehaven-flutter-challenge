import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_hailing/data/repositories/get_address.dart';
import 'package:ride_hailing/domain/entities/ride_history.dart';
import 'package:ride_hailing/logic/provider/rides_provider.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/format_amount.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:shimmer/shimmer.dart';

class ActivitiesPage extends ConsumerWidget {
  final bool backButton;
  const ActivitiesPage({super.key, required this.backButton});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: ref.watch(getRideHistoryProvider).when(initial: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }, empty: () {
            return const ErrorWidget(
              string:
                  "Oops, your ride history is empty\nplease check back later",
            );
          }, loaded: (loaded) {
            return RefreshIndicator(
              onRefresh: () async{
                ref.watch(getRideHistoryProvider.notifier).getRideHistory();
              },
              child: ListView(
                physics: const BouncingScrollPhysics(),
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              backButton == true
                                  ? IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: SvgPicture.asset(
                                        arrowLeft,
                                        colorFilter: ColorFilter.mode(
                                            blackColor, BlendMode.srcIn),
                                      ),
                                    )
                                  : SizedBox(
                                      width: 50.0.w,
                                    ),
                              Text(
                                "Activities",
                                style: normalTextRubik().copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.w100),
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
                        Text(
                          "Trip Activities",
                          style: semiLargeTextRubik().copyWith(
                            color: blackColor,
                          ),
                        ),
                        SizedBox(
                          height: 21.0.h,
                        ),
                        Text(
                          "Last Trip",
                          style: normalTextRubik().copyWith(
                              color: blackColor, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 6.0.h,
                        ),
                        Container(
                          width: size.width,
                          height: 185.0.h,
                          decoration: BoxDecoration(
                            color: whiteColor2,
                            borderRadius: BorderRadius.circular(13.0.r),
                            border: Border.all(color: whiteColor3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.0.w, vertical: 12.0.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width,
                                  height: 95.0.h,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(activityMap),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Landmark Beach",
                                      style: normalTextRubik().copyWith(
                                        color: blackColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0.w,
                                    ),
                                    SvgPicture.asset(arrowToIcon),
                                    SizedBox(
                                      width: 5.0.w,
                                    ),
                                    Text(
                                      "Landmark Beach",
                                      style: normalTextRubik().copyWith(
                                        color: blackColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.0.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "19 May 2023 - 3:33PM",
                                      style: normalTextRubik().copyWith(
                                        color: textColor1,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    Text(
                                      "PRICE: N1,500.00",
                                      style: normalTextRubik().copyWith(
                                        color: textColor1,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22.0.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 6.0.h,
                    width: size.width,
                    color: whiteColor4,
                  ),
                  SizedBox(
                    height: 24.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Older Trip Activities",
                          style: normalTextRubik().copyWith(
                              color: blackColor, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 17.0.h,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => Divider(
                            color: dividerColor,
                          ),
                          itemCount: loaded.rideHistory!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return  CustomActivitiesWidet(data: loaded.rideHistory![index],);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }, error: (error) {
            return ErrorWidget(
              string: error,
            );
          }),
        ),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String string;
  const ErrorWidget({
    super.key,
    required this.string,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: Container(
          height: 200.0.h,
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20.0.r)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Image.asset(
                errorGif,
                width: 100.0.w,
                height: 100.0.h,
              ),
              15.0.verticalSpace,
              Text(
                string,
                textAlign: TextAlign.center,
                style: smallTextRubik().copyWith(
                  color: blackColor,
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

class CustomActivitiesWidet extends StatelessWidget {
  final RideHistory data;
  const CustomActivitiesWidet({
    super.key, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.0.w,
            height: 40.0.h,
            decoration: BoxDecoration(
              color: greyColor2,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                carIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          12.0.horizontalSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 data.riderDetails == null ? "${data.driverDetails!.firstName} ${data.driverDetails!.lastName}" : "${data.riderDetails!.firstName} ${data.riderDetails!.lastName}",
                  style: normalTextRubik()
                      .copyWith(color: textColor1, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: getAddress(
                          data.pickUpLocationLat!, data.pickUpLocationLong!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100.0,
                              height: 20.0,
                              color: Colors.white,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100.0,
                              height: 20.0,
                              color: Colors.white,
                            ),
                          );
                        } else {
                          String address = snapshot.data.toString();
                          return Text(
                            address,
                            style: normalTextRubik().copyWith(
                              color: blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    SvgPicture.asset(arrowToIcon),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: getAddress(
                            data.dropOffLocationLat!, data.dropOffLocationLong!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 100.0,
                                height: 20.0,
                                color: Colors.white,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 100.0,
                                height: 20.0,
                                color: Colors.white,
                              ),
                            );
                          } else {
                            String address = snapshot.data.toString();
                            return Text(
                              address,
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: normalTextRubik().copyWith(
                                color: blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.horizontalSpace,
          Text(
            formatAmount(num.tryParse(data.tripFare!)!),
            style: nairaNormalText()
                .copyWith(color: textColor1, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  
  }
}
