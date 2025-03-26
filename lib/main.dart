import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 240, 171, 253));
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      cardTheme: const CardTheme(
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.greenAccent,
          backgroundColor: const Color.fromARGB(255, 204, 245, 176),
        ),
      ),
    ),
    home: const Expenses(),
  ));
}
