import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homeservice/features/home/domain/entities/location_entity.dart';
import "location_datasource.dart";

class LocationDataSourceImpl implements LocationDataSource {
  @override
  Future<LocationEntity> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("Location service disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception("Location permission denied");
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    }

    final position = await Geolocator.getCurrentPosition();

    final places = await Geocoding().placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    final place = places.first;

    return LocationEntity(
      latitude: position.latitude,
      longitude: position.longitude,
      city: place.locality ?? "",
      state: place.administrativeArea ?? "",
    );
  }
}
