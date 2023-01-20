import 'package:weather_cubit/exceptions/weather_exception.dart';
import 'package:weather_cubit/models/custom_error.dart';
import 'package:weather_cubit/services/weather_api_services.dart';

import '../models/weather.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;
  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final Weather weather = await weatherApiServices.getWeather(city);

      print('weather: $weather');

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
