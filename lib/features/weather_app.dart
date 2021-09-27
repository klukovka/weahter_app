import 'package:flutter/material.dart';
import 'package:weather_app/features/coordinates_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CoordinatesScreen(),);
  }
}
