import 'package:http/http.dart' as http;
import '../models/weather_response.dart';
import '../models/weather_data.dart';

class WeatherService {
  Future<WeatherData> getWeather(double latitude, double longitude) async {
    final uri = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,weather_code,wind_speed_10m',
    );
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Error ${response.statusCode}');
    }
    return weatherResponseFromJson(response.body).current;
  }
}