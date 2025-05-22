import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 34, 193, 60),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark, // optimizes from seed for dark mode
  seedColor: const Color.fromARGB(255, 0, 0, 0),
);

class Theming {
  final darkTheme = ThemeData.dark().copyWith(
    colorScheme: kDarkColorScheme,
    cardTheme: CardTheme(
      color: kDarkColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer,
      ),
    ),
  );

  final theme = ThemeData().copyWith(
    colorScheme: kColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.primaryContainer,
    ),
    cardTheme: CardTheme(
      color: kColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
        color: kColorScheme.onPrimaryContainer,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    ),
  );
}
