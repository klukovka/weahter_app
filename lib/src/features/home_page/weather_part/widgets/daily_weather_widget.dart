import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/date_time_mapper.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/info_maker.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/temperature_widget.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget(this.dailyWeather, {Key? key}) : super(key: key);
  final DailyWeather dailyWeather;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        DateTineMapper.dateMapToString(dailyWeather.dt),
      ),
      subtitle: InfoMaker.shortInfo(
        dailyWeather.temperature.day,
        dailyWeather.feelsLike.day,
        dailyWeather.clouds,
        dailyWeather.precipitationProbability,
        dailyWeather.rain,
        dailyWeather.snow,
      ),
      children: _allInfo,
    );
  }

  List<Widget> get _allInfo => [
        ...InfoMaker.weatherList(dailyWeather.weather),
        Text('Sun'),
        InfoMaker.rowInfo(
            'Sunrise', DateTineMapper.timeMapToString(dailyWeather.sunrise)),
        InfoMaker.rowInfo(
            'Sunset', DateTineMapper.timeMapToString(dailyWeather.sunset)),
        Text('Moon'),
        InfoMaker.rowInfo(
            'Moonrise', DateTineMapper.timeMapToString(dailyWeather.moonrise)),
        InfoMaker.rowInfo(
            'Moonset', DateTineMapper.timeMapToString(dailyWeather.moonset)),
        InfoMaker.rowInfo('Moon Phase', dailyWeather.moonPhase),
        TemperatureWidget(dailyWeather.temperature, dailyWeather.feelsLike),
        Text('Atmosphere'),
        InfoMaker.rowInfo('Pressure', dailyWeather.pressure, unit: 'hPa'),
        InfoMaker.rowInfo('Humidity', dailyWeather.humidity, unit: '%'),
        InfoMaker.rowInfo('Atmospheric temperature', dailyWeather.dewPoint,
            unit: '°C'),
        Text('Wind'),
        InfoMaker.rowInfo('Wind speed', dailyWeather.windSpeed,
            unit: 'metre/sec'),
        InfoMaker.rowInfo('Wind direction', dailyWeather.windDeg,
            unit: 'degrees'),
        InfoMaker.nullCheckPrecipitation(
            'Wind gust', dailyWeather.windGust, 'metre/sec', 15),
      ];
}
