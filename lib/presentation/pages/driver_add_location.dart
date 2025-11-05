import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:ride_hailing/logic/provider/location_provider.dart';
import 'package:ride_hailing/logic/state/location_data_state.dart';
import 'package:ride_hailing/presentation/pages/post_trip_1.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/presentation/widgets/custom_polyline_map.dart';
import 'package:ride_hailing/presentation/widgets/custom_stacked_bottom_sheet.dart';
import 'package:ride_hailing/presentation/widgets/custom_text_field.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/toast.dart';

class DriverAddLocation extends ConsumerWidget {
  const DriverAddLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getLocationProvider).data;
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
      child: WillPopScope(
        onWillPop: () async{
          ref.read(pickUpLocationData.notifier).state = null;
          ref.read(destinationLocationData.notifier).state = null;
          ref.read(requestRidePayload.notifier).state = null;
          return true;
        },
        child: Scaffold(
          backgroundColor: whiteColor,
          body: Stack(
            children: [
              Positioned.fill(
                child: ref.read(pickUpLocationData) != null && ref.read(destinationLocationData) != null ?
                CustomPolylineMapWidget(size: size, loaded: data!) : CustomUserMapLocation(size: size, loaded: data!)
              ),
              Positioned(
                top: 80.0.h,
                left: 21.0.w,
                right: 21.0.w,
                child: const CustomDriverAddLocationWidget(),
              ),
              Positioned(
                bottom: 0.0.h,
                child: Container(
                  width: size.width,
                  height: 150.0.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -1.00),
                      end: const Alignment(0, 1),
                      colors: [whiteColor.withOpacity(0.1), whiteColor],
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.0.w),
                      child: CustomButton(
                        size: size,
                        onTap: () {
                          if (ref.watch(pickUpLocationData) == null ||
                              ref.watch(destinationLocationData) == null) {
                            showToast(
                                "Please type in your pickup and destination location to continue");
                          } else {
                            customShowStackedBottomSheet(
                              isDismissible: false,
                              size: size,
                              child: const PostTrip1(),
                              context: context,
                              backColor: whiteColor,
                              onPressedCancel: () {
                                Navigator.pop(context);
                              },
                            );
                          }
                        },
                        text: "Post a Trip",
                      ),
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

class CustomDriverAddLocationWidget extends ConsumerStatefulWidget {
  const CustomDriverAddLocationWidget({
    super.key,
  });

  @override
  ConsumerState<CustomDriverAddLocationWidget> createState() =>
      _CustomDriverAddLocationWidgetState();
}

class _CustomDriverAddLocationWidgetState
    extends ConsumerState<CustomDriverAddLocationWidget> {
  TextEditingController pickUpController = TextEditingController();

  TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            ref.read(pickUpLocationData.notifier).state = null;
            ref.read(destinationLocationData.notifier).state = null;
            ref.read(requestRidePayload.notifier).state = null;
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            cancelIcon,
          ),
        ),
        SizedBox(
          height: 13.0.h,
        ),
        Container(
          width: size.width,
          height: 190.0.h,
          decoration: ShapeDecoration(
            color: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0.r),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x16000000),
                blurRadius: 58,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 10.0.h),
            child: Row(
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
                      CustomGooglePlaceTextField(
                        label: "Pick Up",
                        controller: pickUpController,
                        
                        itemClick: (Prediction prediction) {
                          ref.read(pickUpLocationData.notifier).state =
                              prediction;
                          setState(() {
                            pickUpController.text = prediction.description!;
                            pickUpController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                offset: prediction.description!.length,
                              ),
                            );
                          });
                        },
                      ),
                      Divider(
                        color: dividerColor,
                        height: 1.0,
                      ),
                      CustomGooglePlaceTextField(
                        label: "Destination ",
                        controller: destinationController,
                        itemClick: (Prediction prediction) {
                          ref.read(destinationLocationData.notifier).state =
                              prediction;

                          setState(() {
                            destinationController.text =
                                prediction.description!;
                            destinationController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                offset: prediction.description!.length,
                              ),
                            );
                          });
                        },
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
          ),
        )
      ],
    );
  }
}
