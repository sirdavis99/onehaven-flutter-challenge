import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_hailing/domain/entities/ride.dart';
import 'package:ride_hailing/logic/provider/location_provider.dart';
import 'package:ride_hailing/logic/provider/rides_provider.dart';
import 'package:ride_hailing/logic/state/request_ride.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/presentation/widgets/custom_text_field.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/hive_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:ride_hailing/utils/toast.dart';

class PostTrip2 extends ConsumerStatefulWidget {
  const PostTrip2({super.key});

  @override
  ConsumerState<PostTrip2> createState() => _PostTrip2State();
}

class _PostTrip2State extends ConsumerState<PostTrip2> {
  TextEditingController seatController = TextEditingController();
  TextEditingController tripFare = TextEditingController();
  TextEditingController? pickUpLocation;
  TextEditingController? destinationLocation;

  var userIdBox = Hive.box<String>(HiveConst.useridBox);

  String? userId;

  @override
  void initState() {
    userId = userIdBox.get(HiveConst.useridKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    pickUpLocation =
        TextEditingController(text: ref.watch(pickUpLocationData)!.description);
    destinationLocation = TextEditingController(
        text: ref.watch(destinationLocationData)!.description);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.0.w, vertical: 38.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Available Seat",
                    style: mediumTextRubik().copyWith(color: textColor1),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Container(
                    height: 64.0.h,
                    width: 190.0.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: lightBorderColor),
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0.w),
                            child: BorderlessCustomTextField(
                              label: "Seat",
                              textInputType: TextInputType.number,
                              controller: seatController,
                            ),
                          ),
                        ),
                        Container(
                          width: 80.0.w,
                          decoration: BoxDecoration(
                              color: whiteColor6,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8.0.r),
                                topRight: Radius.circular(8.0.r),
                              ),
                              border: Border.all(color: lightBorderColor)),
                          child: Center(
                            child: SvgPicture.asset(
                              seatIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10.0.w,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trip Fare",
                      style: mediumTextRubik().copyWith(color: textColor1),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    CustomTextField(
                      label: "Price",
                      textInputType: TextInputType.number,
                      controller: tripFare,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35.0.h,
          ),
          Divider(
            color: dividerColor,
            height: 0.50,
          ),
          SizedBox(
            height: 25.0.h,
          ),
          Text(
            "Your Car Information",
            style: mediumTextRubik().copyWith(
              color: textColor1,
            ),
          ),
          SizedBox(
            height: 11.0.h,
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: whiteColor6,
              borderRadius: BorderRadius.circular(11.0.r),
            ),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Car Type",
                        style: smallTextRubik().copyWith(color: blackColor),
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      Text(
                        "Camry Muscle",
                        style: mediumTextRubik().copyWith(color: blackColor),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Car Color",
                        style: smallTextRubik().copyWith(color: blackColor),
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      Text(
                        "Dark Grey",
                        style: mediumTextRubik().copyWith(color: blackColor),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Registration Number",
                        style: smallTextRubik().copyWith(color: blackColor),
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      Text(
                        "ABJ 852 AAA",
                        style: mediumTextRubik().copyWith(color: blackColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 39.0.h,
          ),
          Divider(
            color: dividerColor,
            height: 0.50.h,
          ),
          SizedBox(
            height: 29.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: smallTextRubik().copyWith(color: blackColor),
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  Text(
                    ref.watch(requestRidePayload)!.date!,
                    style: mediumTextRubik().copyWith(color: blackColor),
                  ),
                ],
              ),
              SizedBox(
                width: 34.0.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time",
                    style: smallTextRubik().copyWith(color: blackColor),
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  Text(
                    ref.watch(requestRidePayload)!.time!,
                    style: mediumTextRubik().copyWith(color: blackColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 31.0.h,
          ),
          Divider(
            color: dividerColor,
            height: 0.50.h,
          ),
          SizedBox(
            height: 31.0.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 9.0.h),
                child: SizedBox(
                  height: 90.0.h,
                  child: SvgPicture.asset(
                    location_1,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(
                width: 12.0.w,
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BorderlessCustomTextField(
                      label: 'Pickup',
                      controller: pickUpLocation,
                      readOnly: true,
                    ),
                    Divider(
                      color: dividerColor,
                      height: 0.50,
                    ),
                    BorderlessCustomTextField(
                      label: 'Destination',
                      controller: destinationLocation,
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 17.0.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(location_2),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Divider(
            color: dividerColor,
            thickness: 0.50,
          ),
          SizedBox(
            height: 37.0.h,
          ),
          ref.watch(requestRideProvider).isLoading
              ? CustomLoadingButtonBack(size: size, text: "Continue", onTap: (){},)
              : CustomButton(
                  size: size,
                  onTap: () {
                    if (seatController.text.isEmpty || tripFare.text.isEmpty) {
                      showToast(
                          "Please enter number of seats and trip fair to continue");
                    } else {
                      ref.read(requestRidePayload.notifier).update(
                            (state) => RequestRidePayload(
                              pickUpLocationLat: state!.pickUpLocationLat,
                              pickUpLocationLong: state.pickUpLocationLong,
                              dropOffLocationLat: state.dropOffLocationLat,
                              dropOffLocationLong: state.dropOffLocationLong,
                              rider: ref.watch(tripType) == "rider"
                                  ? int.tryParse(userId!)
                                  : null,
                              driver: ref.watch(tripType) == "driver"
                                  ? userId!
                                  : null,
                              date: state.date,
                              time: state.time,
                              numberOfSeats: int.tryParse(seatController.text),
                              tripFare: int.tryParse(tripFare.text),
                            ),
                          );

                      ref
                          .watch(requestRideProvider.notifier)
                          .requestRide(ref.read(requestRidePayload)!, context);
                    }
                  },
                  text: "Continue",
                ),
        ],
      ),
    );
  }
}
