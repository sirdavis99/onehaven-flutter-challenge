// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_selected_rides.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FetchSelectedRide _$FetchSelectedRideFromJson(Map<String, dynamic> json) {
  return _FetchSelectedRide.fromJson(json);
}

/// @nodoc
mixin _$FetchSelectedRide {
  bool get status => throw _privateConstructorUsedError;
  List<RideModel> get data => throw _privateConstructorUsedError;

  /// Serializes this FetchSelectedRide to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FetchSelectedRide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FetchSelectedRideCopyWith<FetchSelectedRide> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchSelectedRideCopyWith<$Res> {
  factory $FetchSelectedRideCopyWith(
          FetchSelectedRide value, $Res Function(FetchSelectedRide) then) =
      _$FetchSelectedRideCopyWithImpl<$Res, FetchSelectedRide>;
  @useResult
  $Res call({bool status, List<RideModel> data});
}

/// @nodoc
class _$FetchSelectedRideCopyWithImpl<$Res, $Val extends FetchSelectedRide>
    implements $FetchSelectedRideCopyWith<$Res> {
  _$FetchSelectedRideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FetchSelectedRide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RideModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchSelectedRideImplCopyWith<$Res>
    implements $FetchSelectedRideCopyWith<$Res> {
  factory _$$FetchSelectedRideImplCopyWith(_$FetchSelectedRideImpl value,
          $Res Function(_$FetchSelectedRideImpl) then) =
      __$$FetchSelectedRideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, List<RideModel> data});
}

/// @nodoc
class __$$FetchSelectedRideImplCopyWithImpl<$Res>
    extends _$FetchSelectedRideCopyWithImpl<$Res, _$FetchSelectedRideImpl>
    implements _$$FetchSelectedRideImplCopyWith<$Res> {
  __$$FetchSelectedRideImplCopyWithImpl(_$FetchSelectedRideImpl _value,
      $Res Function(_$FetchSelectedRideImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchSelectedRide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$FetchSelectedRideImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RideModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchSelectedRideImpl implements _FetchSelectedRide {
  const _$FetchSelectedRideImpl(
      {required this.status, required final List<RideModel> data})
      : _data = data;

  factory _$FetchSelectedRideImpl.fromJson(Map<String, dynamic> json) =>
      _$$FetchSelectedRideImplFromJson(json);

  @override
  final bool status;
  final List<RideModel> _data;
  @override
  List<RideModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FetchSelectedRide(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchSelectedRideImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  /// Create a copy of FetchSelectedRide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchSelectedRideImplCopyWith<_$FetchSelectedRideImpl> get copyWith =>
      __$$FetchSelectedRideImplCopyWithImpl<_$FetchSelectedRideImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchSelectedRideImplToJson(
      this,
    );
  }
}

abstract class _FetchSelectedRide implements FetchSelectedRide {
  const factory _FetchSelectedRide(
      {required final bool status,
      required final List<RideModel> data}) = _$FetchSelectedRideImpl;

  factory _FetchSelectedRide.fromJson(Map<String, dynamic> json) =
      _$FetchSelectedRideImpl.fromJson;

  @override
  bool get status;
  @override
  List<RideModel> get data;

  /// Create a copy of FetchSelectedRide
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchSelectedRideImplCopyWith<_$FetchSelectedRideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
