import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_hailing/domain/entities/request_ride.dart';

part 'request_ride.freezed.dart';

extension RequestRideStateGetters on RequestRideState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
   RequestRideEntity? get data =>
      maybeWhen(loaded: (response) => response, orElse: () => null);
  //RequestRideEntity get data => (this as Loaded).data;
}

@freezed
abstract class RequestRideState with _$RequestRideState {
  const factory RequestRideState.initial() = Initial;
  const factory RequestRideState.loading() = Loading;
  const factory RequestRideState.loaded({required RequestRideEntity data}) = Loaded;
  const factory RequestRideState.error({required String message}) = ErrorMessage;
}
