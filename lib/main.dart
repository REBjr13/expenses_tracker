import 'package:expenses_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 34, 193, 60),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,//overrides some aspects
          foregroundColor: kColorScheme.primaryContainer,
        ),
      ),
      home: const ExpensesTrack(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
