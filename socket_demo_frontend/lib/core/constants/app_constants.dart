import 'package:flutter/material.dart';

class AppConstants {
  static final String baseUrl = "http://localhost:3000";
  static ThemeData themeData = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              overlayColor: Colors.transparent,
              backgroundColor: Colors.black87,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          )
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              overlayColor: Colors.transparent
          )
      )
  );
}