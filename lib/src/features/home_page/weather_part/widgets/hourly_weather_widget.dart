import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/hourlyWeather.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/date_time_mapper.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/info_maker.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget(
    this.hourlyWeather, {
    Key? key,
  }) : super(key: key);
  final HourlyWeather hourlyWeather;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        DateTineMapper.dateTimeToString(hourlyWeather.dt),
      ),
      subtitle: InfoMaker.shortInfo(
        hourlyWeather.temperature,
        hourlyWeather.feelsLike,
        hourlyWeather.clouds,
        hourlyWeather.precipitationProbability,
        hourlyWeather.rain,
        hourlyWeather.snow,
      ),
      children: _allInfo,
    );
  }

  List<Widget> get _allInfo => [
        ...InfoMaker.weatherList(hourlyWeather.weather),
        Text(LocaleKeys.atmosphere.tr()),
        InfoMaker.rowInfo(
          LocaleKeys.pressure.tr(),
          hourlyWeather.pressure,
          unit: LocaleKeys.hPa.tr(),
        ),
        InfoMaker.rowInfo(LocaleKeys.humidity.tr(), hourlyWeather.humidity,
            unit: '%'),
        InfoMaker.rowInfo(
          LocaleKeys.atmosphericTemperature.tr(),
          hourlyWeather.dewPoint,
          unit: '°C',
        ),
        InfoMaker.rowInfo(
          LocaleKeys.visibility.tr(),
          hourlyWeather.visibility,
          unit: LocaleKeys.metre.tr(),
        ),
        Text(LocaleKeys.wind.tr()),
        InfoMaker.rowInfo(LocaleKeys.speed.tr(), hourlyWeather.windSpeed,
            unit: LocaleKeys.metreSec.tr()),
        InfoMaker.rowInfo(
          LocaleKeys.direction.tr(),
          hourlyWeather.windDeg,
          unit: LocaleKeys.degrees.tr(),
        ),
        InfoMaker.nullCheckPrecipitation(
          LocaleKeys.gust.tr(),
          hourlyWeather.windGust,
          unit: LocaleKeys.metreSec.tr(),
          horizontalPadding: 15,
        ),
      ];
}
