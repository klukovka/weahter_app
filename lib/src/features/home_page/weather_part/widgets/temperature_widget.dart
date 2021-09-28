import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/feels_like.dart';
import 'package:weather_app/src/domain/models/temperature.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/temperature_info.dart';

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
          Text('Temperature'),
          TemperatureInfo(
            timeOfDay: 'Morning: ',
            temperature: temperature.morning,
            feelsLike: feelsLike.morning,
          ),
          TemperatureInfo(
            timeOfDay: 'Day: ',
            temperature: temperature.day,
            feelsLike: feelsLike.day,
          ),
          TemperatureInfo(
            timeOfDay: 'Evening: ',
            temperature: temperature.evening,
            feelsLike: feelsLike.evening,
          ),
          TemperatureInfo(
            timeOfDay: 'Night: ',
            temperature: temperature.night,
            feelsLike: feelsLike.night,
          ),
          TemperatureInfo(
            timeOfDay: 'Maximum: ',
            temperature: temperature.max,
          ),
          TemperatureInfo(
            timeOfDay: 'Minimum:',
            temperature: temperature.min,
          ),
        ],
      ),
    );
  }
}
