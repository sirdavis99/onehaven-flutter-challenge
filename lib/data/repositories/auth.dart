import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_hailing/domain/entities/hive/user.dart';
import 'package:ride_hailing/domain/repositories/auth.dart';
import 'package:ride_hailing/logic/state/auth_state.dart';
import 'package:ride_hailing/services/auth_service.dart';
import 'package:ride_hailing/stores/auth/main.dart';
import 'package:ride_hailing/utils/hive_const.dart';
import 'package:ride_hailing/utils/toast.dart';
import '../../domain/entities/hive/auth_state.dart';
import 'package:provider/provider.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required this.ref,
    required BaseAuthRepository baseAuthRepository,
  })  : _baseAuthRepository = baseAuthRepository,
        super(const AuthState.initial());

  final Ref ref;
  final BaseAuthRepository _baseAuthRepository;

  var tokenBox = Hive.box<String>(HiveConst.tokenBox);
  var userIdBox = Hive.box<String>(HiveConst.useridBox);
  var userInfoBox = Hive.box<UserHive>(HiveConst.userInfoBox);
  final authBox = Hive.box<AuthStateHive>(HiveConst.authStateBox);
  Future<void> auth(
      {required String token, required BuildContext context}) async {
    state = const AuthState.loading();
    final response = await _baseAuthRepository.auth(token);
    response.fold((l) {
      showToast(l.message);
      state = AuthState.error(message: l.message);
    }, (r) {
      state = AuthState.loaded(data: r);
      debugPrint("The token is ${r.token}");
      authBox.put(HiveConst.authStateKey, AuthStateHive.authenticated);
      tokenBox.put(HiveConst.tokenKey, r.token!);
      userIdBox.put(HiveConst.useridKey, r.user!.id.toString());

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
        ),
      );

      context.read<AuthService>().setAuth(AuthModel(
            token: r.token!,
            expires: 2592000, // 30 days
          ));

      showToast("Welcome ${r.user!.firstName} ${r.user!.lastName} ❤️");
      showToast("${r.user!.emailAddress}");
    });
  }
}
