import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:ride_hailing/data/repositories/location.dart';
import 'package:ride_hailing/domain/entities/ride.dart';
import 'package:ride_hailing/logic/state/location_data_state.dart';

final getLocationProvider =
    StateNotifierProvider<GetUserLocationNotifier, LocationDataState>((ref) {
  return GetUserLocationNotifier(ref: ref);
});

final camperaPositionProvider = StateProvider<CameraPosition?>(
  (ref) {
    return const CameraPosition(zoom: 19.59, target: LatLng(6.5244, 3.3792));
  },
);

final googleMapCompleterControllerProvider =
    Provider<Completer<GoogleMapController>>((ref) {
  return Completer<GoogleMapController>();
});

final googleMapControllerProvider = StateProvider<GoogleMapController?>((ref) {
  return;
});

final markerProvider = StateProvider<Set<Marker>>((ref) {
  return <Marker>{};
});

final pickUpLocationData = StateProvider<Prediction?>((ref) {
  return;
});

final destinationLocationData = StateProvider<Prediction?>((ref) {
  return;
});


final requestRidePayload = StateProvider<RequestRidePayload?>((ref) {
  return;
});


final tripType = StateProvider<String?>((ref) {
  return;
});
