import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/components/display.dart';
import 'package:weather_app/components/twenty_four_hour_forecast.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/home/view_model/home_screen_controller.dart';
import 'package:weather_app/screens/one_week_forecast/view/seven_days_forecast.dart';
import 'package:weather_app/service/api_service.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  ApiService apiService = ApiService();

  final _searchController = TextEditingController();

  _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Searched Location"),
            content: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search by city / zip",
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _searchController.clear();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_searchController.text.isEmpty) return;
                  Navigator.of(context).pop(_searchController.text.trim());
                  _searchController.clear();
                },
                child: Text("Ok"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenController = ref.watch(homeScreenProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                String text = await _showTextInputDialog(context);
                ref.read(homeScreenProvider.notifier).setLocation(text);
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                ref.read(homeScreenProvider.notifier).setLocation("auto:ip");
              },
              icon: Icon(Icons.my_location)),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: apiService.getWeatherData(homeScreenController.searchedText),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Display(
                          weatherModel: weatherModel,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "24 hours forecast",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TwentyFourHourForecast(
                            weatherModel: weatherModel,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        width: MediaQuery.of(context).size.width * .9,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.teal.shade900),
                            foregroundColor: WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SevenDaysForecast(
                                  weatherModel: weatherModel,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "7 days forecast",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
