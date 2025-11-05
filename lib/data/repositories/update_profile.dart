import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/domain/repositories/profile.dart';
import 'package:ride_hailing/logic/provider/profile.dart';
import 'package:ride_hailing/logic/state/success_state.dart';
import 'package:ride_hailing/utils/toast.dart';

import '../../domain/routes/route_generator.dart';

class UpdateProfileNotifier extends StateNotifier<SuccessState> {
  UpdateProfileNotifier({
    required this.ref,
    required BaseProfileRepository baseProfileRepository,
  })  : _baseProfileRepository = baseProfileRepository,
        super(const SuccessState.initial());

  final Ref ref;
  final BaseProfileRepository _baseProfileRepository;

  Future<void> updateProfile({
    required String dob,
    required String gender,
    required String phoneNumber,
    String? firstName,
    String? lastName,
    required BuildContext context,
  }) async {
    state = const SuccessState.loading();
    final response = await _baseProfileRepository.updateProfile(
      dob,
      gender,
      phoneNumber,
      firstName,
      lastName,
    );

    response.fold((l) {
      showToast(l.message);
      state = SuccessState.error(message: l.message);
    }, (r) {
      ref.watch(getUserProvider.notifier).getUser();
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteGenerator.successPage,
        (route) => false,
        arguments: "Successfully updated your profile information",
      );
      showToast("Profile details updated successfullty");
      state = const SuccessState.loaded();
    });
  }
}
