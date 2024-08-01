import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

themeLight() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.black87),
    //   bodyMedium: TextStyle(color: Colors.black54, fontSize: 20),
    //   titleLarge: TextStyle(color: Colors.deepPurple),
    // ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.yellow,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
