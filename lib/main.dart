import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
import 'package:ride_hailing/domain/entities/get_vehicles.dart';
import 'package:ride_hailing/domain/entities/hive/auth_state.dart';
import 'package:ride_hailing/domain/entities/vehicle.dart';
import 'package:ride_hailing/presentation/app.dart';
import 'package:ride_hailing/utils/hive_const.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain/entities/hive/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Directory directory = await path.getApplicationSupportDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserHiveAdapter());
  Hive.registerAdapter(AuthStateHiveAdapter());
  Hive.registerAdapter(GetVehiclesImplAdapter());
  Hive.registerAdapter(VehiclesImplAdapter());
  Hive.registerAdapter(UserDetailsImplAdapter());
  Hive.registerAdapter(VehiclesDataImplAdapter());

  await Hive.openBox<String>(HiveConst.tokenBox);
  await Hive.openBox<String>(HiveConst.useridBox);
  await Hive.openBox<String>(HiveConst.profileStatusBox);
  await Hive.openBox<String>(HiveConst.driverProfileStatusBox);

  await Hive.openBox<UserHive>(HiveConst.userInfoBox);
  await Hive.openBox<AuthStateHive>(HiveConst.authStateBox);

  await Hive.openBox<GetVehicles>(HiveConst.getVehiclesBox);
  await Hive.openBox<Vehicles>(HiveConst.vehiclesBox);
  await Hive.openBox<UserDetails>(HiveConst.userDetailsBox);
  await Hive.openBox<VehiclesData>(HiveConst.vehicleDataBox);

  var futures = await Future.wait<dynamic>([
    dotenv.load(),
    SharedPreferences.getInstance(),
  ]);

  runApp(App(futures[1]));
}
