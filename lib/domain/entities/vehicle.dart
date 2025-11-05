import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:ride_hailing/utils/hive_const.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';




@freezed
class VehiclesData with _$VehiclesData {
  @HiveType(typeId: 6)
  const factory VehiclesData({
    @HiveField(0) int? id,
    @HiveField(1) String? carType,
    @HiveField(2) String? createdAt,
    @HiveField(3) String? updatedAt,
  }) = _VehiclesData;

  factory VehiclesData.fromJson(Map<String, dynamic> json) =>
      _$VehiclesDataFromJson(json);
}



saveCarTypeList({required VehiclesData country, required int index}) {
  var box = Hive.box<VehiclesData>(HiveConst.vehicleDataBox);
  // int index = box.length;
  var contain = box.values.where((element) => element.carType == country.carType);
  //box.clear();
  if (contain.isEmpty) {
    debugPrint("adding car type");
    box.put(index, country);
  }
}
