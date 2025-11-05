import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_hailing/domain/entities/ride_history.dart';
part 'get_ride_history_state.freezed.dart';

extension GetRideHistoryStateGetters on GetRideHistoryState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
  RideHistoryEntity get data => (this as Loaded).data;
}

@freezed
abstract class GetRideHistoryState with _$GetRideHistoryState {
  const factory GetRideHistoryState.initial() = Initial;
  const factory GetRideHistoryState.loading() = Loading;
  const factory GetRideHistoryState.empty() = Empty;
  const factory GetRideHistoryState.loaded({required RideHistoryEntity data}) = Loaded;
  const factory GetRideHistoryState.error({required String message}) = ErrorMessage;
}
