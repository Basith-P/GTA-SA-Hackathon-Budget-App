import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme({isDark = false}) => ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
      );
}
