import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_hailing/domain/entities/vehicle_type.dart';

part 'vehicle_type_state.freezed.dart';

extension VehicleTypeStateGetters on VehicleTypeState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
}

@freezed
abstract class VehicleTypeState with _$VehicleTypeState {
  const factory VehicleTypeState.initial() = Initial;
  const factory VehicleTypeState.loading() = Loading;
  const factory VehicleTypeState.empty() = Empty;
  const factory VehicleTypeState.loaded({required VehicleType data}) = Loaded;
  const factory VehicleTypeState.error({required String message}) =
      ErrorMessage;
}
