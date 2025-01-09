import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/constants/api.dart';
import 'package:weather_app/model/weather_model.dart';

class ApiService {
  Future<WeatherModel> getWeatherData(String searchedArea) async {
    String url = "${Api.BASE_URL}&q=${searchedArea}&days=7";

    try {
      Response response = await get(Uri.parse(url));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map<String, dynamic> json = jsonDecode(response.body);

        WeatherModel weatherModel = WeatherModel.fromJson(json);
        return weatherModel;
      } else {
        throw ("No data found");
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
