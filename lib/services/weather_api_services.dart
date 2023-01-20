import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_cubit/constants/constants.dart';
import 'package:weather_cubit/models/weather.dart';
import 'package:weather_cubit/services/http_error_handler.dart';

class WeatherApiServices {
  final http.Client httpClient;
  WeatherApiServices({
    required this.httpClient,
  });

  Future<Weather> getWeather(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kHost,
        path: '/v1/current.json',
        queryParameters: {'key': kApiKey, 'q': city, 'aqi': 'no'});

//current.json?key=$kApiKey&q=$city&aqi=no

    try {
      
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final weatherJson = json.decode(response.body);
      

      final Weather weather = Weather.fromJson(weatherJson);

      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
