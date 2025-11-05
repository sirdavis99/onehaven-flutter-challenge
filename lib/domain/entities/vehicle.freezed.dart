// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehiclesData _$VehiclesDataFromJson(Map<String, dynamic> json) {
  return _VehiclesData.fromJson(json);
}

/// @nodoc
mixin _$VehiclesData {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get carType => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get createdAt => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this VehiclesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehiclesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehiclesDataCopyWith<VehiclesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehiclesDataCopyWith<$Res> {
  factory $VehiclesDataCopyWith(
          VehiclesData value, $Res Function(VehiclesData) then) =
      _$VehiclesDataCopyWithImpl<$Res, VehiclesData>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? carType,
      @HiveField(2) String? createdAt,
      @HiveField(3) String? updatedAt});
}

/// @nodoc
class _$VehiclesDataCopyWithImpl<$Res, $Val extends VehiclesData>
    implements $VehiclesDataCopyWith<$Res> {
  _$VehiclesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehiclesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? carType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      carType: freezed == carType
          ? _value.carType
          : carType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehiclesDataImplCopyWith<$Res>
    implements $VehiclesDataCopyWith<$Res> {
  factory _$$VehiclesDataImplCopyWith(
          _$VehiclesDataImpl value, $Res Function(_$VehiclesDataImpl) then) =
      __$$VehiclesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? carType,
      @HiveField(2) String? createdAt,
      @HiveField(3) String? updatedAt});
}

/// @nodoc
class __$$VehiclesDataImplCopyWithImpl<$Res>
    extends _$VehiclesDataCopyWithImpl<$Res, _$VehiclesDataImpl>
    implements _$$VehiclesDataImplCopyWith<$Res> {
  __$$VehiclesDataImplCopyWithImpl(
      _$VehiclesDataImpl _value, $Res Function(_$VehiclesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehiclesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? carType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$VehiclesDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      carType: freezed == carType
          ? _value.carType
          : carType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 6)
class _$VehiclesDataImpl implements _VehiclesData {
  const _$VehiclesDataImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.carType,
      @HiveField(2) this.createdAt,
      @HiveField(3) this.updatedAt});

  factory _$VehiclesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehiclesDataImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? carType;
  @override
  @HiveField(2)
  final String? createdAt;
  @override
  @HiveField(3)
  final String? updatedAt;

  @override
  String toString() {
    return 'VehiclesData(id: $id, carType: $carType, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehiclesDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.carType, carType) || other.carType == carType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, carType, createdAt, updatedAt);

  /// Create a copy of VehiclesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehiclesDataImplCopyWith<_$VehiclesDataImpl> get copyWith =>
      __$$VehiclesDataImplCopyWithImpl<_$VehiclesDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehiclesDataImplToJson(
      this,
    );
  }
}

abstract class _VehiclesData implements VehiclesData {
  const factory _VehiclesData(
      {@HiveField(0) final int? id,
      @HiveField(1) final String? carType,
      @HiveField(2) final String? createdAt,
      @HiveField(3) final String? updatedAt}) = _$VehiclesDataImpl;

  factory _VehiclesData.fromJson(Map<String, dynamic> json) =
      _$VehiclesDataImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get carType;
  @override
  @HiveField(2)
  String? get createdAt;
  @override
  @HiveField(3)
  String? get updatedAt;

  /// Create a copy of VehiclesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehiclesDataImplCopyWith<_$VehiclesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
