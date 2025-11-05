import 'package:dartz/dartz.dart';
import 'package:ride_hailing/domain/entities/auth.dart';
import 'package:ride_hailing/domain/entities/failure.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, AuthEntity>> auth(String token);
}
