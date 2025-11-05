import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_hailing/domain/entities/hive/user.dart';
import 'package:ride_hailing/domain/repositories/profile.dart';
import 'package:ride_hailing/logic/state/get_user_state.dart';
import 'package:ride_hailing/utils/hive_const.dart';

class GetUserNotifier extends StateNotifier<GetUserState> {
  GetUserNotifier({
    required this.ref,
    required BaseProfileRepository baseProfileRepository,
  })  : _baseProfileRepository = baseProfileRepository,
        super(const GetUserState.initial());

  final Ref ref;
  final BaseProfileRepository _baseProfileRepository;

  var profileBox = Hive.box<String>(HiveConst.profileStatusBox);
  var driverProfileBox = Hive.box<String>(HiveConst.driverProfileStatusBox);
   var userInfoBox = Hive.box<UserHive>(HiveConst.userInfoBox);

  Future<void> getUser() async {
    state = const GetUserState.loading();
    final response = await _baseProfileRepository.getAuthUser();

    response.fold(
      (l) {
        state = GetUserState.error(message: l.message);
      },
      (r) {
        state = GetUserState.loaded(data: r);
        debugPrint("User data gotten");
        profileBox.put(HiveConst.profileStatusKey, r.user!.profileStatus!);
        driverProfileBox.put(
            HiveConst.driverProfileStatusKey, r.user!.driverProfileStatus!);
        userInfoBox.put(
          HiveConst.userInfoKey,
          UserHive(
            id: r.user!.id,
            firstName: r.user!.firstName,
            lastName: r.user!.lastName,
            emailAddress: r.user!.emailAddress,
            updatedAt: r.user!.updatedAt,
            createdAt: r.user!.createdAt,
            middleName: r.user!.middleName,
            phoneNumber: r.user!.phoneNumber,
            dob: r.user!.dateOfBirth,
            gender:  r.user!.gender
          ),
        );
      },
    );
  }
}
