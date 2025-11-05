


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';
part 'location_data_state.freezed.dart';

extension LocationDataStateGetters on LocationDataState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;

  LocationData? get data => maybeWhen(
        loaded: (plpData) => plpData,
        orElse: () => null,
      );
 
}

@freezed
abstract class LocationDataState with _$LocationDataState {
  const factory LocationDataState.initial() = Initial;
  const factory LocationDataState.loading() = Loading;
  const factory LocationDataState.loaded({required LocationData data}) = Loaded;
  const factory LocationDataState.error({required String message}) = ErrorMessage;
}
