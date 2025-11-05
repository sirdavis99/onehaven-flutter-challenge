import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/data/datasources/rides.dart';
import 'package:ride_hailing/data/repositories/fetch_ride.dart';
import 'package:ride_hailing/data/repositories/get_ride_history.dart';
import 'package:ride_hailing/data/repositories/get_selected_vehicles.dart';
import 'package:ride_hailing/data/repositories/get_vehicle_types.dart';
import 'package:ride_hailing/data/repositories/request_ride.dart';
import 'package:ride_hailing/data/repositories/select_ride.dart';
import 'package:ride_hailing/domain/repositories/rides.dart';
import 'package:ride_hailing/logic/state/fetch_ride_state.dart';
import 'package:ride_hailing/logic/state/get_ride_history_state.dart';
import 'package:ride_hailing/logic/state/get_selected_vehicles.dart';
import 'package:ride_hailing/logic/state/request_ride.dart';
import 'package:ride_hailing/logic/state/success_state.dart';
import 'package:ride_hailing/logic/state/vehicle_type_state.dart';
import '../../data/repositories/get_vehicles.dart';
import '../state/get_vehicles_state.dart';


final selectRideProvider =
    StateNotifierProvider<SelectRideNotifier, SuccessState>((ref) {
  return SelectRideNotifier(
    ref: ref,
    baseRideRepository: ref.watch(rideProvider),
  );
});

final getSelectedVehiclesProvider =
    StateNotifierProvider<GetSelectedVehiclesNotifier, GetSelectedRideState>(
        (ref) {
  return GetSelectedVehiclesNotifier(
    ref: ref,
    baseRideRepository: ref.watch(rideProvider),
  );
});

final getVehiclesProvider =
    StateNotifierProvider<GetVehiclesNotifier, GetVehicleState>((ref) {
  return GetVehiclesNotifier(
    ref: ref,
    baseRideRepository: ref.watch(rideProvider),
  );
});

final getVehicleTypeProvider =
    StateNotifierProvider<GetVehicleTypesNotifier, VehicleTypeState>((ref) {
  return GetVehicleTypesNotifier(
    ref: ref,
    baseRideRepository: ref.watch(rideProvider),
  );
});

final fetchRideProvider =
    StateNotifierProvider<FetchRidesNotifier, FetchRideState>((ref) {
  return FetchRidesNotifier(
    ref: ref,
    baseRideRepository: ref.watch(rideProvider),
  );
});

final getRideHistoryProvider =
    StateNotifierProvider<GetRideHistoryNotifier, GetRideHistoryState>((ref) {
  return GetRideHistoryNotifier(
    ref: ref,
    baseRideRepository: ref.watch(rideProvider),
  );
});

final requestRideProvider =
    StateNotifierProvider<RequestRideNotifier, RequestRideState>((ref) {
  return RequestRideNotifier(
    ref: ref,
    baseRideRepository: ref.watch(rideProvider),
  );
});

final rideProvider = Provider<BaseRideRepository>((ref) {
  return RideRepository();
});
