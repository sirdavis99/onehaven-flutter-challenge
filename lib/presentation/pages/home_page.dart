import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/logic/provider/location_provider.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'onboarding.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // @override
  // void initState() {
  //   Future.delayed(Duration.zero, () {
  //     ref.watch(getLocationProvider.notifier).getCurrentLocation(context);
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final location = ref.watch(getLocationProvider);
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
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            location.when(
              initial: () {
                return Positioned.fill(
                  child: Container(
                    color: whiteColor,
                    height: size.height,
                    width: size.width,
                    child: Center(
                      child: SizedBox(
                        height: 150.0.h,
                        width: 150.0.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(primaryColor),
                        ),
                      ),
                    ),
                  ),
                );
              },
              loading: () {
                return Positioned.fill(
                  child: Container(
                    color: whiteColor,
                    height: size.height,
                    width: size.width,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      ),
                    ),
                  ),
                );
              },
              loaded: (loaded) {
                return Positioned.fill(
                  child: CustomMapWidget(
                    size: size,
                    loaded: loaded,
                  ),
                );
              },
              error: (error) {
                return Positioned.fill(
                  child: Container(
                    color: whiteColor,
                    height: size.height,
                    width: size.width,
                    child: Center(
                      child: Icon(
                        Icons.error,
                        color: primaryColor,
                        size: 25.0.sp,
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                width: size.width,
                height: 228.0.h,
                // margin: EdgeInsets.symmetric(horizontal: 33.0.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0.r),
                    topRight: Radius.circular(40.0.r),
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 9.0.h,
                    ),
                    Container(
                      width: 60.0.w,
                      height: 4.0.h,
                      decoration: BoxDecoration(
                        color: lightBorderColor,
                        borderRadius: BorderRadius.circular(9.0.r),
                      ),
                    ),
                    SizedBox(
                      height: 35.0.h,
                    ),
                    const HomeCarousel(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomMapWidget extends ConsumerStatefulWidget {
  const CustomMapWidget({
    super.key,
    required this.size,
    required this.loaded,
  });

  final Size size;
  final LocationData loaded;

  @override
  ConsumerState<CustomMapWidget> createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends ConsumerState<CustomMapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Map<MarkerId, Marker> markers = {};

  

  Future<void> _goToUserLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            widget.loaded.latitude!,
            widget.loaded.longitude!,
          ),
          zoom: 10.0,
        ),
      ),
    );
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        !.buffer
        .asUint8List();
  }

  @override
  void initState() {
    _goToUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: ref.watch(camperaPositionProvider)!,
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController controller) async {
          _controller.complete(controller);
          final Uint8List markerIcon =
              await getBytesFromAsset(originBitmap, 200);
          BitmapDescriptor sourceIcon = BitmapDescriptor.fromBytes(
              markerIcon);
          setState(() {
            markers.clear();
            _addMarker(
                LatLng(widget.loaded.latitude!, widget.loaded.longitude!),
                "Origin",
                sourceIcon);
          });
        },
      ),
    );
  }
}

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    super.key,
  });

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int? index;
  int _currentIndex = 0;

  void onItemTapped(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 128.0.h,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            onPageChanged: onItemTapped,
            itemCount: homePageCarouselList.length,
            itemBuilder: (context, index) {
              return HomeCarouselWidget(
                index: index,
                data: homePageCarouselList[index],
                onTap: () {
                  if (index == 0) {
                    Navigator.pushNamed(context, RouteGenerator.postTripPage);
                  }
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 15.0.h,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < 2; i++)
                if (i == _currentIndex) ...[
                  circularIndicator(true, 3.0.h, 10.0.w)
                ] else
                  circularIndicator(false, 3.0.h, 10.0.w),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeCarouselWidget extends StatelessWidget {
  final int index;
  final HomePageCarouselEntity data;
  final void Function()? onTap;
  const HomeCarouselWidget({
    super.key,
    required this.index,
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0.r),
      ),
      margin: EdgeInsets.only(left: index == 0 ? 21.0.w : 14.0.w),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 173.0.w,
                height: 128.0.h,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0.r),
                        bottomLeft: Radius.circular(15.0.r))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: index == 0 ? 25.0.h : 15.0.h,
                      ),
                      Text(
                        data.title!,
                        style: mediumTextRubik().copyWith(color: primaryColor),
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      Text(
                        data.subtitle!,
                        style: smallTextRubik().copyWith(color: blackColor),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      SvgPicture.asset(
                        arrowRight,
                        width: 16.0.w,
                        height: 12.0.h,
                        colorFilter:
                            ColorFilter.mode(blackColor, BlendMode.srcIn),
                      )
                    ],
                  ),
                ),
              ),
              Image.asset(
                data.image!,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<HomePageCarouselEntity> homePageCarouselList = [
  HomePageCarouselEntity(
    title: "Post a Trip",
    subtitle: "Make your life easy, lets find you an easy ride",
    image: postTrip,
  ),
  HomePageCarouselEntity(
    title: "Community",
    subtitle: "Create and engage with people in your community",
    image: postTrip,
  ),
];

class HomePageCarouselEntity {
  String? title;
  String? subtitle;
  String? image;
  HomePageCarouselEntity({this.title, this.subtitle, this.image});
}
