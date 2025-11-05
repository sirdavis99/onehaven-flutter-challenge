import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_hailing/data/datasources/err_response.dart';
import 'package:ride_hailing/domain/entities/failure.dart';
import 'package:ride_hailing/domain/entities/fetch_selected_rides.dart';
import 'package:ride_hailing/domain/entities/get_vehicles.dart';
import 'package:ride_hailing/domain/entities/request_ride.dart';
import 'package:ride_hailing/domain/entities/ride.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ride_hailing/domain/entities/ride_history.dart';
import 'package:ride_hailing/domain/entities/success.dart';
import 'package:ride_hailing/domain/entities/vehicle_type.dart';
import 'package:ride_hailing/domain/repositories/rides.dart';
import 'package:ride_hailing/utils/api_const.dart';
import 'package:ride_hailing/utils/hive_const.dart';

class RideRepository extends BaseRideRepository {
  @override
  Future<Either<Failure, FetchRideEntity>> fetchRide() async {
    String url = baseUrl + fetchRideConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;
    try {
      final response = await dio.Dio().get(
        url,
        options: dio.Options(
          method: "Get",
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        FetchRideEntity fetchRideEntity = FetchRideEntity.fromJson(content);
        return Right(fetchRideEntity);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }

      return Left(
        Failure(
          message: errResponse(err),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RequestRideEntity>> requestRide(
      RequestRidePayload payload) async {
    String url = baseUrl + requestRideConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;

    debugPrint("the token is $token");
    try {
      final response = await dio.Dio().post(
        url,
        data: payload.toJson(),
        options: dio.Options(
          method: "Post",
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (kDebugMode) {
        print(payload.toJson());
        print(response.data);
      }
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        RequestRideEntity successEntity = RequestRideEntity.fromJson(content);
        return Right(successEntity);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }

      return Left(
        Failure(
          message: errResponse(err),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RideHistoryEntity>> getRideHistory() async {
    String url = baseUrl + getRideHistoryConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;
    try {
      final response = await dio.Dio().get(
        url,
        options: dio.Options(
          method: "Get",
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        RideHistoryEntity fetchRideEntity = RideHistoryEntity.fromJson(content);
        return Right(fetchRideEntity);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }

      return Left(
        Failure(
          message: errResponse(err),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, VehicleType>> getVehicleTypes() async {
    String url = baseUrl + fetchVehicleTypeConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;

    try {
      final response = await dio.Dio().get(
        url,
        options: dio.Options(
          method: "Get",
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        VehicleType vehicleType = VehicleType.fromJson(content);
        return Right(vehicleType);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }

      return Left(
        Failure(
          message: errResponse(err),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, GetVehicles>> getVehicles() async {
    String url = baseUrl + fetchVehicleConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;

    try {
      final response = await dio.Dio().get(
        url,
        options: dio.Options(
          method: "Get",
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        GetVehicles vehicles = GetVehicles.fromJson(content);
        return Right(vehicles);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }

      return Left(
        Failure(
          message: errResponse(err),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FetchSelectedRide>> getSelectedVehicles() async {
    String url = baseUrl + fetchSelectedRideConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;
    try {
      final response = await dio.Dio().get(
        url,
        options: dio.Options(
          method: "Get",
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        FetchSelectedRide fetchRideEntity = FetchSelectedRide.fromJson(content);
        return Right(fetchRideEntity);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }

      return Left(
        Failure(
          message: errResponse(err),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SuccessEntity>> selectRide(String rideId) async {
    String url = baseUrl + selectRideConst;
    var tokenBox = Hive.box<String>(HiveConst.tokenBox);
    String token = tokenBox.get(HiveConst.tokenKey)!;

    debugPrint("the token is $token");
    try {
      final response = await dio.Dio().post(
        url,
        data: {
          "rideId": rideId,
        },
        options: dio.Options(
          method: "Post",
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      Map<String, dynamic> content = response.data;
      if (kDebugMode) {
        print("Select ride");
        print(response.data);
      }
      if (response.statusCode == 200) {
        SuccessEntity successEntity = SuccessEntity.fromJson(content);
        return Right(successEntity);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }

      return Left(
        Failure(
          message: errResponse(err),
        ),
      );
    }
  }
}
