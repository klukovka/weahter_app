import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<Map<String, dynamic>> fetchCoordinates() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final json = _sharedPreferences.getString('lastfetchCoordinates');
    return jsonDecode(json!);
  }

  Future<List<dynamic>> fetchCity() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = _sharedPreferences.getString('lastfetchCity');
    return jsonDecode(json!);
  }

  Future<List<dynamic>> fetchDailyWeather() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = _sharedPreferences.getString('lastfetchDailyWeather');
    return jsonDecode(json!);
  }

  Future<List<dynamic>> fetchHourlyWeather() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = _sharedPreferences.getString('lastfetchHourlyWeather');
    return jsonDecode(json!);
  }

  Future<void> saveEntity(String key, dynamic entity) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = jsonEncode(entity);
    _sharedPreferences.setString(key, json);
  }
}
