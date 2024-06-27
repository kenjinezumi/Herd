import 'package:flutter/material.dart';

ThemeData darkThemeData() {
  return ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: Colors.black,  // AppBar color for dark theme
      iconTheme: IconThemeData(color: Colors.white),  // Icons color for dark theme
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),  // Title text color for dark theme
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,  // Selected item color for dark theme
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),  // Main body text color for dark theme
      bodyMedium: TextStyle(color: Colors.white),  // Secondary body text color for dark theme
    ),
  );
}
