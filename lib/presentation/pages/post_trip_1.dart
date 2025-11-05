import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_hailing/domain/entities/ride.dart';
import 'package:ride_hailing/logic/provider/location_provider.dart';
import 'package:ride_hailing/logic/state/request_ride.dart';
import 'package:ride_hailing/presentation/pages/post_trip_2.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/presentation/widgets/custom_stacked_bottom_sheet.dart';
import 'package:ride_hailing/presentation/widgets/custom_text_field.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/hive_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:ride_hailing/utils/toast.dart';

import '../../logic/provider/rides_provider.dart';

class PostTrip1 extends ConsumerStatefulWidget {
  const PostTrip1({super.key});

  @override
  ConsumerState<PostTrip1> createState() => _PostTrip1State();
}

class _PostTrip1State extends ConsumerState<PostTrip1> {
  TextEditingController? pickUpController;
  TextEditingController? destinationController;
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  TimeOfDay _time = TimeOfDay.now();

  var userIdBox = Hive.box<String>(HiveConst.useridBox);

  String? userId;

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;

        timeController = TextEditingController(
            text: "${_time.hour}: ${_time.minute} ${_time.period.name}");
      });
    }
  }

  DateTime _date = DateTime.now();

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: _date,
      lastDate: DateTime(_date.year + 2, 12),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
        dateController = TextEditingController(
            text: "${_date.day}-${_date.month}-${_date.year}");
      });
    }
  }

  @override
  void initState() {
    userId = userIdBox.get(HiveConst.useridKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pickUpController =
        TextEditingController(text: ref.watch(pickUpLocationData)?.description);
    destinationController = TextEditingController(
        text: ref.watch(destinationLocationData)?.description);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.0.w, vertical: 38.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Trip",
                style: mediumTextRubik().copyWith(color: blackColor),
              ),
              Text(
                "Change",
                style: mediumTextRubik().copyWith(color: primaryColor),
              ),
            ],
          ),
          SizedBox(
            height: 33.0.h,
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
                      controller: pickUpController,
                      readOnly: true,
                    ),
                    Divider(
                      color: dividerColor,
                      height: 0.50,
                    ),
                    BorderlessCustomTextField(
                      label: 'Destination',
                      controller: destinationController,
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
          Text(
            "Date and Time",
            style: semiLargeTextRubik().copyWith(color: blackColor),
          ),
          SizedBox(
            height: 19.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: CustomTextField(
                  label: "Date",
                  controller: dateController,
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),
              SizedBox(
                width: 30.0.w,
              ),
              Flexible(
                child: CustomTextField(
                  label: "Time",
                  controller: timeController,
                  readOnly: true,
                  onTap: () {
                    _selectTime();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0.h,
          ),
          ref.watch(requestRideProvider).isLoading
              ? CustomLoadingButtonBack(
                  size: size,
                  onTap: () {},
                  text: "Continue",
                )
              : CustomButton(
                  size: size,
                  onTap: () {
                    if (dateController.text.isEmpty ||
                        timeController.text.isEmpty) {
                      showToast("Please select date and time to continue");
                    } else {
                      ref.read(requestRidePayload.notifier).state =
                          RequestRidePayload(
                        pickUpLocationLat:
                            ref.watch(pickUpLocationData)!.lat.toString(),
                        pickUpLocationLong:
                            ref.watch(pickUpLocationData)!.lng.toString(),
                        dropOffLocationLat:
                            ref.watch(destinationLocationData)!.lat.toString(),
                        dropOffLocationLong:
                            ref.watch(destinationLocationData)!.lng.toString(),
                        rider: ref.watch(tripType) == "rider"
                            ? int.tryParse(userId!)
                            : null,
                        driver:
                            ref.watch(tripType) == "driver" ? userId! : null,
                        date: dateController.text,
                        time: timeController.text,
                        numberOfSeats: int.tryParse("0"),
                        tripFare: int.tryParse("0"),
                      );
                      if (ref.watch(tripType) == "rider") {
                        ref.watch(requestRideProvider.notifier).requestRide(
                            ref.read(requestRidePayload)!, context);
                      } else {
                        customShowStackedBottomSheet(
                            child: const PostTrip2(),
                            context: context,
                            onPressedCancel: () {
                              Navigator.pop(context);
                            },
                            backColor: whiteColor);
                      }
                    }
                  },
                  text: "Continue",
                ),
        ],
      ),
    );
  }
}
