import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

Future<String> getAddress(String lat, String long) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        double.tryParse(lat)!, double.tryParse(long)!);
   // print(placemarks.first.street);
    return placemarks.first.street!;
  } catch (e) {
    debugPrint(e.toString());
    return e.toString();
  }
}
