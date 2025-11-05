import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ride_hailing/logic/provider/location_provider.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ride_hailing/utils/map_helper_func.dart';

class CustomPolylineMapWidget extends ConsumerStatefulWidget {
  const CustomPolylineMapWidget({
    super.key,
    required this.size,
    required this.loaded,
  });

  final Size size;
  final LocationData loaded;

  @override
  ConsumerState<CustomPolylineMapWidget> createState() =>
      _CustomPolylineMapWidgetState();
}

class _CustomPolylineMapWidgetState
    extends ConsumerState<CustomPolylineMapWidget> {
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  Map<MarkerId, Marker> markers = {};

  PolylinePoints polylinePoints = PolylinePoints();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng? sourceLocation;

  LatLng? destLocation;

  GoogleMapController? mapController;

  _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    mapController = controller;
    debugPrint("The source location is ${sourceLocation!.latitude}");
    LatLng temp;

    if (sourceLocation!.latitude > destLocation!.latitude) {
      temp = sourceLocation!;
      sourceLocation = destLocation;
      destLocation = temp;
    }

    LatLngBounds bound =
        LatLngBounds(southwest: sourceLocation!, northeast: destLocation!);

    final Uint8List sourceIconByte = await getBytesFromAsset(originBitmap, 100);
    final Uint8List destIconByte = await getBytesFromAsset(destBitmap, 100);
    BitmapDescriptor sourceIcon = BitmapDescriptor.fromBytes(sourceIconByte);
    BitmapDescriptor destinationIcon = BitmapDescriptor.fromBytes(destIconByte);

    setState(() {
      markers.clear();
      _addMarker(LatLng(sourceLocation!.latitude, sourceLocation!.longitude),
          "Origin", sourceIcon);
      _addMarker(LatLng(destLocation!.latitude, destLocation!.longitude),
          "Destination", destinationIcon);
    });

    CameraUpdate u2 = CameraUpdate.newLatLngBounds(bound, 50);
    mapController!.animateCamera(u2).then((void v) {
      check(u2, mapController!);
    });
  }

  void check(CameraUpdate u, GoogleMapController c) async {
    c.animateCamera(u);
    mapController!.animateCamera(u);
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();
    if (kDebugMode) {
      print(l1.toString());
      print(l2.toString());
    }

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      check(u, c);
    } else {
      await _getPolyline();
    }
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        width: 5,
        polylineId: id,
        color: primaryColor,
        points: polylineCoordinates);

    setState(() {
      polylines[id] = polyline;
    });
  }

  _getPolyline() async {
    // Create the PolylineRequest object
    PolylineRequest request = PolylineRequest(
      // apiKey: dotenv.env['GOOGLE_API_KEY']!, // Your Google API key
      origin: PointLatLng(
        double.tryParse(ref.watch(pickUpLocationData)!.lat!)!,
        double.tryParse(ref.watch(pickUpLocationData)!.lng!)!,
      ), // Starting point
      destination: PointLatLng(
        double.tryParse(ref.watch(destinationLocationData)!.lat!)!,
        double.tryParse(ref.watch(destinationLocationData)!.lng!)!,
      ), // Ending point
      mode: TravelMode.driving, // Travel mode (e.g., driving)
    );

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      request: request,
      googleApiKey: dotenv.env['GOOGLE_API_KEY']!,
    );
    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //   googleApiKey: dotenv.env['GOOGLE_API_KEY']!,
    //   PointLatLng(double.tryParse(ref.watch(pickUpLocationData)!.lat!)!,
    //       double.tryParse(ref.watch(pickUpLocationData)!.lng!)!),
    //   PointLatLng(double.tryParse(ref.watch(destinationLocationData)!.lat!)!,
    //       double.tryParse(ref.watch(destinationLocationData)!.lng!)!),
    //   travelMode: TravelMode.driving,
    // );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    _addPolyLine();
  }

  void _onCameraMove(CameraPosition position) {}

  void assignLocation() {
    final pickUpData = ref.watch(pickUpLocationData);
    final destinationData = ref.watch(destinationLocationData);
    setState(() {
      sourceLocation = LatLng(double.tryParse(pickUpData!.lat!)!,
          double.tryParse(pickUpData.lng!)!);

      destLocation = LatLng(
        double.tryParse(destinationData!.lat!)!,
        double.tryParse(destinationData.lng!)!,
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero, () {
      assignLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: LayoutBuilder(builder: (context, contraints) {
        return GoogleMap(
          myLocationEnabled: true,
          compassEnabled: true,
          tiltGesturesEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: ref.watch(camperaPositionProvider)!,
          markers: Set<Marker>.of(markers.values),
          polylines: Set<Polyline>.of(polylines.values),
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
        );
      }),
    );
  }
}

class CustomUserMapLocation extends ConsumerStatefulWidget {
  final Size size;
  final LocationData loaded;
  const CustomUserMapLocation(
      {super.key, required this.loaded, required this.size});

  @override
  ConsumerState<CustomUserMapLocation> createState() =>
      _CustomUserMapLocationState();
}

class _CustomUserMapLocationState extends ConsumerState<CustomUserMapLocation> {
  Map<MarkerId, Marker> markers = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

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
      child: LayoutBuilder(builder: (context, builder) {
        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: ref.watch(camperaPositionProvider)!,
          markers: Set<Marker>.of(markers.values),
          onMapCreated: (GoogleMapController controller) async {
            _controller.complete(controller);
            final Uint8List markerIcon =
                await getBytesFromAsset(originBitmap, 200);
            BitmapDescriptor sourceIcon =
                BitmapDescriptor.fromBytes(markerIcon);
            setState(() {
              markers.clear();
              _addMarker(
                  LatLng(widget.loaded.latitude!, widget.loaded.longitude!),
                  "Origin",
                  sourceIcon);
            });
          },
        );
      }),
    );
  }
}
