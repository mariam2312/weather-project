// ignore_for_file: unused_local_variable, avoid_print

import 'package:geolocator/geolocator.dart';

//  refactore
class Location {
  late double latitude;
  late double longitude;

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    // use try catch , if user not permission ,knowe it
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('expection is $e');
    }
  }
}
