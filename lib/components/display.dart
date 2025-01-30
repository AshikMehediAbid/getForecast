// Display.dart
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:weather_app/components/weather_details.dart';
import 'package:weather_app/components/weather_header.dart';
import 'package:weather_app/components/weather_icon.dart';
import 'package:weather_app/components/weather_type_helper.dart';
import 'package:weather_app/model/weather_model.dart';

class Display extends StatelessWidget {
  final WeatherModel? weatherModel;

  const Display({
    super.key,
    this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
          weatherType: WeatherTypeHelper.getWeatherType(weatherModel?.current),
          width: MediaQuery.of(context).size.width,
          height: 700,
        ),
        SizedBox(
          width: double.infinity,
          height: 600,
          child: Column(
            children: [
              WeatherHeader(weatherModel: weatherModel),
              WeatherIcon(weatherModel: weatherModel),
              WeatherDetails(weatherModel: weatherModel),
            ],
          ),
        ),
      ],
    );
  }
}
