import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/daily_weather_repository.dart';

class DailyWeatherLocalRepository implements DailyWeatherRepository {
  final localStorage = LocalStorage();

  @override
  Future<List<DailyWeather>> getDailyWeather(Coordinates coordinates) async {
    final dailyWeather = await localStorage.fetchDailyWeather();
    final dailyWeatherMapped = dailyWeather.map<DailyWeather>(
      (daily) => JsonParser.parseJsonToDailyWeather(daily),
    );
    return dailyWeatherMapped.toList();
  }
}
