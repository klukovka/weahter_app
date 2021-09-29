import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalStorage {
  Future<Map<String, dynamic>> fetchCoordinates() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final json = _sharedPreferences.getString('lastfetchCoordinates');
    return jsonDecode(_stringChecker(json));
  }

  Future<List<dynamic>> fetchCity() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = _sharedPreferences.getString('lastfetchCity');
    return jsonDecode(_stringChecker(json));
  }

  Future<List<dynamic>> fetchDailyWeather() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = _sharedPreferences.getString('lastfetchDailyWeather');
    return jsonDecode(_stringChecker(json));
  }

  Future<List<dynamic>> fetchHourlyWeather() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = _sharedPreferences.getString('lastfetchHourlyWeather');
    return jsonDecode(_stringChecker(json));
  }

  String _stringChecker(String? json) {
    try {
      return json!;
    } catch (_) {
      throw Exception(LocaleKeys.download.tr());
    }
  }

  Future<void> saveEntity(String key, entity) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = jsonEncode(entity);
    await _sharedPreferences.setString(key, json);
  }
}
