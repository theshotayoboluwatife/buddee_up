import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationProvider with ChangeNotifier {
  String location = "";

  // String get location => _location;

  Future<void> requestLocationPermission(BuildContext context) async {
    final PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      try {
        updateLocation();
        Navigator.pushNamed(context, "/keep_me_posted_screen");
      } catch (e) {
        print(e);
      }
    } else if (status.isDenied) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
              'Location permission denied. Enable it in app settings.'),
          action: SnackBarAction(
            label: 'SETTINGS',
            onPressed: () {
              openAppSettings();
            },
          ),
          duration: const Duration(seconds: 5), // Adjust duration as needed
        ),
      );
    }
  }

  Future<void> updateLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      final Placemark placemark = placemarks[0];
      final String? city = placemark.locality;
      final String? state = placemark.administrativeArea;
      final String? country = placemark.country;

      location = "$city, $state, $country";
    } else {
      location = "Unknown Location";
    }

    notifyListeners();
  }
}
