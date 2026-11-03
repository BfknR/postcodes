import 'package:flutter/material.dart';
import '../models/place.dart';
import '../styles/app_styles.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${place.admin2} · ${place.admin1}', style: AppStyles.placeSubtitle),
            AppStyles.mediumSeparator,
            if (place.population != null)
              Text('Habitants: ${place.population}', style: AppStyles.bodyText),
            AppStyles.smallSeparator,
            Text('Coordenades: ${place.latitude}, ${place.longitude}', style: AppStyles.bodyText),
            AppStyles.mediumSeparator,
            Text('CODIS POSTALS', style: AppStyles.sectionLabel),
            AppStyles.smallSeparator,
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final code in place.postcodes ?? [])
                  Chip(label: Text(code, style: AppStyles.placeSubtitle)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}