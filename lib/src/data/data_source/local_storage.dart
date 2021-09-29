import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalStorage {
  Future<String?> fetchCoordinates() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final json =
        _sharedPreferences.getString('lastfetchCoordinates${_generateId()}') ??
            _sharedPreferences.getString('lastfetchCoordinates}');
    return json;
  }

  Future<List<dynamic>> fetchCity() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final json =
        _sharedPreferences.getString('lastfetchCity${_generateId()}') ??
            _sharedPreferences.getString('lastfetchCity');
    return jsonDecode(stringChecker(json));
  }

  Future<List<dynamic>> fetchDailyWeather() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final json =
        _sharedPreferences.getString('lastfetchDailyWeather${_generateId()}') ??
            _sharedPreferences.getString('lastfetchDailyWeather');
    return jsonDecode(stringChecker(json));
  }

  Future<List<dynamic>> fetchHourlyWeather() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = _sharedPreferences
            .getString('lastfetchHourlyWeather${_generateId()}') ??
        _sharedPreferences.getString('lastfetchHourlyWeather');
    return jsonDecode(stringChecker(json));
  }

  String stringChecker(String? json) {
    try {
      return json!;
    } catch (_) {
      throw Exception(LocaleKeys.download.tr());
    }
  }

  Future<void> saveEntity(String key, entity) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final json = jsonEncode(entity);
    await _sharedPreferences.setString('$key${_generateId()}', json);
  }

  String _generateId() {
    if (_getUser != null) {
      return _getUser!.uid;
    }
    return '';
  }

  User? get _getUser => FirebaseAuth.instance.currentUser;
}
