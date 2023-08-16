import 'package:flutter/material.dart';
import 'package:gesture/config/theme/pallete.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // textTheme: AppTextTheme.lightTextTheme,
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Pallete.lightColor,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // textTheme: AppTextTheme.darkTextTheme,
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: Pallete.darkColor,
  );
}
