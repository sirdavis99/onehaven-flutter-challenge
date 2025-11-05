import 'package:dartz/dartz.dart';
import 'package:ride_hailing/domain/entities/failure.dart';
import 'package:ride_hailing/domain/entities/fetch_selected_rides.dart';
import 'package:ride_hailing/domain/entities/get_vehicles.dart';
import 'package:ride_hailing/domain/entities/request_ride.dart';
import 'package:ride_hailing/domain/entities/ride.dart';
import 'package:ride_hailing/domain/entities/ride_history.dart';
import 'package:ride_hailing/domain/entities/success.dart';
import 'package:ride_hailing/domain/entities/vehicle_type.dart';

abstract class BaseRideRepository {
  Future<Either<Failure, RequestRideEntity>> requestRide(
      RequestRidePayload payload);
  Future<Either<Failure, FetchRideEntity>> fetchRide();
  Future<Either<Failure, RideHistoryEntity>> getRideHistory();
  Future<Either<Failure, VehicleType>> getVehicleTypes();
  Future<Either<Failure, GetVehicles>> getVehicles();
  Future<Either<Failure, FetchSelectedRide>> getSelectedVehicles();
  Future<Either<Failure, SuccessEntity>> selectRide(String rideId);
}
