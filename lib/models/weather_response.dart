import 'dart:convert';
import 'weather_data.dart';

WeatherResponse weatherResponseFromJson(String str) => WeatherResponse.fromJson(json.decode(str));

class WeatherResponse {
  final WeatherData current;

  WeatherResponse({required this.current});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
    current: WeatherData.fromJson(json["current"]),
  );
}