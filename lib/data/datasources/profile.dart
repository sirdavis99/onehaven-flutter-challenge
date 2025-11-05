import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_hailing/data/datasources/err_response.dart';
import 'package:ride_hailing/domain/entities/failure.dart';
import 'package:ride_hailing/domain/entities/success.dart';
import 'package:ride_hailing/domain/entities/user.dart';
import 'package:ride_hailing/domain/repositories/profile.dart';
import 'package:ride_hailing/utils/api_const.dart';
import 'package:ride_hailing/utils/hive_const.dart';
import 'package:dio/dio.dart' as dio;

class ProfileRepository extends BaseProfileRepository {
  @override
  Future<Either<Failure, SuccessEntity>> updateProfile(
    String dob,
    String gender,
    String phoneNumber,
    String? firstName,
    String? lastName,
  ) async {
    String url = baseUrl + updateProfileConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;

    try {
      final response = await dio.Dio().post(
        url,
        data: {
          "dob": dob,
          "phoneNumber": phoneNumber,
          "gender": gender,
        },
        options: dio.Options(method: "Post", headers: {
          "Authorization": "Bearer $token",
        }),
      );
      debugPrint(response.data.toString());
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        SuccessEntity successEntity = SuccessEntity.fromJson(content);
        return Right(successEntity);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(
        Failure(
          message: errResponse(e),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getAuthUser() async {
    String url = baseUrl + getAuthUserConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;

    try {
      final response = await dio.Dio().post(
        url,
        options: dio.Options(
          method: "Post",
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      debugPrint(response.data.toString());
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        UserEntity successEntity = UserEntity.fromJson(content);
        return Right(successEntity);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(
        Failure(
          message: errResponse(e),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SuccessEntity>> registerVehicle(
      String plateNumber,
      String vehicleType,
      String vehicleColor,
      File licenceFile,
      String fileName) async {
    String url = baseUrl + registerVehicleConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;

    var formData = FormData.fromMap({
      'plateNumber': plateNumber,
      'vehicleType': vehicleType,
      'vehicleColour': vehicleColor,
      'license':
          await MultipartFile.fromFile(licenceFile.path, filename: fileName),
    });

    try {
      final response = await dio.Dio().post(
        url,
        data: formData,
        options: dio.Options(
          method: "Post",
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );
      debugPrint(response.data.toString());
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        SuccessEntity successEntity = SuccessEntity.fromJson(content);
        return Right(successEntity);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(
        Failure(
          message: errResponse(e),
        ),
      );
    }
  }
}
