import 'package:flutter/material.dart';

class GlobalTheme {
  final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Colors.white,
      elevation: 0,
      actionsIconTheme: const IconThemeData().copyWith(
        color: Colors.deepOrange,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.deepOrange,
      secondary: Colors.deepOrange,
    ),
  );
}
