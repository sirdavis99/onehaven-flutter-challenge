

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'get_vehicles.freezed.dart';
part 'get_vehicles.g.dart';

@freezed
class GetVehicles with _$GetVehicles {
  @HiveType(typeId: 2)
  const factory GetVehicles({
    @HiveField(0)
    bool? status,
    @HiveField(1)
    List<Vehicles>? vehicles,
  }) = _GetVehicles;

  factory GetVehicles.fromJson(Map<String, dynamic> json) =>
      _$GetVehiclesFromJson(json);
}

@freezed
class Vehicles with _$Vehicles {
  @HiveType(typeId: 3)
  const factory Vehicles({
    @HiveField(0) int? id,
    @HiveField(1) int? userId,
    @HiveField(2) String? plateNumber,
    @HiveField(3) int? carType,
    @HiveField(4) String? colour,
    @HiveField(5) String? license,
    @HiveField(6) String? createdAt,
    @HiveField(7) String? updatedAt,
    @HiveField(8) UserDetails? userDetails,
  }) = _Vehicles;

  factory Vehicles.fromJson(Map<String, dynamic> json) =>
      _$VehiclesFromJson(json);
}

@freezed
class UserDetails with _$UserDetails {
  @HiveType(typeId: 4)
  const factory UserDetails({
    @HiveField(0) int? id,
    @HiveField(1) String? firstName,
    @HiveField(2) String? middleName,
    @HiveField(3) String? lastName,
    @HiveField(4) String? emailAddress,
    @HiveField(5) String? phoneNumber,
    @HiveField(6) String? gender,
    @HiveField(7) String? dateOfBirth,
    @HiveField(8) String? role,
    @HiveField(9) String? password,
    @HiveField(10) String? profileStatus,
    @HiveField(11) String? driverProfileStatus,
    @HiveField(12) String? createdAt,
    @HiveField(13) String? updatedAt,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}
