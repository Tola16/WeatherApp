import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/services/weatherservice.dart' show WeatherService;

class WeatherProvider extends ChangeNotifier {
  WeatherList? weatherModel;
  bool isLoading = false;
  String? error;

  Future<void> fetchWeather() async {
    if (isLoading || weatherModel != null) return;

    isLoading = true;
    error = null;
    try {
      weatherModel = await WeatherService.getWeather();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
