// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_vehicles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetVehicles _$GetVehiclesFromJson(Map<String, dynamic> json) {
  return _GetVehicles.fromJson(json);
}

/// @nodoc
mixin _$GetVehicles {
  @HiveField(0)
  bool? get status => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Vehicles>? get vehicles => throw _privateConstructorUsedError;

  /// Serializes this GetVehicles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetVehicles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetVehiclesCopyWith<GetVehicles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetVehiclesCopyWith<$Res> {
  factory $GetVehiclesCopyWith(
          GetVehicles value, $Res Function(GetVehicles) then) =
      _$GetVehiclesCopyWithImpl<$Res, GetVehicles>;
  @useResult
  $Res call(
      {@HiveField(0) bool? status, @HiveField(1) List<Vehicles>? vehicles});
}

/// @nodoc
class _$GetVehiclesCopyWithImpl<$Res, $Val extends GetVehicles>
    implements $GetVehiclesCopyWith<$Res> {
  _$GetVehiclesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetVehicles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? vehicles = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      vehicles: freezed == vehicles
          ? _value.vehicles
          : vehicles // ignore: cast_nullable_to_non_nullable
              as List<Vehicles>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetVehiclesImplCopyWith<$Res>
    implements $GetVehiclesCopyWith<$Res> {
  factory _$$GetVehiclesImplCopyWith(
          _$GetVehiclesImpl value, $Res Function(_$GetVehiclesImpl) then) =
      __$$GetVehiclesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) bool? status, @HiveField(1) List<Vehicles>? vehicles});
}

/// @nodoc
class __$$GetVehiclesImplCopyWithImpl<$Res>
    extends _$GetVehiclesCopyWithImpl<$Res, _$GetVehiclesImpl>
    implements _$$GetVehiclesImplCopyWith<$Res> {
  __$$GetVehiclesImplCopyWithImpl(
      _$GetVehiclesImpl _value, $Res Function(_$GetVehiclesImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetVehicles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? vehicles = freezed,
  }) {
    return _then(_$GetVehiclesImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      vehicles: freezed == vehicles
          ? _value._vehicles
          : vehicles // ignore: cast_nullable_to_non_nullable
              as List<Vehicles>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2)
class _$GetVehiclesImpl implements _GetVehicles {
  const _$GetVehiclesImpl(
      {@HiveField(0) this.status, @HiveField(1) final List<Vehicles>? vehicles})
      : _vehicles = vehicles;

  factory _$GetVehiclesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetVehiclesImplFromJson(json);

  @override
  @HiveField(0)
  final bool? status;
  final List<Vehicles>? _vehicles;
  @override
  @HiveField(1)
  List<Vehicles>? get vehicles {
    final value = _vehicles;
    if (value == null) return null;
    if (_vehicles is EqualUnmodifiableListView) return _vehicles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetVehicles(status: $status, vehicles: $vehicles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVehiclesImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._vehicles, _vehicles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_vehicles));

  /// Create a copy of GetVehicles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetVehiclesImplCopyWith<_$GetVehiclesImpl> get copyWith =>
      __$$GetVehiclesImplCopyWithImpl<_$GetVehiclesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetVehiclesImplToJson(
      this,
    );
  }
}

abstract class _GetVehicles implements GetVehicles {
  const factory _GetVehicles(
      {@HiveField(0) final bool? status,
      @HiveField(1) final List<Vehicles>? vehicles}) = _$GetVehiclesImpl;

  factory _GetVehicles.fromJson(Map<String, dynamic> json) =
      _$GetVehiclesImpl.fromJson;

  @override
  @HiveField(0)
  bool? get status;
  @override
  @HiveField(1)
  List<Vehicles>? get vehicles;

  /// Create a copy of GetVehicles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetVehiclesImplCopyWith<_$GetVehiclesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Vehicles _$VehiclesFromJson(Map<String, dynamic> json) {
  return _Vehicles.fromJson(json);
}

/// @nodoc
mixin _$Vehicles {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get plateNumber => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get carType => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get colour => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get license => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get createdAt => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(8)
  UserDetails? get userDetails => throw _privateConstructorUsedError;

  /// Serializes this Vehicles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vehicles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehiclesCopyWith<Vehicles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehiclesCopyWith<$Res> {
  factory $VehiclesCopyWith(Vehicles value, $Res Function(Vehicles) then) =
      _$VehiclesCopyWithImpl<$Res, Vehicles>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) int? userId,
      @HiveField(2) String? plateNumber,
      @HiveField(3) int? carType,
      @HiveField(4) String? colour,
      @HiveField(5) String? license,
      @HiveField(6) String? createdAt,
      @HiveField(7) String? updatedAt,
      @HiveField(8) UserDetails? userDetails});

  $UserDetailsCopyWith<$Res>? get userDetails;
}

