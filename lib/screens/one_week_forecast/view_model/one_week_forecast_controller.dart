import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/screens/one_week_forecast/view_model/one_week_forecast_generic.dart';

final oneWeekForecastProvider = StateNotifierProvider<OneWeekForecastController, OneWeekForecastGeneric>(
  (ref) => OneWeekForecastController(),
);

class OneWeekForecastController extends StateNotifier<OneWeekForecastGeneric> {
  OneWeekForecastController() : super(OneWeekForecastGeneric());
}
