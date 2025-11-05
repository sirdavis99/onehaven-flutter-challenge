import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/data/datasources/profile.dart';
import 'package:ride_hailing/data/repositories/get_user.dart';
import 'package:ride_hailing/data/repositories/register_vehicle.dart';
import 'package:ride_hailing/domain/repositories/profile.dart';
import 'package:ride_hailing/logic/state/get_user_state.dart';
import 'package:ride_hailing/logic/state/success_state.dart';

import '../../data/repositories/update_profile.dart';

final getUserProvider =
    StateNotifierProvider<GetUserNotifier, GetUserState>((ref) {
  return GetUserNotifier(
    ref: ref,
    baseProfileRepository: ref.watch(profileProvider),
  );
});

final updateProfileProvider =
    StateNotifierProvider<UpdateProfileNotifier, SuccessState>((ref) {
  return UpdateProfileNotifier(
      ref: ref, baseProfileRepository: ref.watch(profileProvider));
});
final registerVehicleProvider =
    StateNotifierProvider<RegisterVehicleNotifier, SuccessState>((ref) {
  return RegisterVehicleNotifier(
      ref: ref, baseProfileRepository: ref.watch(profileProvider));
});

final profileProvider = Provider<BaseProfileRepository>((ref) {
  return ProfileRepository();
});
