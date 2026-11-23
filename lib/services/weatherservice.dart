import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather.dart';

class WeatherService {
  static final Dio dio = Dio();

  static Future<WeatherList> getWeather() async {
    try {
      final response = await dio.get(
        'https://iats.runasp.net/api/Country/GetCountries',
      );

      return WeatherList.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      final details = e.response?.data ?? e.message;
      throw Exception('Failed to fetch weather data: $details');
    } catch (e) {
      throw Exception('Failed to parse weather data: $e');
    }
  }
}
