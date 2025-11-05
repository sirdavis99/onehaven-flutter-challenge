import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_hailing/domain/routes/auth_route.dart';
import 'package:ride_hailing/domain/routes/non_auth_route.dart';
import 'package:ride_hailing/utils/hive_const.dart';

import '../entities/hive/auth_state.dart';

class RouteSelector extends StatelessWidget {
  const RouteSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final authBox = Hive.box<AuthStateHive>(HiveConst.authStateBox);
    return ValueListenableBuilder(
        valueListenable: authBox.listenable(),
        builder: (context, Box<AuthStateHive> box, child) {
          if (box.isNotEmpty) {
            if (box.values.first == AuthStateHive.authenticated) {
              return const AuthRoute();
            } else {
              return const NonAuthRoute();
            }
          } else {
            return const NonAuthRoute();
          }
        });
  }
}
