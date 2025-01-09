import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/components/display.dart';
import 'package:weather_app/screens/components/weather_by_hour.dart';
import 'package:weather_app/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: apiService.getWeatherData("Dhaka"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherModel? weatherModel = snapshot.data;
            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Display(
                    weatherModel: weatherModel,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 150,
                    child: WeatherByHour(
                      weatherModel: weatherModel,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}
