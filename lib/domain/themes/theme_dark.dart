import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

themeDark() {
  return ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.handlee().fontFamily,
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.yellow, fontSize: 34),
    //   bodyMedium: TextStyle(color: Colors.red, fontSize: 34),
    //   titleLarge: TextStyle(color: Colors.blue, fontSize: 30),
    // ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.grey,
      style: ListTileStyle.list,
      contentPadding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white60,
        backgroundColor: Colors.red.shade900,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.red,
      titleTextStyle: GoogleFonts.roboto(color: Colors.yellow, fontSize: 20),
    ),
    scaffoldBackgroundColor: Colors.grey[900],
  );
}
