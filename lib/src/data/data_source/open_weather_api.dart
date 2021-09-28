import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OpenWeatherApi {
  OpenWeatherApi();
  final accessKey = dotenv.get('ACCESS_KEY');
  final lang = LocaleKeys.lang.tr();
  static const _authority = 'api.openweathermap.org';

  Future<dynamic> fetchCities(Coordinates coordinates) async {
    print(Uri.https(_authority, _buildPath('find'), {
      'units': 'metric',
      'lang': lang,
      'appid': accessKey,
    }));
    final response = await http.get(Uri.https(
      _authority,
      _buildPath('find'),
      _baseQuery(coordinates),
    ));
    return _checkResponse(response);
  }

  Future<dynamic> fetchWeather(String exclude, Coordinates coordinates) async {
    final response = await http.get(Uri.https(
      _authority,
      _buildPath('onecall'),
      {
        ..._baseQuery(coordinates),
        'exclude': '$exclude,current,minutely,alerts',
      },
    ));

    return _checkResponse(response);
  }

  String _buildPath(String path) => '/data/2.5/$path';

  Map<String, dynamic> _baseQuery(Coordinates coordinates) => {
        'lat': '${coordinates.latitude}',
        'lon': '${coordinates.longitude}',
        'units': 'metric',
        'lang': 'en',
        'appid': accessKey,
      };

  dynamic _checkResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          jsonDecode(response.body)['message'] ?? 'Failed to load repository');
    }
  }
}
