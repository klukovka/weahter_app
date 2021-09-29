import 'package:flutter/material.dart';
import 'package:weather_app/src/resources/theme/app_colors.dart';

class AppTextTheme {
  static const headline1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static const headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const headline3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static const headline4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  );

  static const errorText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.error,
  );
}
