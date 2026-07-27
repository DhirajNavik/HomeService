import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final double latitude;
  final double longitude;
  final String city;
  final String state;

  const LocationEntity({
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.state,
  });

  @override
  List<Object> get props => [
        latitude,
        longitude,
        city,
        state,
      ];
}