import 'package:flutter/material.dart';
import '../models/weather_data.dart';
import '../styles/app_styles.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weatherFuture});

  final Future<WeatherData> weatherFuture;

  String _weatherDescription(int code) {
    if (code == 0) return 'Cel serè';
    if (code <= 3) return 'Alguns núvols';
    if (code <= 48) return 'Boira';
    if (code <= 67) return 'Pluja';
    if (code <= 77) return 'Neu';
    if (code <= 82) return 'Ruixats';
    if (code <= 86) return 'Ruixats de neu';
    return 'Tempesta';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherData>(
      future: weatherFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            'No s\'ha pogut carregar el temps.',
            style: AppStyles.hint,
          );
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final weather = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${weather.temperature2M}°C · ${weather.windSpeed10M} km/h',
              style: AppStyles.bodyText,
            ),
            Text(
              _weatherDescription(weather.weatherCode),
              style: AppStyles.placeSubtitle,
            ),
          ],
        );
      },
    );
  }
}
