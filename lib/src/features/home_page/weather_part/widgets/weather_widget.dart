import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/weather.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget(this.weather, {Key? key}) : super(key: key);
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(weather.main),
      subtitle: Text(weather.description),
      trailing: Text(weather.icon),
    );
  }
}
