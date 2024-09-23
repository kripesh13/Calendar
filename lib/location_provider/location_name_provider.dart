import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class LocationNameProvider extends ChangeNotifier {
  String? locationName;
  Future<void> getLocationName(latitude, longitude) async {
    if (latitude != null && longitude != null) {
      try {
        List<Placemark> placemarks =
            await placemarkFromCoordinates(latitude!, longitude!);
        if (placemarks.isNotEmpty) {
          
          locationName =
              '${placemarks[3].street ?? ""}, ${placemarks[2].street ?? ""}  ${placemarks[1].street ?? ""}   ${placemarks.first.country ?? ""},  ${placemarks.first.country ?? ""},';
        } else {
          locationName = 'Location not found';
        }
      } catch (e) {
        print('Error getting location name: $e');
      }
      notifyListeners(); 
    } else {
      print('Invalid latitude or longitude.');
    }
  }
}
