import 'package:flutter/material.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Text(timeOfDay),
        Text('$temperature°C $_feelsLike'),
      ],
    );
  }

  String get _feelsLike => feelsLike != null ? '(${LocaleKeys.feelsLike.tr()}: $feelsLike°C)' : '';
}
