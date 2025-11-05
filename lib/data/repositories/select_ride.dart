import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/domain/repositories/rides.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/logic/provider/location_provider.dart';
import 'package:ride_hailing/logic/state/success_state.dart';

class SelectRideNotifier extends StateNotifier<SuccessState> {
  SelectRideNotifier({
    required this.ref,
    required BaseRideRepository baseRideRepository,
  })  : _baseRideRepository = baseRideRepository,
        super(const SuccessState.initial());

  final Ref ref;
  final BaseRideRepository _baseRideRepository;

  Future<void> selectRide(
      String rideId, BuildContext context, String driverName) async {
    state = const SuccessState.loading();
    final response = await _baseRideRepository.selectRide(rideId);
    response.fold(
      (l) {
        state = SuccessState.error(message: l.message);
      },
      (r) {
        ref.read(pickUpLocationData.notifier).state = null;
        ref.read(destinationLocationData.notifier).state = null;
        ref.read(requestRidePayload.notifier).state = null;
        Navigator.pushNamed(
          context,
          RouteGenerator.successPage,
          arguments: "You have successfully selected a ride with $driverName",
        );
        state = const SuccessState.loaded();
      },
    );
  }
}
