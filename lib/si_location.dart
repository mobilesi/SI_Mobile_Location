library si_location;

import 'package:location/location.dart';

/// A SILocation.
class SILocation {
  static final Location _location = Location();

  static Future<LocationModel?> get() async {
    // Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await _location.getLocation();
    return LocationModel(locationData.latitude, locationData.longitude, locationData.accuracy, locationData.altitude,
        locationData.speed, locationData.speedAccuracy, locationData.heading, locationData.time);
  }

  static enableBackgroundMode(bool value) async {
    await _location.enableBackgroundMode(enable: value);
  }

  static setCallbackWhenLocationChange(Function(LocationModel model) fun) {
    _location.onLocationChanged.listen((LocationData locationData) {
      fun(LocationModel(locationData.latitude, locationData.longitude, locationData.accuracy, locationData.altitude,
          locationData.speed, locationData.speedAccuracy, locationData.heading, locationData.time));
    });
  }
}

class LocationModel {
  double? latitude;
  double? longitude;
  double? accuracy;
  double? altitude;
  double? speed;
  double? speedAccuracy;
  double? heading;
  double? time;

  LocationModel(this.latitude, this.longitude, this.accuracy, this.altitude, this.speed, this.speedAccuracy,
      this.heading, this.time);
}
