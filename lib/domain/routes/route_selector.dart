import 'package:flutter/material.dart';
import 'package:onehaven_flutter_challenge/domain/routes/auth_route.dart';
import 'package:onehaven_flutter_challenge/domain/routes/non_auth_route.dart';
import 'package:provider/provider.dart';
import 'package:onehaven_flutter_challenge/services/auth_service.dart';

class RouteSelector extends StatelessWidget {
  const RouteSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthService>().isLoggedIn;
    return isLoggedIn ? const AuthRoute() : const NonAuthRoute();
  }
}
