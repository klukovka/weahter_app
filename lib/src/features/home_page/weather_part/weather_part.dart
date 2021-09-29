import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_mode.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_bloc.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_state.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/daily_weather_list_widget.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/hourly_weather_list_widget.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_error.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_loader.dart';


class WeatherPart extends StatelessWidget {
  const WeatherPart({Key? key}) : super(key: key);

  Widget observe({
    required BlocWidgetBuilder<WeatherPartState> builder,
    bool Function(WeatherPartState, WeatherPartState)? buildWhen,
  }) {
    return BlocBuilder<WeatherPartBloc, WeatherPartState>(
        builder: builder, buildWhen: buildWhen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: observe(builder: (context, state) {
        if (state.loading) {
          return const WeatherAppLoader();
        }
        if (state.error != null) {
          return WeatherAppError(state.error!);
        }
      
        if (state.weatherMode == WeatherMode.daily) {
          return DailyWeatherListWidget(state.dailyWeather!);
        }
      
        if (state.weatherMode == WeatherMode.hourly) {
          return HourlyWeatherListWidget(state.hourlyWeather!);
        }
      
        return const SizedBox();
      }),
    );
  }
  
}
