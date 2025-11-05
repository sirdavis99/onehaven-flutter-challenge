import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:ride_hailing/data/datasources/err_response.dart';
import 'package:ride_hailing/domain/entities/auth.dart';
import 'package:ride_hailing/domain/entities/failure.dart';
import 'package:ride_hailing/domain/repositories/auth.dart';
import 'package:ride_hailing/utils/api_const.dart';

class AuthRepository extends BaseAuthRepository {
  @override
  Future<Either<Failure, AuthEntity>> auth(String token) async {
    String url = baseUrl + linkedInAuthConst;
    debugPrint("Hit token $token");
    debugPrint("The url is $url");

    try {
      final response = await dio.Dio().post(
        url,
        data: {
          "token": token,
        },
        options: dio.Options(
          method: 'Post',
          // sendTimeout: const Duration(milliseconds: ),
          // receiveTimeout: const Duration(milliseconds: 30000),
        ),
      );
      if (kDebugMode) {
        print("The response is");
        print(response.data);
      }
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        AuthEntity loginModel = AuthEntity.fromJson(content);
        return Right(loginModel);
      } else {
        return Left(
          Failure(message: "Problem encountered, kindly try again"),
        );
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }
      return Left(Failure(
        message: errResponse(err),
      ));
    }
  }
}
