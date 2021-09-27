import 'package:flutter/material.dart';
import 'package:weather_app/src/features/home_page/home_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),);
  }
}
