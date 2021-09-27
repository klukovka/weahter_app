import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/models/city.dart';

abstract class CityPartState extends Equatable {}

class CityPartLoadingState extends CityPartState {
  @override
  List<Object?> get props => [];
}

class CityPartLoadedState extends CityPartState {
  CityPartLoadedState(this.city);
  final City city;

  @override
  List<Object?> get props => [city];
}

class CityPartErrorState extends CityPartState {
  CityPartErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];

  
}
