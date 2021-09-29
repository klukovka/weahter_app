import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/weather.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/temperature_info.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/weather_widget.dart';
import 'package:weather_app/src/resources/theme/app_text_theme.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class InfoMaker {
  static Widget rowInfo(
    String name,
    value, {
    String unit = '',
    double horizontalPadding = 15.0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppTextTheme.headline4,
            ),
            Text(
              '$value $unit',
              style: AppTextTheme.headline4,
            ),
          ],
        ),
      );

  static Widget nullCheckPrecipitation(
    String name,
    num? precipitation, {
    String? unit,
    double horizontalPadding = 0,
  }) {
    if (precipitation != null) {
      return rowInfo(
        name,
        precipitation,
        unit: unit ?? LocaleKeys.mm.tr(),
        horizontalPadding: horizontalPadding,
      );
    }
    return const SizedBox();
  }

  static Widget shortInfo(num temperature, num feelsLike, int clouds,
          num precipitationProbability, num? rain, num? snow) =>
      Column(
        children: [
          TemperatureInfo(
            timeOfDay: LocaleKeys.temperature.tr(),
            temperature: temperature,
            feelsLike: feelsLike,
          ),
          rowInfo(
            LocaleKeys.clouds.tr(),
            clouds,
            horizontalPadding: 0,
            unit: '%',
          ),
          rowInfo(
            LocaleKeys.precipitationProbability.tr(),
            precipitationProbability,
            horizontalPadding: 0,
          ),
          nullCheckPrecipitation(LocaleKeys.rain.tr(), rain),
          nullCheckPrecipitation(LocaleKeys.snow.tr(), snow),
        ],
      );

  static List<Widget> weatherList(List<Weather> weather) {
    final _weatherList = <Widget>[
      Text(LocaleKeys.weather.tr(), style: AppTextTheme.headline3)
    ];
    for (final item in weather) {
      _weatherList.add(WeatherWidget(item));
    }

    return _weatherList;
  }
}
