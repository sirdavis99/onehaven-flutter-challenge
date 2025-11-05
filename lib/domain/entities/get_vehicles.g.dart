// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vehicles.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetVehiclesImplAdapter extends TypeAdapter<_$GetVehiclesImpl> {
  @override
  final int typeId = 2;

  @override
  _$GetVehiclesImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$GetVehiclesImpl(
      status: fields[0] as bool?,
      vehicles: (fields[1] as List?)?.cast<Vehicles>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$GetVehiclesImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.vehicles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetVehiclesImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehiclesImplAdapter extends TypeAdapter<_$VehiclesImpl> {
  @override
  final int typeId = 3;

  @override
  _$VehiclesImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$VehiclesImpl(
      id: fields[0] as int?,
      userId: fields[1] as int?,
      plateNumber: fields[2] as String?,
      carType: fields[3] as int?,
      colour: fields[4] as String?,
      license: fields[5] as String?,
      createdAt: fields[6] as String?,
      updatedAt: fields[7] as String?,
      userDetails: fields[8] as UserDetails?,
    );
  }

  @override
  void write(BinaryWriter writer, _$VehiclesImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.plateNumber)
      ..writeByte(3)
      ..write(obj.carType)
      ..writeByte(4)
      ..write(obj.colour)
      ..writeByte(5)
      ..write(obj.license)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.userDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehiclesImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserDetailsImplAdapter extends TypeAdapter<_$UserDetailsImpl> {
  @override
  final int typeId = 4;

  @override
  _$UserDetailsImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserDetailsImpl(
      id: fields[0] as int?,
      firstName: fields[1] as String?,
      middleName: fields[2] as String?,
      lastName: fields[3] as String?,
      emailAddress: fields[4] as String?,
      phoneNumber: fields[5] as String?,
      gender: fields[6] as String?,
      dateOfBirth: fields[7] as String?,
      role: fields[8] as String?,
      password: fields[9] as String?,
      profileStatus: fields[10] as String?,
      driverProfileStatus: fields[11] as String?,
      createdAt: fields[12] as String?,
      updatedAt: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserDetailsImpl obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.middleName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.emailAddress)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.dateOfBirth)
      ..writeByte(8)
      ..write(obj.role)
      ..writeByte(9)
      ..write(obj.password)
      ..writeByte(10)
      ..write(obj.profileStatus)
      ..writeByte(11)
      ..write(obj.driverProfileStatus)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetVehiclesImpl _$$GetVehiclesImplFromJson(Map<String, dynamic> json) =>
    _$GetVehiclesImpl(
      status: json['status'] as bool?,
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => Vehicles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetVehiclesImplToJson(_$GetVehiclesImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'vehicles': instance.vehicles,
    };

_$VehiclesImpl _$$VehiclesImplFromJson(Map<String, dynamic> json) =>
    _$VehiclesImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      plateNumber: json['plateNumber'] as String?,
      carType: (json['carType'] as num?)?.toInt(),
      colour: json['colour'] as String?,
      license: json['license'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      userDetails: json['userDetails'] == null
          ? null
          : UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VehiclesImplToJson(_$VehiclesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'plateNumber': instance.plateNumber,
      'carType': instance.carType,
      'colour': instance.colour,
      'license': instance.license,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userDetails': instance.userDetails,
    };

_$UserDetailsImpl _$$UserDetailsImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailsImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      role: json['role'] as String?,
      password: json['password'] as String?,
      profileStatus: json['profileStatus'] as String?,
      driverProfileStatus: json['driverProfileStatus'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$UserDetailsImplToJson(_$UserDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'role': instance.role,
      'password': instance.password,
      'profileStatus': instance.profileStatus,
      'driverProfileStatus': instance.driverProfileStatus,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
