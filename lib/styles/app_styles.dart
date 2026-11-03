import 'package:flutter/material.dart';

class AppStyles {
  // Colors
  static const Color primary = Color(0xFFF2F2F2);
  static const Color onPrimary = Color(0xFF1A1A1A);
  static const Color background = Color(0xFF1A1A1A);
  static const Color surface = Color(0xFF2A2A2A);
  static const Color textPrimary = Color(0xFFF2F2F2);
  static const Color textSecondary = Color(0xFF9E9E9E);

  // Text styles
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: onPrimary,
    letterSpacing: 0.5,
  );

  static const TextStyle placeName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );

  static const TextStyle placeSubtitle = TextStyle(
    fontSize: 13,
    color: textSecondary,
  );

  static const TextStyle sectionLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textSecondary,
    letterSpacing: 1.2,
  );

  static const TextStyle bodyText = TextStyle(fontSize: 15, color: textPrimary);

  static const TextStyle hint = TextStyle(fontSize: 15, color: textSecondary);

  // Input decoration
  static const InputDecorationTheme searchInputDecoration =
      InputDecorationTheme(
        hintStyle: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textSecondary, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      );

  // Separators
  static const Widget tinySeparator = SizedBox(width: 4, height: 4);
  static const Widget smallSeparator = SizedBox(width: 8, height: 8);
  static const Widget mediumSeparator = SizedBox(width: 16, height: 16);
  static const Widget bigSeparator = SizedBox(width: 24, height: 24);
}
