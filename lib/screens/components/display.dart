import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class Display extends StatelessWidget {
  final WeatherModel? weatherModel;
  Display({
    super.key,
    this.weatherModel,
  });

  WeatherType getWeatherType(Current? current) {
    if (current?.isDay == 1) {
      String txt = current?.condition?.text;

      if (txt == 'Sunny' || txt == 'Clear') {
        return WeatherType.sunny;
      }
      if (txt == 'Light snow') {
        return WeatherType.lightSnow;
      }
      if (txt == 'OverCast') {
        return WeatherType.overcast;
      }
      if (txt == 'Partly Cloud' || txt == 'Cloudy') {
        return WeatherType.cloudy;
      }
      if (txt == 'Mist') {
        return WeatherType.lightSnow;
      }
      if (txt.contains('thunder')) {
        return WeatherType.thunder;
      }
      if (txt.contains('rain')) {
        return WeatherType.heavyRainy;
      }
      if (txt.contains('showers')) {
        return WeatherType.middleSnow;
      }
    } else {
      String txt = current?.condition?.text;

      if (txt == 'Sunny' || txt == 'Clear') {
        return WeatherType.sunnyNight;
      }
      if (txt == 'OverCast') {
        return WeatherType.overcast;
      }
      if (txt == 'Partly Cloud' || txt == 'Cloudy') {
        return WeatherType.cloudyNight;
      }
      if (txt == 'Mist') {
        return WeatherType.lightSnow;
      }
      if (txt.contains('thunder')) {
        return WeatherType.thunder;
      }
      if (txt.contains('rain')) {
        return WeatherType.heavyRainy;
      }
      if (txt.contains('showers')) {
        return WeatherType.middleSnow;
      }
    }

    return WeatherType.thunder;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
          weatherType: getWeatherType(weatherModel?.current),
          width: MediaQuery.of(context).size.width,
          height: 700,
        ),
        SizedBox(
          width: double.infinity,
          height: 600,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weatherModel?.location?.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            " , ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            weatherModel?.location?.country,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(
                          DateTime.parse(
                            weatherModel?.current?.lastUpdated.toString() ?? "",
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Last Updated: ${(DateFormat.Hm().format(
                          DateTime.parse(
                            weatherModel?.current?.lastUpdated.toString() ?? "",
                          ),
                        ))}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white10,
                          ),
                          child: Image.network("https:${weatherModel?.current?.condition?.icon}" ?? ""),
                        ),
                        Text(
                          weatherModel?.current?.condition?.text ?? "",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weatherModel?.current?.tempC?.round().toString() ?? "",
                              style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "o",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "C",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Feels Like:  ${weatherModel?.current?.feelslikeC.round().toString() ?? ""}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Wind:  ${weatherModel?.current?.windKph?.toString()}km/h",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Humidity:  ${weatherModel?.current?.humidity?.round().toString() ?? ""}%",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Visibility:  ${weatherModel?.current?.visKm?.toString()}km",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
