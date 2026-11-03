import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postcodes/screens/search_screen.dart';
import 'package:postcodes/styles/app_styles.dart';

void main() {
  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  } else {
    debugPrint = (message, {wrapWidth}) {
      final lines = '$message'.split('\n').map((line) => '[PostCodes] $line');
      debugPrintThrottled(lines.join('\n'), wrapWidth: wrapWidth);
    };
  }
  runApp(const PostCodeApp());
}

class PostCodeApp extends StatelessWidget {
  const PostCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.googleSans().fontFamily,
        colorScheme: ColorScheme.dark(
          primary: AppStyles.primary,
          secondary: AppStyles.onPrimary,
        ),
        scaffoldBackgroundColor: AppStyles.background,
        appBarTheme: AppBarTheme(
          backgroundColor: AppStyles.onPrimary,
          foregroundColor: AppStyles.primary,
        ),
        inputDecorationTheme: AppStyles.searchInputDecoration,
      ),
      home: const SearchScreen(),
    );
  }
}
