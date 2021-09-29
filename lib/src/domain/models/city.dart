import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';

class City extends Equatable {
  const City({
    required this.country,
    required this.id,
    required this.name,
    required this.coordinates,
  });
  final String id;
  final String name;
  final String country;
  final Coordinates coordinates;

  @override
  List<Object?> get props => [
        id,
        name,
        country,
        coordinates,
      ];
}
