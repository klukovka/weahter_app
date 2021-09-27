import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/models/coordinates.dart';

class CityPartEvent extends Equatable {
  CityPartEvent(this.coordinates);
  final Coordinates coordinates;

  @override
  List<Object?> get props => [coordinates];
  
}
