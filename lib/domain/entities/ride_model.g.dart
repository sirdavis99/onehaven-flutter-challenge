// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RideModelImpl _$$RideModelImplFromJson(Map<String, dynamic> json) =>
    _$RideModelImpl(
      id: (json['id'] as num).toInt(),
      pickUpLocationLat: json['pickUpLocationLat'] as String,
      pickUpLocationLong: json['pickUpLocationLong'] as String,
      dropOffLocationLat: json['dropOffLocationLat'] as String,
      dropOffLocationLong: json['dropOffLocationLong'] as String,
      rider: (json['rider'] as num?)?.toInt(),
      driver: (json['driver'] as num?)?.toInt(),
      tripFare: json['tripFare'] as String,
      numberOfSeats: (json['numberOfSeats'] as num).toInt(),
      totalRideTime: json['totalRideTime'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$RideModelImplToJson(_$RideModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pickUpLocationLat': instance.pickUpLocationLat,
      'pickUpLocationLong': instance.pickUpLocationLong,
      'dropOffLocationLat': instance.dropOffLocationLat,
      'dropOffLocationLong': instance.dropOffLocationLong,
      'rider': instance.rider,
      'driver': instance.driver,
      'tripFare': instance.tripFare,
      'numberOfSeats': instance.numberOfSeats,
      'totalRideTime': instance.totalRideTime,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
