import 'package:flutter/material.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/info_maker.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class TemperatureInfo extends StatelessWidget {
  const TemperatureInfo({
    required this.timeOfDay,
    required this.temperature,
    this.feelsLike,
    Key? key,
  }) : super(key: key);
  final String timeOfDay;
  final num temperature;
  final num? feelsLike;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoMaker.rowInfo(
          timeOfDay,
          temperature,
          unit: '°C',
          horizontalPadding: 0,
        ),
        if (feelsLike != null)
          InfoMaker.rowInfo(
            LocaleKeys.feelsLike.tr(),
            feelsLike,
            unit: '°C',
            horizontalPadding: 0,
          ),
      ],
    );
  }
}
