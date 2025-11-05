import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onehaven_flutter_challenge/domain/entities/ride.dart';
part 'fetch_ride_state.freezed.dart';

extension FetchRideStateGetters on FetchRideState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
  FetchRideEntity get data => (this as Loaded).data;
}

@freezed
abstract class FetchRideState with _$FetchRideState {
  const factory FetchRideState.initial() = Initial;
  const factory FetchRideState.loading() = Loading;
  const factory FetchRideState.loaded({required FetchRideEntity data}) = Loaded;
  const factory FetchRideState.error({required String message}) = ErrorMessage;
}
