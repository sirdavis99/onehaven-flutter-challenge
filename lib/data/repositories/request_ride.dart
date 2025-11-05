import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_hailing/domain/entities/ride.dart';
import 'package:ride_hailing/domain/repositories/rides.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/logic/provider/location_provider.dart';
import 'package:ride_hailing/logic/state/request_ride.dart';
import 'package:ride_hailing/presentation/pages/ride_list.dart';
import 'package:ride_hailing/presentation/widgets/custom_stacked_bottom_sheet.dart';
import 'package:ride_hailing/utils/toast.dart';

import '../../utils/color_const.dart';

class RequestRideNotifier extends StateNotifier<RequestRideState> {
  RequestRideNotifier({
    required this.ref,
    required BaseRideRepository baseRideRepository,
  })  : _baseRideRepository = baseRideRepository,
        super(const RequestRideState.initial());

  final Ref ref;
  final BaseRideRepository _baseRideRepository;

  Future<void> requestRide(
      RequestRidePayload payload, BuildContext context) async {
    state = const RequestRideState.loading();
    final response = await _baseRideRepository.requestRide(payload);
    response.fold((l) {
      showToast(l.message);
      state = RequestRideState.error(message: l.message);
    }, (r) {
      if (ref.watch(tripType) == "rider") {
        debugPrint("Rider");
        customShowStackedBottomSheet(
          child: const RideList(),
          context: context,
          backColor: whiteColor,
        );
      } else {
        ref.read(pickUpLocationData.notifier).state = null;
        ref.read(destinationLocationData.notifier).state = null;
        ref.read(requestRidePayload.notifier).state = null;

        Navigator.pushNamed(context, RouteGenerator.successPage,
            arguments:
                "You have successfully requested a ride");
      }
      state = RequestRideState.loaded(data: r);
    });
  }
}
