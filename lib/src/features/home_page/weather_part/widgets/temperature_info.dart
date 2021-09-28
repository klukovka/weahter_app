import 'package:flutter/material.dart';

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

  String get _feelsLike => feelsLike != null ? '(Feels like: $feelsLike°C)' : '';
}
