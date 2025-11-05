// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_selected_rides.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FetchSelectedRideImpl _$$FetchSelectedRideImplFromJson(
        Map<String, dynamic> json) =>
    _$FetchSelectedRideImpl(
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => RideModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FetchSelectedRideImplToJson(
        _$FetchSelectedRideImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
