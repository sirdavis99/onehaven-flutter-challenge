import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_hailing/data/repositories/get_address.dart';
import 'package:ride_hailing/domain/entities/request_ride.dart';
import 'package:ride_hailing/logic/provider/rides_provider.dart';
import 'package:ride_hailing/logic/state/request_ride.dart';
import 'package:ride_hailing/logic/state/success_state.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/format_amount.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:shimmer/shimmer.dart';

class RideList extends ConsumerStatefulWidget {
  const RideList({super.key});

  @override
  ConsumerState<RideList> createState() => _RideListState();
}

class _RideListState extends ConsumerState<RideList> {
  @override
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    final data = ref.read(requestRideProvider).data;

    if (data!.activeRides!.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            40.0.verticalSpace,
            Image.asset(
              errorGif,
              width: 200.0.w,
              height: 200.0.h,
            ),
            15.0.verticalSpace,
            Text(
              "Oops, there are no available rides now\nplease check back later",
              textAlign: TextAlign.center,
              style: semiLargeTextRubik().copyWith(
                color: blackColor,
              ),
            ),
            40.0.verticalSpace,
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 25.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ride List",
              style: semiLargeTextRubik().copyWith(
                color: blackColor,
              ),
            ),
            12.0.verticalSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.activeRides!.length,
              separatorBuilder: (context, index) => Divider(
                color: dividerColor,
              ),
              itemBuilder: (context, index) {
                return CustomRideListWidget(
                  data: data.activeRides![index],
                  touched: selectedIndex == index &&
                      ref.watch(selectRideProvider).isLoading,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    ref
                        .read(selectRideProvider.notifier)
                        .selectRide(data.activeRides![index].id!.toString(), context, "${data.activeRides![index].driverDetails!.firstName} ${data.activeRides![index].driverDetails!.lastName}");
                  },
                );
              },
            )
          ],
        ),
      );
    }
  }
}

class CustomRideListWidget extends StatelessWidget {
  final ActiveRides data;
  final void Function()? onTap;
  final bool? touched;
  const CustomRideListWidget({
    super.key,
    required this.data,
    this.onTap,
    this.touched,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Padding(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.driverDetails!.firstName} ${data.driverDetails!.lastName}",
                    style: normalTextRubik().copyWith(
                        color: textColor1, fontWeight: FontWeight.w500),
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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                      FutureBuilder(
                        future: getAddress(data.dropOffLocationLat!,
                            data.dropOffLocationLong!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                    ],
                  ),
                ],
              ),
              Expanded(child: 12.verticalSpace),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: touched == true
                    ? CircularProgressIndicator.adaptive(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(drawerColor),
                      )
                    : Text(
                        formatAmount(num.tryParse(data.tripFare!)!),
                        style: nairaNormalText().copyWith(
                          color: textColor1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
