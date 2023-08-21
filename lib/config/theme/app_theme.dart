import 'package:flutter/material.dart';
import 'package:gesture/config/theme/pallete.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Pallete.lightColor,
    // textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: AppBarTheme(
      foregroundColor: Pallete.darkColor,
      centerTitle: true,
      backgroundColor: Pallete.lightColor,
      elevation: 0,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: Pallete.darkColor,
    // textTheme: AppTextTheme.darkTextTheme,
    appBarTheme: AppBarTheme(
      foregroundColor: Pallete.lightColor,
      centerTitle: true,
      backgroundColor: Pallete.darkColor,
      elevation: 0,
    ),
  );
}
