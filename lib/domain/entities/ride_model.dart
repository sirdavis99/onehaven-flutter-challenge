import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride_model.freezed.dart';
part 'ride_model.g.dart';

@freezed
class RideModel with _$RideModel {
  const factory RideModel({
    required int id,
    required String pickUpLocationLat,
    required String pickUpLocationLong,
    required String dropOffLocationLat,
    required String dropOffLocationLong,
    required int? rider,
    required int? driver,
    required String tripFare,
    required int numberOfSeats,
    String? totalRideTime,
    required String createdAt,
    required String updatedAt,
  }) = _RideModel;

  factory RideModel.fromJson(Map<String, dynamic> json) =>
      _$RideModelFromJson(json);
}
