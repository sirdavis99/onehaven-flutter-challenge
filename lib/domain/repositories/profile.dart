import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ride_hailing/domain/entities/failure.dart';
import 'package:ride_hailing/domain/entities/success.dart';
import 'package:ride_hailing/domain/entities/user.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure, SuccessEntity>> updateProfile(
    String dob,
    String gender,
    String phoneNumber,
    String? firstName,
    String? lastName,
  );

  Future<Either<Failure, UserEntity>> getAuthUser();
  Future<Either<Failure, SuccessEntity>> registerVehicle(
    String plateNumber,
    String vehicleType,
    String vehicleColor,
    File licenceFile,
    String fileName,
  );
}
