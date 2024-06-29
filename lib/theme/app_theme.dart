import 'package:flutter/material.dart';

class AppTheme {
  // Define your custom colors
  static const Color primaryColor = Color(0xFF009688);
  static const Color secondaryColor = Color(0xFFFF5722);
  static const Color lightPrimaryColor = Color(0xFFB2DFDB);
  static const Color darkPrimaryColor = Color(0xFF00796B);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color darkBackgroundColor = Color(0xFF303030);
  static const Color textColor = Color(0xFF212121);
  static const Color darkTextColor = Color(0xFFFFFFFF);

  // Light theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColor),
      bodyMedium: TextStyle(color: textColor),
      bodySmall: TextStyle(color: textColor),
      headlineSmall: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(
      color: primaryColor,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      background: backgroundColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: textColor,
      surface: backgroundColor,
      onSurface: textColor,
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: darkPrimaryColor,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: darkTextColor),
      bodyMedium: TextStyle(color: darkTextColor),
      bodySmall: TextStyle(color: darkTextColor),
      headlineSmall: TextStyle(color: darkTextColor, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(
      color: darkPrimaryColor,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: darkPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: secondaryColor,
      background: darkBackgroundColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: darkTextColor,
      surface: darkBackgroundColor,
      onSurface: darkTextColor,
    ),
  );
}
