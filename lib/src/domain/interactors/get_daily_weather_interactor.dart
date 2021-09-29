import 'package:weather_app/src/domain/interactors/base_interactor.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/domain/repositories/daily_weather_repository.dart';

class GetDailyWeatherInteractor
    implements BaseInteractor<Coordinates, List<DailyWeather>> {
  GetDailyWeatherInteractor(this._repository);
  final DailyWeatherRepository _repository;

  @override
  Future<List<DailyWeather>> call(Coordinates coordinates) {
    return _repository.getDailyWeather(coordinates);
  }
}
