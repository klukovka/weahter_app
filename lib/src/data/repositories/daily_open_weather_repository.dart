import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/data/data_source/open_weather_api.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/domain/repositories/daily_weather_repository.dart';

class DailyOpenWeatherRepository implements DailyWeatherRepository {
  final openWeatherApi = OpenWeatherApi();

  @override
  Future<List<DailyWeather>> getDailyWeather(Coordinates coordinates) async {
    final dailyWeather =
        (await openWeatherApi.fetchWeather('hourly', coordinates))['daily'];
    LocalStorage().saveEntity('lastfetchDailyWeather', dailyWeather);
      print('''
    
    
    ${await LocalStorage().fetchDailyWeather()}
    
    ''');
    final dailyWeatherMapped = dailyWeather.map<DailyWeather>(
      (daily) => JsonParser.parseJsonToDailyWeather(daily),
    );
    return dailyWeatherMapped.toList();
  }
}
