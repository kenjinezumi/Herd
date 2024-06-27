import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.white,  // AppBar color for light theme
      iconTheme: IconThemeData(color: Colors.black),  // Icons color for light theme
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),  // Title text color for light theme
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,  // Selected item color for light theme
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),  // Main body text color for light theme
      bodyMedium: TextStyle(color: Colors.black),  // Secondary body text color for light theme
    ),
  );
}
