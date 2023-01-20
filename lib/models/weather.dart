import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String region;
  final String name;
  final double tempC;
  final double tempF;
  final String condition;
  final String icon;
  final double precip;
  final DateTime lastUpdated;
  const Weather({
    required this.region,
    required this.name,
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.icon,
    required this.precip,
    required this.lastUpdated,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final consolidatedLocation = json;
    // final consolidatedCurrent = json['current'];

    return Weather(
      region: consolidatedLocation['location']['region'],
      name: consolidatedLocation['location']['name'],
      tempC: consolidatedLocation['current']['temp_c'],
      tempF: consolidatedLocation['current']['temp_f'],
      condition: consolidatedLocation['current']['condition']['text'],
      icon: consolidatedLocation['current']['condition']['icon'],
      precip: consolidatedLocation['current']['precip_mm'],
      lastUpdated: DateTime.now(),
    );
  }

  factory Weather.initial() => Weather(
      region: '',
      name: '',
      tempC: 100,
      tempF: 100,
      condition: '',
      icon: '',
      precip: -1,
      lastUpdated: DateTime(1970));

  @override
  List<Object> get props {
    return [
      region,
      name,
      tempC,
      tempF,
      icon,
      precip,
      lastUpdated,
    ];
  }

  @override
  String toString() {
    return 'Weather(region: $region, name: $name, tempC: $tempC, tempF: $tempF, condition: $condition, country: $icon, precip: $precip, lastUpdated: $lastUpdated)';
  }
}
