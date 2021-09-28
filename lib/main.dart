import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter/material.dart';
import 'package:weather_app/src/weather_app.dart';
import 'package:weather_app/src/resources/translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  await DotEnv.dotenv.load(fileName: '.env');
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [
        Locale('en'),
        Locale('ru'),
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: WeatherApp(),
    ),
  );
}
