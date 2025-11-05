import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/domain/entities/vehicle.dart';
import 'package:ride_hailing/domain/repositories/rides.dart';
import 'package:ride_hailing/logic/state/vehicle_type_state.dart';

class GetVehicleTypesNotifier extends StateNotifier<VehicleTypeState> {
  GetVehicleTypesNotifier({
    required this.ref,
    required BaseRideRepository baseRideRepository,
  })  : _baseRideRepository = baseRideRepository,
        super(const VehicleTypeState.initial());

  final Ref ref;
  final BaseRideRepository _baseRideRepository;

  Future<void> getVehicleTypes() async {
    state = const VehicleTypeState.loading();
    final response = await _baseRideRepository.getVehicleTypes();
    response.fold((l) {
      state = VehicleTypeState.error(message: l.message);
    }, (r) {
      if (r.vehicles!.isEmpty) {
        state = const VehicleTypeState.empty();
      } else {
        for (var i = 0; i < r.vehicles!.length; i++) {
          saveCarTypeList(country: r.vehicles![i], index: i);
        }
        state = VehicleTypeState.loaded(data: r);
      }
    });
  }
}
