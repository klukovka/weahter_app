import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/daily_weather_widget.dart';

class DailyWeatherListWidget extends StatelessWidget {
  const DailyWeatherListWidget(this.dailyWeather, {Key? key}) : super(key: key);
  final List<DailyWeather> dailyWeather;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return DailyWeatherWidget(dailyWeather[index]);
      },
      itemCount: dailyWeather.length,
    );
  }
}
