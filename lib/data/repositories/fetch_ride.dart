import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ride_hailing/domain/repositories/rides.dart';

import '../../logic/state/fetch_ride_state.dart';

class FetchRidesNotifier extends StateNotifier<FetchRideState> {
  FetchRidesNotifier(
      {required this.ref, required BaseRideRepository baseRideRepository})
      : _baseRideRepository = baseRideRepository,
        super(const FetchRideState.initial());

  final Ref ref;
  final BaseRideRepository _baseRideRepository;

  Future<void> fetchRides() async {
    state = const FetchRideState.loading();
    final response = await _baseRideRepository.fetchRide();
    response.fold(
      (l) => state = FetchRideState.error(message: l.message),
      (r) => FetchRideState.loaded(data: r),
    );
  }
}
