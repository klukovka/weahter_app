import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/feels_like.dart';
import 'package:weather_app/src/domain/models/temperature.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/temperature_info.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget(
    this.temperature,
    this.feelsLike, {
    Key? key,
  }) : super(key: key);
  final Temperature temperature;
  final FeelsLike feelsLike;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(LocaleKeys.temperature.tr()),
          TemperatureInfo(
            timeOfDay: LocaleKeys.morning.tr(),
            temperature: temperature.morning,
            feelsLike: feelsLike.morning,
          ),
          TemperatureInfo(
            timeOfDay: LocaleKeys.day.tr(),
            temperature: temperature.day,
            feelsLike: feelsLike.day,
          ),
          TemperatureInfo(
            timeOfDay: LocaleKeys.evening.tr(),
            temperature: temperature.evening,
            feelsLike: feelsLike.evening,
          ),
          TemperatureInfo(
            timeOfDay: LocaleKeys.night.tr(),
            temperature: temperature.night,
            feelsLike: feelsLike.night,
          ),
          TemperatureInfo(
            timeOfDay: LocaleKeys.maximum.tr(),
            temperature: temperature.max,
          ),
          TemperatureInfo(
            timeOfDay: LocaleKeys.minimum.tr(),
            temperature: temperature.min,
          ),
        ],
      ),
    );
  }
}
