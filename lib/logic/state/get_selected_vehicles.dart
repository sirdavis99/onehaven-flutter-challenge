import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_hailing/domain/entities/fetch_selected_rides.dart';
part 'get_selected_vehicles.freezed.dart';

extension GetSelectedRideStateGetters on GetSelectedRideState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
  FetchSelectedRide get data => (this as Loaded).data;
}

@freezed
abstract class GetSelectedRideState with _$GetSelectedRideState {
  const factory GetSelectedRideState.initial() = Initial;
  const factory GetSelectedRideState.loading() = Loading;
  const factory GetSelectedRideState.empty() = Empty;
  const factory GetSelectedRideState.loaded({required FetchSelectedRide data}) =
      Loaded;
  const factory GetSelectedRideState.error({required String message}) =
      ErrorMessage;
}