/// @nodoc
class _$VehiclesCopyWithImpl<$Res, $Val extends Vehicles>
    implements $VehiclesCopyWith<$Res> {
  _$VehiclesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vehicles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? plateNumber = freezed,
    Object? carType = freezed,
    Object? colour = freezed,
    Object? license = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      carType: freezed == carType
          ? _value.carType
          : carType // ignore: cast_nullable_to_non_nullable
              as int?,
      colour: freezed == colour
          ? _value.colour
          : colour // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
    ) as $Val);
  }

  /// Create a copy of Vehicles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res>? get userDetails {
    if (_value.userDetails == null) {
      return null;
    }

    return $UserDetailsCopyWith<$Res>(_value.userDetails!, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehiclesImplCopyWith<$Res>
    implements $VehiclesCopyWith<$Res> {
  factory _$$VehiclesImplCopyWith(
          _$VehiclesImpl value, $Res Function(_$VehiclesImpl) then) =
      __$$VehiclesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) int? userId,
      @HiveField(2) String? plateNumber,
      @HiveField(3) int? carType,
      @HiveField(4) String? colour,
      @HiveField(5) String? license,
      @HiveField(6) String? createdAt,
      @HiveField(7) String? updatedAt,
      @HiveField(8) UserDetails? userDetails});

  @override
  $UserDetailsCopyWith<$Res>? get userDetails;
}

/// @nodoc
class __$$VehiclesImplCopyWithImpl<$Res>
    extends _$VehiclesCopyWithImpl<$Res, _$VehiclesImpl>
    implements _$$VehiclesImplCopyWith<$Res> {
  __$$VehiclesImplCopyWithImpl(
      _$VehiclesImpl _value, $Res Function(_$VehiclesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vehicles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? plateNumber = freezed,
    Object? carType = freezed,
    Object? colour = freezed,
    Object? license = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userDetails = freezed,
  }) {
    return _then(_$VehiclesImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      carType: freezed == carType
          ? _value.carType
          : carType // ignore: cast_nullable_to_non_nullable
              as int?,
      colour: freezed == colour
          ? _value.colour
          : colour // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3)
class _$VehiclesImpl implements _Vehicles {
  const _$VehiclesImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.userId,
      @HiveField(2) this.plateNumber,
      @HiveField(3) this.carType,
      @HiveField(4) this.colour,
      @HiveField(5) this.license,
      @HiveField(6) this.createdAt,
      @HiveField(7) this.updatedAt,
      @HiveField(8) this.userDetails});

  factory _$VehiclesImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehiclesImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final int? userId;
  @override
  @HiveField(2)
  final String? plateNumber;
  @override
  @HiveField(3)
  final int? carType;
  @override
  @HiveField(4)
  final String? colour;
  @override
  @HiveField(5)
  final String? license;
  @override
  @HiveField(6)
  final String? createdAt;
  @override
  @HiveField(7)
  final String? updatedAt;
  @override
  @HiveField(8)
  final UserDetails? userDetails;

  @override
  String toString() {
    return 'Vehicles(id: $id, userId: $userId, plateNumber: $plateNumber, carType: $carType, colour: $colour, license: $license, createdAt: $createdAt, updatedAt: $updatedAt, userDetails: $userDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehiclesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.plateNumber, plateNumber) ||
                other.plateNumber == plateNumber) &&
            (identical(other.carType, carType) || other.carType == carType) &&
            (identical(other.colour, colour) || other.colour == colour) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, plateNumber, carType,
      colour, license, createdAt, updatedAt, userDetails);

  /// Create a copy of Vehicles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehiclesImplCopyWith<_$VehiclesImpl> get copyWith =>
      __$$VehiclesImplCopyWithImpl<_$VehiclesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehiclesImplToJson(
      this,
    );
  }
}

abstract class _Vehicles implements Vehicles {
  const factory _Vehicles(
      {@HiveField(0) final int? id,
      @HiveField(1) final int? userId,
      @HiveField(2) final String? plateNumber,
      @HiveField(3) final int? carType,
      @HiveField(4) final String? colour,
      @HiveField(5) final String? license,
      @HiveField(6) final String? createdAt,
      @HiveField(7) final String? updatedAt,
      @HiveField(8) final UserDetails? userDetails}) = _$VehiclesImpl;

  factory _Vehicles.fromJson(Map<String, dynamic> json) =
      _$VehiclesImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  int? get userId;
  @override
  @HiveField(2)
  String? get plateNumber;
  @override
  @HiveField(3)
  int? get carType;
  @override
  @HiveField(4)
  String? get colour;
  @override
  @HiveField(5)
  String? get license;
  @override
  @HiveField(6)
  String? get createdAt;
  @override
  @HiveField(7)
  String? get updatedAt;
  @override
  @HiveField(8)
  UserDetails? get userDetails;

  /// Create a copy of Vehicles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehiclesImplCopyWith<_$VehiclesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return _UserDetails.fromJson(json);
}

