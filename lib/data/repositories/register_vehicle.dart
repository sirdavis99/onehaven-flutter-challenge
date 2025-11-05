import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/domain/repositories/profile.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/logic/state/success_state.dart';
import 'package:ride_hailing/utils/toast.dart';

class RegisterVehicleNotifier extends StateNotifier<SuccessState> {
  RegisterVehicleNotifier({
    required this.ref,
    required BaseProfileRepository baseProfileRepository,
  })  : _baseProfileRepository = baseProfileRepository,
        super(const SuccessState.initial());

  final Ref ref;
  final BaseProfileRepository _baseProfileRepository;

  Future<void> registerVehicle(
      {required String plateNumber,
      required String vehicleType,
      required String vehicleColor,
      required File licenceFile,
      required String fileName,
      required BuildContext context}) async {
    state = const SuccessState.loading();
    final response = await _baseProfileRepository.registerVehicle(
        plateNumber, vehicleType, vehicleColor, licenceFile, fileName);

    response.fold((l) {
      showToast(l.message);
      state = SuccessState.error(message: l.message);
    }, (r) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteGenerator.successPage, (route) => false, arguments: "Successfully Submitted your documents for review");
      state = const SuccessState.loaded();
    });
  }
}
