import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/domain/repositories/rides.dart';

import '../../logic/state/get_vehicles_state.dart';

class GetVehiclesNotifier extends StateNotifier<GetVehicleState> {
  GetVehiclesNotifier({
    required this.ref,
    required BaseRideRepository baseRideRepository,
  })  : _baseRideRepository = baseRideRepository,
        super(const GetVehicleState.initial());

  final Ref ref;
  final BaseRideRepository _baseRideRepository;

  Future<void> getVehicles() async {
    state = const GetVehicleState.loading();
    final response = await _baseRideRepository.getVehicles();
    response.fold(
      (l) {
        state = GetVehicleState.error(message: l.message);
      },
      (r) {
        if (r.vehicles!.isEmpty) {
          state = const GetVehicleState.empty();
        } else {
          state = GetVehicleState.loaded(data: r);
        }
      },
    );
  }
}
