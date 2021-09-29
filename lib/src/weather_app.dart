import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/features/settings_screen/google_sign_in_provider.dart';
import 'package:weather_app/src/features/splash_screen/splash_screen.dart';
import 'package:weather_app/src/resources/theme/app_colors.dart';
import 'package:weather_app/src/resources/theme/app_text_theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: appTheme,
        home: const SplashScreen(),
      ),
    );
  }

  ThemeData get appTheme => ThemeData(
        primaryColor: AppColors.green,
        accentColor: AppColors.blue,
        dividerTheme: const DividerThemeData(
          color: AppColors.grayBlue,
          thickness: 3,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.brightBlue),
            foregroundColor: MaterialStateProperty.all(AppColors.black),
          ),
        ),
        textTheme: const TextTheme(
          headline1: AppTextTheme.headline1,
          headline2: AppTextTheme.headline2,
          headline3: AppTextTheme.headline3,
          headline4: AppTextTheme.headline4,
          bodyText1: AppTextTheme.errorText,
        ),
      );
}
