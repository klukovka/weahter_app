import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/hourly_weather.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/hourly_weather_widget.dart';

class HourlyWeatherListWidget extends StatelessWidget {
  const HourlyWeatherListWidget(
    this.hourlyWeather, {
    Key? key,
  }) : super(key: key);
  final List<HourlyWeather> hourlyWeather;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return HourlyWeatherWidget(hourlyWeather[index]);
      },
      itemCount: hourlyWeather.length,
    );
  }
}
