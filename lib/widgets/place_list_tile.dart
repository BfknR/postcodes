import 'package:flutter/material.dart';

import '../models/place.dart';
import '../styles/app_styles.dart';

class PlaceListTile extends StatelessWidget {
  const PlaceListTile({super.key, required this.place, this.onTap});

  final Place place;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.location_city_rounded, color: AppStyles.primary),
      title: Text(place.name, style: AppStyles.placeName),
      subtitle: Text(
        '${place.admin2} · ${place.admin1}',
        style: AppStyles.placeSubtitle,
      ),
    );
  }
}
