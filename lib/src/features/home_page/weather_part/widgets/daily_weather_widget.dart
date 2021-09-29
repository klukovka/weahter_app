import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/date_time_mapper.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/info_maker.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/temperature_widget.dart';
import 'package:weather_app/src/resources/theme/app_text_theme.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget(this.dailyWeather, {Key? key}) : super(key: key);
  final DailyWeather dailyWeather;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        DateTineMapper.dateMapToString(dailyWeather.dt),
        style: Theme.of(context).textTheme.headline3,
      ),
      subtitle: InfoMaker.shortInfo(
        dailyWeather.temperature.day,
        dailyWeather.feelsLike.day,
        dailyWeather.clouds,
        dailyWeather.precipitationProbability,
        dailyWeather.rain,
        dailyWeather.snow,
      ),
      children: _allInfo,
    );
  }

  List<Widget> get _allInfo => [
        ...InfoMaker.weatherList(dailyWeather.weather),
        Text(LocaleKeys.sun.tr(),style: AppTextTheme.headline3),
        InfoMaker.rowInfo(
          LocaleKeys.sunrise.tr(),
          DateTineMapper.timeMapToString(dailyWeather.sunrise),
        ),
        InfoMaker.rowInfo(
          LocaleKeys.sunset.tr(),
          DateTineMapper.timeMapToString(dailyWeather.sunset),
        ),
        Text(LocaleKeys.moon.tr(),style: AppTextTheme.headline3),
        InfoMaker.rowInfo(
          LocaleKeys.moonrise.tr(),
          DateTineMapper.timeMapToString(dailyWeather.moonrise),
        ),
        InfoMaker.rowInfo(LocaleKeys.moonset.tr(),
            DateTineMapper.timeMapToString(dailyWeather.moonset)),
        InfoMaker.rowInfo(LocaleKeys.moonPhase.tr(), dailyWeather.moonPhase),
        TemperatureWidget(dailyWeather.temperature, dailyWeather.feelsLike),
        Text(LocaleKeys.atmosphere.tr(),style: AppTextTheme.headline3),
        InfoMaker.rowInfo(
          LocaleKeys.pressure.tr(),
          dailyWeather.pressure,
          unit: LocaleKeys.hPa.tr(),
        ),
        InfoMaker.rowInfo(LocaleKeys.humidity.tr(), dailyWeather.humidity,
            unit: '%'),
        InfoMaker.rowInfo(
            LocaleKeys.atmosphericTemperature.tr(), dailyWeather.dewPoint,
            unit: '°C'),
        Text(LocaleKeys.wind.tr(),style: AppTextTheme.headline3),
        InfoMaker.rowInfo(LocaleKeys.speed.tr(), dailyWeather.windSpeed,
            unit: LocaleKeys.metreSec.tr()),
        InfoMaker.rowInfo(LocaleKeys.direction.tr(), dailyWeather.windDeg,
            unit: LocaleKeys.degrees.tr()),
        InfoMaker.nullCheckPrecipitation(
            LocaleKeys.gust.tr(), dailyWeather.windGust,
            unit: LocaleKeys.metreSec.tr(), horizontalPadding: 15),
      ];
}
