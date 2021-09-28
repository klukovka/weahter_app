import 'package:weather_app/src/domain/interactors/base_interactor.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/hourlyWeather.dart';
import 'package:weather_app/src/domain/repositories/hourly_weather_repository.dart';

class GetHourlyWeatherInteractor
    implements BaseInteractor<Coordinates, List<HourlyWeather>> {
  GetHourlyWeatherInteractor(this._repository);
  final HourlyWeatherRepository _repository;

  @override
  Future<List<HourlyWeather>> call(Coordinates coordinates) {
    print('GetHourlyWeatherInteractor');
    return _repository.getHourlyWeather(coordinates);
  }
}
