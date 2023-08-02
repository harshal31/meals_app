import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorScheme = ColorScheme.fromSwatch(
  brightness: Brightness.light,
  primarySwatch: getMaterialColor(
    const Color.fromARGB(255, 131, 57, 0),
  ),
);

final kDarkColorScheme = ColorScheme.fromSwatch(
  brightness: Brightness.dark,
  primarySwatch: getMaterialColor(
    const Color.fromARGB(255, 5, 99, 125),
  ),
);

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;
  final int alpha = color.alpha;

  final Map<int, Color> shades = {
    50: Color.fromARGB(alpha, red, green, blue),
    100: Color.fromARGB(alpha, red, green, blue),
    200: Color.fromARGB(alpha, red, green, blue),
    300: Color.fromARGB(alpha, red, green, blue),
    400: Color.fromARGB(alpha, red, green, blue),
    500: Color.fromARGB(alpha, red, green, blue),
    600: Color.fromARGB(alpha, red, green, blue),
    700: Color.fromARGB(alpha, red, green, blue),
    800: Color.fromARGB(alpha, red, green, blue),
    900: Color.fromARGB(alpha, red, green, blue),
  };

  return MaterialColor(color.value, shades);
}

ThemeData darkTheme() => ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
        elevation: 6.0,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
      ),
      textTheme: GoogleFonts.jetBrainsMonoTextTheme(
        ThemeData.dark().copyWith(brightness: Brightness.dark).textTheme,
      ),
      snackBarTheme: const SnackBarThemeData().copyWith(
        backgroundColor: kDarkColorScheme.background,
        actionTextColor: kDarkColorScheme.onPrimaryContainer,
        actionBackgroundColor: kColorScheme.primaryContainer.withOpacity(0.4),
      ),
      datePickerTheme: const DatePickerThemeData().copyWith(),
    );

ThemeData lightTheme() => ThemeData().copyWith(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.primaryContainer,
        foregroundColor: kColorScheme.onPrimaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
        elevation: 6.0,
      ),
      textTheme: GoogleFonts.jetBrainsMonoTextTheme(),
    );

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }

  ColorScheme colorScheme() {
    return Theme.of(this).colorScheme;
  }
}
