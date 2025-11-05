// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RideModel _$RideModelFromJson(Map<String, dynamic> json) {
  return _RideModel.fromJson(json);
}

/// @nodoc
mixin _$RideModel {
  int get id => throw _privateConstructorUsedError;
  String get pickUpLocationLat => throw _privateConstructorUsedError;
  String get pickUpLocationLong => throw _privateConstructorUsedError;
  String get dropOffLocationLat => throw _privateConstructorUsedError;
  String get dropOffLocationLong => throw _privateConstructorUsedError;
  int? get rider => throw _privateConstructorUsedError;
  int? get driver => throw _privateConstructorUsedError;
  String get tripFare => throw _privateConstructorUsedError;
  int get numberOfSeats => throw _privateConstructorUsedError;
  String? get totalRideTime => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RideModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RideModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RideModelCopyWith<RideModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideModelCopyWith<$Res> {
  factory $RideModelCopyWith(RideModel value, $Res Function(RideModel) then) =
      _$RideModelCopyWithImpl<$Res, RideModel>;
  @useResult
  $Res call(
      {int id,
      String pickUpLocationLat,
      String pickUpLocationLong,
      String dropOffLocationLat,
      String dropOffLocationLong,
      int? rider,
      int? driver,
      String tripFare,
      int numberOfSeats,
      String? totalRideTime,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$RideModelCopyWithImpl<$Res, $Val extends RideModel>
    implements $RideModelCopyWith<$Res> {
  _$RideModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RideModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pickUpLocationLat = null,
    Object? pickUpLocationLong = null,
    Object? dropOffLocationLat = null,
    Object? dropOffLocationLong = null,
    Object? rider = freezed,
    Object? driver = freezed,
    Object? tripFare = null,
    Object? numberOfSeats = null,
    Object? totalRideTime = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pickUpLocationLat: null == pickUpLocationLat
          ? _value.pickUpLocationLat
          : pickUpLocationLat // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpLocationLong: null == pickUpLocationLong
          ? _value.pickUpLocationLong
          : pickUpLocationLong // ignore: cast_nullable_to_non_nullable
              as String,
      dropOffLocationLat: null == dropOffLocationLat
          ? _value.dropOffLocationLat
          : dropOffLocationLat // ignore: cast_nullable_to_non_nullable
              as String,
      dropOffLocationLong: null == dropOffLocationLong
          ? _value.dropOffLocationLong
          : dropOffLocationLong // ignore: cast_nullable_to_non_nullable
              as String,
      rider: freezed == rider
          ? _value.rider
          : rider // ignore: cast_nullable_to_non_nullable
              as int?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as int?,
      tripFare: null == tripFare
          ? _value.tripFare
          : tripFare // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfSeats: null == numberOfSeats
          ? _value.numberOfSeats
          : numberOfSeats // ignore: cast_nullable_to_non_nullable
              as int,
      totalRideTime: freezed == totalRideTime
          ? _value.totalRideTime
          : totalRideTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RideModelImplCopyWith<$Res>
    implements $RideModelCopyWith<$Res> {
  factory _$$RideModelImplCopyWith(
          _$RideModelImpl value, $Res Function(_$RideModelImpl) then) =
      __$$RideModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String pickUpLocationLat,
      String pickUpLocationLong,
      String dropOffLocationLat,
      String dropOffLocationLong,
      int? rider,
      int? driver,
      String tripFare,
      int numberOfSeats,
      String? totalRideTime,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$RideModelImplCopyWithImpl<$Res>
    extends _$RideModelCopyWithImpl<$Res, _$RideModelImpl>
    implements _$$RideModelImplCopyWith<$Res> {
  __$$RideModelImplCopyWithImpl(
      _$RideModelImpl _value, $Res Function(_$RideModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RideModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pickUpLocationLat = null,
    Object? pickUpLocationLong = null,
    Object? dropOffLocationLat = null,
    Object? dropOffLocationLong = null,
    Object? rider = freezed,
    Object? driver = freezed,
    Object? tripFare = null,
    Object? numberOfSeats = null,
    Object? totalRideTime = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RideModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pickUpLocationLat: null == pickUpLocationLat
          ? _value.pickUpLocationLat
          : pickUpLocationLat // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpLocationLong: null == pickUpLocationLong
          ? _value.pickUpLocationLong
          : pickUpLocationLong // ignore: cast_nullable_to_non_nullable
              as String,
      dropOffLocationLat: null == dropOffLocationLat
          ? _value.dropOffLocationLat
          : dropOffLocationLat // ignore: cast_nullable_to_non_nullable
              as String,
      dropOffLocationLong: null == dropOffLocationLong
          ? _value.dropOffLocationLong
          : dropOffLocationLong // ignore: cast_nullable_to_non_nullable
              as String,
      rider: freezed == rider
          ? _value.rider
          : rider // ignore: cast_nullable_to_non_nullable
              as int?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as int?,
      tripFare: null == tripFare
          ? _value.tripFare
          : tripFare // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfSeats: null == numberOfSeats
          ? _value.numberOfSeats
          : numberOfSeats // ignore: cast_nullable_to_non_nullable
              as int,
      totalRideTime: freezed == totalRideTime
          ? _value.totalRideTime
          : totalRideTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RideModelImpl implements _RideModel {
  const _$RideModelImpl(
      {required this.id,
      required this.pickUpLocationLat,
      required this.pickUpLocationLong,
      required this.dropOffLocationLat,
      required this.dropOffLocationLong,
      required this.rider,
      required this.driver,
      required this.tripFare,
      required this.numberOfSeats,
      this.totalRideTime,
      required this.createdAt,
      required this.updatedAt});

  factory _$RideModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RideModelImplFromJson(json);

  @override
  final int id;
  @override
  final String pickUpLocationLat;
  @override
  final String pickUpLocationLong;
  @override
  final String dropOffLocationLat;
  @override
  final String dropOffLocationLong;
  @override
  final int? rider;
  @override
  final int? driver;
  @override
  final String tripFare;
  @override
  final int numberOfSeats;
  @override
  final String? totalRideTime;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'RideModel(id: $id, pickUpLocationLat: $pickUpLocationLat, pickUpLocationLong: $pickUpLocationLong, dropOffLocationLat: $dropOffLocationLat, dropOffLocationLong: $dropOffLocationLong, rider: $rider, driver: $driver, tripFare: $tripFare, numberOfSeats: $numberOfSeats, totalRideTime: $totalRideTime, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pickUpLocationLat, pickUpLocationLat) ||
                other.pickUpLocationLat == pickUpLocationLat) &&
            (identical(other.pickUpLocationLong, pickUpLocationLong) ||
                other.pickUpLocationLong == pickUpLocationLong) &&
            (identical(other.dropOffLocationLat, dropOffLocationLat) ||
                other.dropOffLocationLat == dropOffLocationLat) &&
            (identical(other.dropOffLocationLong, dropOffLocationLong) ||
                other.dropOffLocationLong == dropOffLocationLong) &&
            (identical(other.rider, rider) || other.rider == rider) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            (identical(other.tripFare, tripFare) ||
                other.tripFare == tripFare) &&
            (identical(other.numberOfSeats, numberOfSeats) ||
                other.numberOfSeats == numberOfSeats) &&
            (identical(other.totalRideTime, totalRideTime) ||
                other.totalRideTime == totalRideTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      pickUpLocationLat,
      pickUpLocationLong,
      dropOffLocationLat,
      dropOffLocationLong,
      rider,
      driver,
      tripFare,
      numberOfSeats,
      totalRideTime,
      createdAt,
      updatedAt);

  /// Create a copy of RideModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RideModelImplCopyWith<_$RideModelImpl> get copyWith =>
      __$$RideModelImplCopyWithImpl<_$RideModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RideModelImplToJson(
      this,
    );
  }
}

abstract class _RideModel implements RideModel {
  const factory _RideModel(
      {required final int id,
      required final String pickUpLocationLat,
      required final String pickUpLocationLong,
      required final String dropOffLocationLat,
      required final String dropOffLocationLong,
      required final int? rider,
      required final int? driver,
      required final String tripFare,
      required final int numberOfSeats,
      final String? totalRideTime,
      required final String createdAt,
      required final String updatedAt}) = _$RideModelImpl;

  factory _RideModel.fromJson(Map<String, dynamic> json) =
      _$RideModelImpl.fromJson;

  @override
  int get id;
  @override
  String get pickUpLocationLat;
  @override
  String get pickUpLocationLong;
  @override
  String get dropOffLocationLat;
  @override
  String get dropOffLocationLong;
  @override
  int? get rider;
  @override
  int? get driver;
  @override
  String get tripFare;
  @override
  int get numberOfSeats;
  @override
  String? get totalRideTime;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of RideModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RideModelImplCopyWith<_$RideModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
