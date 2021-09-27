import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter/material.dart';
import 'package:weather_app/src/weather_app.dart';
Future<void> main() async {
 await DotEnv.dotenv.load(fileName: '.env');
  runApp(WeatherApp());
}
