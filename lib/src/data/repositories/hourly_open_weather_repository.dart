import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/data/data_source/open_weather_api.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/hourly_weather.dart';
import 'package:weather_app/src/domain/repositories/hourly_weather_repository.dart';

class HourlyOpenWeatherRepository implements HourlyWeatherRepository {
  final openWeatherApi = OpenWeatherApi();

  @override
  Future<List<HourlyWeather>> getHourlyWeather(Coordinates coordinates) async {
    final hourlyWeather =
        (await openWeatherApi.fetchWeather('daily', coordinates))['hourly'];
    await LocalStorage().saveEntity('lastfetchHourlyWeather', hourlyWeather);

    final hourlyWeatherMapped = hourlyWeather.map<HourlyWeather>(
      (hourly) => JsonParser.parseJsonToHourlyWeather(hourly),
    );
    return hourlyWeatherMapped.toList();
  }
}
