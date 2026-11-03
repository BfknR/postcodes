import 'package:flutter/material.dart';
import 'package:postcodes/models/weather_data.dart';
import 'package:postcodes/services/weather_service.dart';

import '../models/place.dart';
import '../styles/app_styles.dart';
import '../widgets/postcodes_wrap.dart';
import '../widgets/weather_card.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final Place place;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late Future<WeatherData> weatherFuture;
  final weatherService = WeatherService();

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
            PostcodesWrap(postcodes: widget.place.postcodes),
            AppStyles.bigSeparator,
            Text('TEMPS ACTUAL', style: AppStyles.sectionLabel),
            AppStyles.smallSeparator,
            WeatherCard(weatherFuture: weatherFuture),
          ],
        ),
      ),
    );
  }
}
