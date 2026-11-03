class WeatherData {
  final double temperature2M;
  final int weatherCode;
  final double windSpeed10M;

  WeatherData({
    required this.temperature2M,
    required this.weatherCode,
    required this.windSpeed10M,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
    temperature2M: json["temperature_2m"]?.toDouble(),
    weatherCode: json["weather_code"],
    windSpeed10M: json["wind_speed_10m"]?.toDouble(),
  );
}