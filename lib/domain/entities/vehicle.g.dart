// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehiclesDataImplAdapter extends TypeAdapter<_$VehiclesDataImpl> {
  @override
  final int typeId = 6;

  @override
  _$VehiclesDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$VehiclesDataImpl(
      id: fields[0] as int?,
      carType: fields[1] as String?,
      createdAt: fields[2] as String?,
      updatedAt: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$VehiclesDataImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.carType)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehiclesDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehiclesDataImpl _$$VehiclesDataImplFromJson(Map<String, dynamic> json) =>
    _$VehiclesDataImpl(
      id: (json['id'] as num?)?.toInt(),
      carType: json['carType'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$VehiclesDataImplToJson(_$VehiclesDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carType': instance.carType,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
