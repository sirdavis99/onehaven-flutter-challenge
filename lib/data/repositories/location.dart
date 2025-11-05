import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as perm;
import 'package:ride_hailing/logic/state/location_data_state.dart';
import 'package:ride_hailing/utils/toast.dart';

class GetUserLocationNotifier extends StateNotifier<LocationDataState> {
  GetUserLocationNotifier({
    required this.ref,
  }) : super(const LocationDataState.initial());

  final Ref ref;

  getCurrentLocation(context) async {
    state = const LocationDataState.loading();
    final location = Location();
    LocationData? locationData;
    PermissionStatus status = await location.hasPermission();
    bool serviceEnabled = await location.serviceEnabled();
    if (status == PermissionStatus.granted ||
        status == PermissionStatus.grantedLimited) {
      debugPrint("Location is granted");
      if (serviceEnabled) {
        debugPrint("Location is granted service enabled");
        locationData = await location.getLocation();
        if (locationData.latitude != null || locationData.longitude != null) {

          debugPrint("location is not null 1");
          if (kDebugMode) {
            print(locationData);
          }
          state = LocationDataState.loaded(data: locationData);
        } else {
          debugPrint("location is null 2");
          showToast("Unable to get location\nplease try again");
          state =
              const LocationDataState.error(message: "Unable to get location");
        }
      } else {
        debugPrint("Location is granted, service not enabled");
        final requestService = await location.requestService();
        if (requestService) {
          locationData = await location.getLocation();
          if (locationData.latitude != null || locationData.longitude != null) {
            debugPrint("location is not null 3");
            if (kDebugMode) {
              print(locationData);
            }
            state = LocationDataState.loaded(data: locationData);
          } else {
            debugPrint("location is null 4");
            showToast("Unable to get location\nplease try again");
            state = const LocationDataState.error(
                message: "Unable to get location");
          }
        }
      }
    } else if (status == PermissionStatus.denied) {
      debugPrint("Location is denied ");
      if (serviceEnabled) {
        debugPrint("Location is denied service is enabled");
        locationData = await location.getLocation();
        if (locationData.latitude != null || locationData.longitude != null) {
          debugPrint("location is not null 5");
          if (kDebugMode) {
            print(locationData);
          }
          state = LocationDataState.loaded(data: locationData);
        } else {
          debugPrint("location is null 6");
          showToast("Unable to get location\nplease try again");
          state =
              const LocationDataState.error(message: "Unable to get location");
        }
      } else {
        debugPrint("Location is denied service is not enabled");
        final requestService = await location.requestService();
        if (requestService) {
          locationData = await location.getLocation();
          if (locationData.latitude != null || locationData.longitude != null) {
            debugPrint("location is not null 7");
            if (kDebugMode) {
              print(locationData);
            }
            state = LocationDataState.loaded(data: locationData);
          } else {
            debugPrint("location is null 8");
            showToast("Unable to get location\nplease try again");
            state = const LocationDataState.error(
                message: "Unable to get location");
          }
        }
      }
    } else {
      debugPrint("Location is denied forever");
      status = await location.requestPermission();
      showPermissionPermanentlyDeniedDialog(context);
      // _handlePermissionDenied();
      if (status == PermissionStatus.granted ||
          status == PermissionStatus.grantedLimited) {
        locationData = await location.getLocation();
        if (locationData.latitude != null || locationData.longitude != null) {
          debugPrint("location is not null 9");
          if (kDebugMode) {
            print(locationData);
          }
          state = LocationDataState.loaded(data: locationData);
        } else {
          debugPrint("location is null 10");
          showToast("Unable to get location\nplease try again");
          state =
              const LocationDataState.error(message: "Unable to get location");
        }
      }
    }
  }

  showPermissionPermanentlyDeniedDialog(context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Location Permission"),
        content: const Text(
            "Location permission is permanently denied. You can enable it in the app settings."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              perm.openAppSettings(); // Open app settings
            },
            child: const Text(
              "Open Settings",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
