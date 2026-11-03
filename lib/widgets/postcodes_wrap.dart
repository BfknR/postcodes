import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class PostcodesWrap extends StatelessWidget {
  const PostcodesWrap({super.key, required this.postcodes});

  final List<String>? postcodes;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: postcodes == null || postcodes!.isEmpty
          ? [
              Text(
                'No hi ha codis postals disponibles',
                style: AppStyles.bodyText,
              ),
            ]
          : [
              for (final code in postcodes ?? [])
                Chip(label: Text(code, style: AppStyles.placeSubtitle)),
            ],
    );
  }
}
