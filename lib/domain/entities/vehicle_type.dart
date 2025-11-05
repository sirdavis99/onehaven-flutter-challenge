import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:ride_hailing/domain/entities/vehicle.dart';

part 'vehicle_type.freezed.dart';
part 'vehicle_type.g.dart';

@freezed
class VehicleType with _$VehicleType {
  @HiveType(typeId: 5)
  const factory VehicleType({
    @HiveField(0) bool? status,
    @HiveField(1) List<VehiclesData>? vehicles,
  }) = _VehicleType;

  factory VehicleType.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeFromJson(json);
}
