import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationProvider extends ChangeNotifier {
  double? latitude;
  double? longitude;
  Location location = Location();
  LocationData? _currentLocation;

  LocationProvider() {
    // Uncomment if you want to fetch location immediately upon instantiation
    // getLocation();
  }

  LocationData? get currentLocation => _currentLocation;

  Future<void> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location service is enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location services are disabled.");
        return;
      }
    }

    // Check location permissions
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission is denied.");
        return; // Exit if permission is not granted
      }
    }

    // Get current location
    try {
      _currentLocation = await location.getLocation();

      if (_currentLocation != null) {
        latitude = _currentLocation!.latitude;
        longitude = _currentLocation!.longitude;

        // Check if latitude and longitude are valid
        if (latitude != 0.0 && longitude != 0.0) {
          notifyListeners();
          // Call getLocationName if you want to fetch the name right after getting location
          await getLocationName();
        } else {
          print('Received invalid location coordinates.');
        }
      }
    } catch (e) {
      print('Could not get location: $e');
    }
  }

  Future<void> getLocationName() async {
    if (latitude != null && longitude != null) {
      try {
        // Add your geocoding logic here
        // Example: List<Placemark> placemarks = await placemarkFromCoordinates(latitude!, longitude!);
      } catch (e) {
        print('Error getting location name: $e');
      }
    } else {
      print('Latitude or Longitude is null.');
    }
  }
}
