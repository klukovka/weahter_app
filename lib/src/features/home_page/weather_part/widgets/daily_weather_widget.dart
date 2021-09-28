import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/date_time_mapper.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/temperature_info.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/temperature_widget.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/weather_widget.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget(this.dailyWeather, {Key? key}) : super(key: key);
  final DailyWeather dailyWeather;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        DateTineMapper.dateMapToString(dailyWeather.dt),
      ),
      subtitle: _shortInfo,
      children: _allInfo,
    );
  }

  Widget get _shortInfo => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TemperatureInfo(
            timeOfDay: 'Day Temperature',
            temperature: dailyWeather.temperature.day,
            feelsLike: dailyWeather.feelsLike.day,
          ),
          _rowInfo(
            'Clouds',
            dailyWeather.clouds,
            horizontalPadding: 0,
            unit: '%',
          ),
          _rowInfo('Precipitation Probability',
              dailyWeather.precipitationProbability,
              horizontalPadding: 0),
          _nullCheckPrecipitation('Rain', dailyWeather.rain),
          _nullCheckPrecipitation('Snow', dailyWeather.snow),
        ],
      );

  Widget _rowInfo(
    String name,
    dynamic value, {
    String unit = '',
    double horizontalPadding = 15.0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Text('$value $unit'),
          ],
        ),
      );

  Widget _nullCheckPrecipitation(
    String name,
    num? precipitation, [
    String unit = 'mm.',
    double horizontalPadding = 0,
  ]) {
    if (precipitation != null) {
      return _rowInfo(
        name,
        precipitation,
        unit: unit,
        horizontalPadding: horizontalPadding,
      );
    }
    return SizedBox();
  }

  List<Widget> get _allInfo => [
        ..._weatherList,
        Text('Sun'),
        _rowInfo(
            'Sunrise', DateTineMapper.timeMapToString(dailyWeather.sunrise)),
        _rowInfo('Sunset', DateTineMapper.timeMapToString(dailyWeather.sunset)),
        Text('Moon'),
        _rowInfo(
            'Moonrise', DateTineMapper.timeMapToString(dailyWeather.moonrise)),
        _rowInfo(
            'Moonset', DateTineMapper.timeMapToString(dailyWeather.moonset)),
        _rowInfo('Moon Phase', dailyWeather.moonPhase),
        TemperatureWidget(dailyWeather.temperature, dailyWeather.feelsLike),
        Text('Atmosphere'),
        _rowInfo('Pressure', dailyWeather.pressure, unit: 'hPa'),
        _rowInfo('Humidity', dailyWeather.humidity, unit: '%'),
        _rowInfo(' Atmospheric temperature', dailyWeather.dewPoint, unit: '°C'),
        Text('Wind'),
        _rowInfo('Wind speed', dailyWeather.windSpeed, unit: 'metre/sec'),
        _rowInfo('Wind direction', dailyWeather.windDeg, unit: 'degrees'),
        _nullCheckPrecipitation(
            'Wind gust', dailyWeather.windGust, 'metre/sec', 15),
      ];

  List<Widget> get _weatherList {
    final weatherList = <Widget>[Text('Weather')];
    dailyWeather.weather.forEach((weather) {
      weatherList.add(WeatherWidget(weather));
    });
    return weatherList;
  }
}
