


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_hailing/domain/entities/get_vehicles.dart';

part 'get_vehicles_state.freezed.dart';

extension GetVehicleStateGetters on GetVehicleState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
}

@freezed
abstract class GetVehicleState with _$GetVehicleState {
  const factory GetVehicleState.initial() = Initial;
  const factory GetVehicleState.loading() = Loading;
  const factory GetVehicleState.empty() = Empty;
  const factory GetVehicleState.loaded({required GetVehicles data}) = Loaded;
  const factory GetVehicleState.error({required String message}) =
      ErrorMessage;
}