/// @nodoc
mixin _$UserDetails {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get middleName => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get emailAddress => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get gender => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get role => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get password => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get profileStatus => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get driverProfileStatus => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get createdAt => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailsCopyWith<UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(
          UserDetails value, $Res Function(UserDetails) then) =
      _$UserDetailsCopyWithImpl<$Res, UserDetails>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
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
      @HiveField(13) String? updatedAt});
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? emailAddress = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? role = freezed,
    Object? password = freezed,
    Object? profileStatus = freezed,
    Object? driverProfileStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      profileStatus: freezed == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      driverProfileStatus: freezed == driverProfileStatus
          ? _value.driverProfileStatus
          : driverProfileStatus // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UserDetailsImplCopyWith<$Res>
    implements $UserDetailsCopyWith<$Res> {
  factory _$$UserDetailsImplCopyWith(
          _$UserDetailsImpl value, $Res Function(_$UserDetailsImpl) then) =
      __$$UserDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
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
      @HiveField(13) String? updatedAt});
}

/// @nodoc
class __$$UserDetailsImplCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$UserDetailsImpl>
    implements _$$UserDetailsImplCopyWith<$Res> {
  __$$UserDetailsImplCopyWithImpl(
      _$UserDetailsImpl _value, $Res Function(_$UserDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? emailAddress = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? role = freezed,
    Object? password = freezed,
    Object? profileStatus = freezed,
    Object? driverProfileStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      profileStatus: freezed == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      driverProfileStatus: freezed == driverProfileStatus
          ? _value.driverProfileStatus
          : driverProfileStatus // ignore: cast_nullable_to_non_nullable
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
@HiveType(typeId: 4)
class _$UserDetailsImpl implements _UserDetails {
  const _$UserDetailsImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.firstName,
      @HiveField(2) this.middleName,
      @HiveField(3) this.lastName,
      @HiveField(4) this.emailAddress,
      @HiveField(5) this.phoneNumber,
      @HiveField(6) this.gender,
      @HiveField(7) this.dateOfBirth,
      @HiveField(8) this.role,
      @HiveField(9) this.password,
      @HiveField(10) this.profileStatus,
      @HiveField(11) this.driverProfileStatus,
      @HiveField(12) this.createdAt,
      @HiveField(13) this.updatedAt});

  factory _$UserDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailsImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? firstName;
  @override
  @HiveField(2)
  final String? middleName;
  @override
  @HiveField(3)
  final String? lastName;
  @override
  @HiveField(4)
  final String? emailAddress;
  @override
  @HiveField(5)
  final String? phoneNumber;
  @override
  @HiveField(6)
  final String? gender;
  @override
  @HiveField(7)
  final String? dateOfBirth;
  @override
  @HiveField(8)
  final String? role;
  @override
  @HiveField(9)
  final String? password;
  @override
  @HiveField(10)
  final String? profileStatus;
  @override
  @HiveField(11)
  final String? driverProfileStatus;
  @override
  @HiveField(12)
  final String? createdAt;
  @override
  @HiveField(13)
  final String? updatedAt;

  @override
  String toString() {
    return 'UserDetails(id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, gender: $gender, dateOfBirth: $dateOfBirth, role: $role, password: $password, profileStatus: $profileStatus, driverProfileStatus: $driverProfileStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            (identical(other.driverProfileStatus, driverProfileStatus) ||
                other.driverProfileStatus == driverProfileStatus) &&
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
      firstName,
      middleName,
      lastName,
      emailAddress,
      phoneNumber,
      gender,
      dateOfBirth,
      role,
      password,
      profileStatus,
      driverProfileStatus,
      createdAt,
      updatedAt);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      __$$UserDetailsImplCopyWithImpl<_$UserDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailsImplToJson(
      this,
    );
  }
}

abstract class _UserDetails implements UserDetails {
  const factory _UserDetails(
      {@HiveField(0) final int? id,
      @HiveField(1) final String? firstName,
      @HiveField(2) final String? middleName,
      @HiveField(3) final String? lastName,
      @HiveField(4) final String? emailAddress,
      @HiveField(5) final String? phoneNumber,
      @HiveField(6) final String? gender,
      @HiveField(7) final String? dateOfBirth,
      @HiveField(8) final String? role,
      @HiveField(9) final String? password,
      @HiveField(10) final String? profileStatus,
      @HiveField(11) final String? driverProfileStatus,
      @HiveField(12) final String? createdAt,
      @HiveField(13) final String? updatedAt}) = _$UserDetailsImpl;

  factory _UserDetails.fromJson(Map<String, dynamic> json) =
      _$UserDetailsImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get firstName;
  @override
  @HiveField(2)
  String? get middleName;
  @override
  @HiveField(3)
  String? get lastName;
  @override
  @HiveField(4)
  String? get emailAddress;
  @override
  @HiveField(5)
  String? get phoneNumber;
  @override
  @HiveField(6)
  String? get gender;
  @override
  @HiveField(7)
  String? get dateOfBirth;
  @override
  @HiveField(8)
  String? get role;
  @override
  @HiveField(9)
  String? get password;
  @override
  @HiveField(10)
  String? get profileStatus;
  @override
  @HiveField(11)
  String? get driverProfileStatus;
  @override
  @HiveField(12)
  String? get createdAt;
  @override
  @HiveField(13)
  String? get updatedAt;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
