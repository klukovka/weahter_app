import 'package:equatable/equatable.dart';

class City extends Equatable {
  City({
    required this.country,
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
  });
  final String id;
  final String name;
  final String country;
  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [
        id,
        name,
        country,
        latitude,
        longitude,
      ];
}
