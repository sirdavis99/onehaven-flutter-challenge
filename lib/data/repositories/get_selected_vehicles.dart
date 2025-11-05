import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/domain/repositories/rides.dart';
import 'package:ride_hailing/logic/state/get_selected_vehicles.dart';

class GetSelectedVehiclesNotifier extends StateNotifier<GetSelectedRideState> {
  GetSelectedVehiclesNotifier({
    required this.ref,
    required BaseRideRepository baseRideRepository,
  })  : _baseRideRepository = baseRideRepository,
        super(const GetSelectedRideState.initial());

  final Ref ref;
  final BaseRideRepository _baseRideRepository;

  Future<void> getSelectedVehicles() async {
    state = const GetSelectedRideState.loading();
    final response = await _baseRideRepository.getSelectedVehicles();
    response.fold(
      (l) {
        state = GetSelectedRideState.error(message: l.message);
      },
      (r) {
        if (r.data.isEmpty) {
          state = const GetSelectedRideState.empty();
        } else {
          state = GetSelectedRideState.loaded(data: r);
        }
      },
    );
  }
}
