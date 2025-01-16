import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/screens/home/view_model/home_screen_generic.dart';

final homeScreenProvider = StateNotifierProvider<HomeScreenController, HomeScreenGeneric>(
  (ref) => HomeScreenController(),
);

class HomeScreenController extends StateNotifier<HomeScreenGeneric> {
  HomeScreenController() : super(HomeScreenGeneric());

  void setLocation(String text) {
    state = state.update(location: text);
  }
}
