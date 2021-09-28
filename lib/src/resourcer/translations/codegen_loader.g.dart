// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "hourlyWeather": "'Weather for 48 hours'",
  "dailyWeather": "Weather for 7 days",
  "weatherApp": "Weather App",
  "temperature": "Temperature",
  "morning": "Morning",
  "day": "Day",
  "evening": "Evening",
  "night": "Night",
  "maximum": "Maximum",
  "minimum": "Minimum",
  "feelsLike": "Feels like",
  "clouds": "Clouds",
  "precipitationProbability": "Precipitation Probability",
  "rain": "Rain",
  "snow": "Snow",
  "lang": "en",
  "weather": "Weather",
  "sun": "Sun",
  "sunrise": "Sunrise",
  "sunset": "Sunset",
  "moon": "Moon",
  "moonrise": "Moonrise",
  "moonset": "Moonset",
  "moonPhase": "Moon Phase",
  "atmosphere": "Atmosphere",
  "pressure": "Pressure",
  "humidity": "Humidity",
  "atmosphericTemperature": "Atmospheric temperature",
  "wind": "Wind",
  "speed": "Speed",
  "metreSec": "metre/sec",
  "direction": "Direction",
  "degrees": "degrees",
  "gust": "Gust",
  "hPa": "hPa",
  "mm": "mm",
  "visibility": "Visibility",
  "metre": "metre",
  "city": "City",
  "coordinates": "Coordinates",
  "n": "N",
  "s": "S",
  "e": "E",
  "w": "W",
  "download": "You have not download forecast yet"
};
static const Map<String,dynamic> ru = {
  "hourlyWeather": "Погода на 48 часов",
  "dailyWeather": "Погода на 7 дней",
  "weatherApp": "Прогноз погоды",
  "temperature": "Температура",
  "morning": "Утро",
  "day": "День",
  "evening": "Вечер",
  "night": "Ночь",
  "maximum": "Максимум",
  "minimum": "Минимум",
  "feelsLike": "Чувствуется как",
  "clouds": "Облачность",
  "precipitationProbability": "Вероятность осадков",
  "rain": "Дождь",
  "snow": "Снег",
  "lang": "ru",
  "weather": "Погода",
  "sun": "Солнце",
  "sunrise": "Восход солнца",
  "sunset": "Заход солнца",
  "moon": "Луна",
  "moonrise": "Восход луны",
  "moonset": "Заход луны",
  "moonPhase": "Лунная фаза",
  "atmosphere": "Атмосфера",
  "pressure": "Давление",
  "humidity": "Влажность",
  "atmosphericTemperature": "Температура атмосферы",
  "wind": "Ветер",
  "speed": "Скорость",
  "metreSec": "м/с",
  "direction": "Направление",
  "degrees": "град.",
  "gust": "Порыв",
  "hPa": "гПа",
  "mm": "мм",
  "visibility": "Видимость",
  "metre": "м.",
  "city": "Город",
  "coordinates": "Координаты",
  "n": "с.ш.",
  "s": "ю.ш.",
  "e": "в.д.",
  "w": "з.д.",
  "download": "Вы еще не загружали прогноз погоды"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}