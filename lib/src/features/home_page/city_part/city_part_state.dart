import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/models/city.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';

abstract class CityPartState extends Equatable {}

class CityPartLoadingState extends CityPartState {
  @override
  List<Object?> get props => [];
}

class CityPartLoadedState extends CityPartState {
  CityPartLoadedState(this.city, this.coordinates);
  final City city;
  final Coordinates coordinates;

  @override
  List<Object?> get props => [city];
}

class CityPartErrorState extends CityPartState {
  CityPartErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
