import 'package:ecommerce/core/utils/constants.dart';
import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData light = ThemeData(
    fontFamily: "DarkGrotesque",
    // ? Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        primary: Constants.orange_background,
      ),
    ),

    // ? AppBar
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    // ? Scaffold
    scaffoldBackgroundColor: const Color(0xffF5F7F9),
    // ?Floating action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}
