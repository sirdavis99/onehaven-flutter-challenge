import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/data/datasources/auth.dart';
import 'package:ride_hailing/data/repositories/auth.dart';
import 'package:ride_hailing/domain/repositories/auth.dart';
import 'package:ride_hailing/logic/state/auth_state.dart';



final mainAuthProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref: ref, baseAuthRepository: ref.watch(authProvider));
});

final authProvider = Provider<BaseAuthRepository>((ref) {
  return AuthRepository();
});
