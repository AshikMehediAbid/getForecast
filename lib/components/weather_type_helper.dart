// WeatherTypeHelper.dart
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

import '../model/weather_model.dart';

class WeatherTypeHelper {
  static WeatherType getWeatherType(Current? current) {
    if (current == null) return WeatherType.thunder;

    final String? text = current.condition?.text;
    final bool isDay = current.isDay == 1;

    if (text == null) return WeatherType.thunder;

    if (isDay) {
      return _getDayWeatherType(text);
    } else {
      return _getNightWeatherType(text);
    }
  }

  static WeatherType _getDayWeatherType(String text) {
    if (text == 'Sunny' || text == 'Clear') return WeatherType.sunny;
    if (text == 'Light snow') return WeatherType.lightSnow;
    if (text == 'OverCast') return WeatherType.overcast;
    if (text == 'Partly Cloud' || text == 'Cloudy') return WeatherType.cloudy;
    if (text == 'Mist') return WeatherType.lightSnow;
    if (text.contains('thunder')) return WeatherType.thunder;
    if (text.contains('rain')) return WeatherType.heavyRainy;
    if (text.contains('showers')) return WeatherType.middleSnow;
    return WeatherType.thunder;
  }

  static WeatherType _getNightWeatherType(String text) {
    if (text == 'Sunny' || text == 'Clear') return WeatherType.sunnyNight;
    if (text == 'OverCast') return WeatherType.overcast;
    if (text == 'Partly Cloud' || text == 'Cloudy') return WeatherType.cloudyNight;
    if (text == 'Mist') return WeatherType.lightSnow;
    if (text.contains('thunder')) return WeatherType.thunder;
    if (text.contains('rain')) return WeatherType.heavyRainy;
    if (text.contains('showers')) return WeatherType.middleSnow;
    return WeatherType.thunder;
  }
}
