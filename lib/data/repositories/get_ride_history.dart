import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/domain/repositories/rides.dart';
import 'package:ride_hailing/logic/state/get_ride_history_state.dart';

class GetRideHistoryNotifier extends StateNotifier<GetRideHistoryState> {
  GetRideHistoryNotifier(
      {required this.ref, required BaseRideRepository baseRideRepository})
      : _baseRideRepository = baseRideRepository,
        super(const GetRideHistoryState.initial());

  final Ref ref;
  final BaseRideRepository _baseRideRepository;

  Future<void> getRideHistory() async {
    state = const GetRideHistoryState.loading();
    final response = await _baseRideRepository.getRideHistory();
    response.fold((l) {
      state = GetRideHistoryState.error(message: l.message);
    }, (r) {
      if (r.rideHistory!.isEmpty) {
        state = const GetRideHistoryState.empty();
      } else {
        state = GetRideHistoryState.loaded(data: r);
      }
    });
  }
}
