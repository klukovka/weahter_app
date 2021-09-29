import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/weather.dart';
import 'package:weather_app/src/resources/theme/app_text_theme.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget(this.weather, {Key? key}) : super(key: key);
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(weather.main,style: AppTextTheme.headline4 ,),
      subtitle: Text(weather.description,style: AppTextTheme.headline4 ,),
      trailing: Text(weather.icon,style: AppTextTheme.headline4 ,),
    );
  }
}
