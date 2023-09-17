import 'package:flutter/material.dart';
import 'package:firechat/config/theme/pallete.dart';
import 'package:firechat/constants/app_constants.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Pallete.lightColor,
    // textTheme: AppTextTheme.lightTextTheme,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Pallete.primaryColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: Pallete.darkColor,
      centerTitle: true,
      backgroundColor: Pallete.lightColor,
      elevation: 0,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

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
