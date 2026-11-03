import 'package:flutter/material.dart';
import 'package:postcodes/models/weather_data.dart';
import 'package:postcodes/services/weather_service.dart';

import '../models/place.dart';
import '../styles/app_styles.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final Place place;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late Future<WeatherData> weatherFuture;
  final weatherService = WeatherService();

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
  void initState() {
    super.initState();
    weatherFuture = weatherService.getWeather(
      widget.place.latitude,
      widget.place.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.place.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.place.admin2} · ${widget.place.admin1}',
              style: AppStyles.placeSubtitle,
            ),
            AppStyles.mediumSeparator,
            if (widget.place.population != null)
              Text(
                'Habitants: ${widget.place.population}',
                style: AppStyles.bodyText,
              ),
            AppStyles.smallSeparator,
            Text(
              'Coordenades: ${widget.place.latitude}, ${widget.place.longitude}',
              style: AppStyles.bodyText,
            ),
            AppStyles.mediumSeparator,
            Text('CODIS POSTALS', style: AppStyles.sectionLabel),
            AppStyles.smallSeparator,
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final code in widget.place.postcodes ?? [])
                  Chip(label: Text(code, style: AppStyles.placeSubtitle)),
              ],
            ),
            AppStyles.bigSeparator,
            Text("TEMPS ACTUAL", style: AppStyles.sectionLabel),
            AppStyles.smallSeparator,
            FutureBuilder(
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
            ),
          ],
        ),
      ),
    );
  }
}
