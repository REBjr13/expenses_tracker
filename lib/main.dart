import 'package:expenses_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
//import "package:flutter/services.dart";

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 34, 193, 60),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark, //optimizes from seed for dark mode
  seedColor: const Color.fromARGB(255, 0, 0, 0),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();//locks orientation
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
    runApp(
      MaterialApp(
        // darkTheme: Theming().darkTheme,
        // theme: Theming().theme,
        // themeMode: ThemeMode.light, //system theme mode
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ), //sometimes you use styleFrom others copyWith
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor:
                kColorScheme.onPrimaryContainer, //overrides some aspects
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ), //sometimes you use styleFrom others copyWith
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              color: kColorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        home: const ExpensesTrack(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
  //);
//}

