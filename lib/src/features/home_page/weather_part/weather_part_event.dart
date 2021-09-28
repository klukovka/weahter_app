import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_mode.dart';

abstract class WeatherPartEvent extends Equatable {}

class WeatherPartCoordinateEvent extends WeatherPartEvent {
  WeatherPartCoordinateEvent(this.coordinates);
  final Coordinates coordinates;

  @override
  List<Object?> get props => [coordinates];
}

class WeatherPartModeEvent extends WeatherPartEvent {
  WeatherPartModeEvent([this.weatherMode = WeatherMode.daily]);
  final WeatherMode weatherMode;

  @override
  List<Object?> get props => [weatherMode];
}
