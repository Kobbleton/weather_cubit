import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String weatherStateName;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String title;
  final int woeid;
  final DateTime lastUpdated;
  const Weather({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.title,
    required this.woeid,
    required this.lastUpdated,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final consolidatedWeather = json['consolidated_seather'][0];

    return Weather(
      weatherStateName: consolidatedWeather['weather_state_name'],
      weatherStateAbbr: consolidatedWeather['weather_state_abbr'],
      created: consolidatedWeather['created'],
      minTemp: consolidatedWeather['min_temp'],
      maxTemp: consolidatedWeather['max_temp'],
      theTemp: consolidatedWeather['the_temp'],
      title: consolidatedWeather['title'],
      woeid: consolidatedWeather['woeid'],
      lastUpdated: DateTime.now(),
    );
  }

  factory Weather.initial() => Weather(
      weatherStateName: '',
      weatherStateAbbr: '',
      created: '',
      minTemp: 100,
      maxTemp: 100,
      theTemp: 100,
      title: '',
      woeid: -1,
      lastUpdated: DateTime(1970));

  @override
  List<Object> get props {
    return [
      weatherStateName,
      weatherStateAbbr,
      created,
      minTemp,
      maxTemp,
      title,
      woeid,
      lastUpdated,
    ];
  }

  @override
  String toString() {
    return 'Weather(weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, created: $created, minTemp: $minTemp, maxTemp: $maxTemp, title: $title, woeid: $woeid, lastUpdated: $lastUpdated)';
  }
}
