// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleTypeImplAdapter extends TypeAdapter<_$VehicleTypeImpl> {
  @override
  final int typeId = 5;

  @override
  _$VehicleTypeImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$VehicleTypeImpl(
      status: fields[0] as bool?,
      vehicles: (fields[1] as List?)?.cast<VehiclesData>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$VehicleTypeImpl obj) {
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
      other is VehicleTypeImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleTypeImpl _$$VehicleTypeImplFromJson(Map<String, dynamic> json) =>
    _$VehicleTypeImpl(
      status: json['status'] as bool?,
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => VehiclesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VehicleTypeImplToJson(_$VehicleTypeImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'vehicles': instance.vehicles,
    };
