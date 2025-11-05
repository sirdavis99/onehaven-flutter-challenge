import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_hailing/domain/entities/ride_model.dart';

part 'fetch_selected_rides.freezed.dart';
part 'fetch_selected_rides.g.dart';

@freezed
class FetchSelectedRide with _$FetchSelectedRide {
  const factory FetchSelectedRide({
    required bool status,
    required List<RideModel> data,
  }) = _FetchSelectedRide;

  factory FetchSelectedRide.fromJson(Map<String, dynamic> json) =>
      _$FetchSelectedRideFromJson(json);
}
