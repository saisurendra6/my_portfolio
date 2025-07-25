import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ThemeProvider {
  static final ValueNotifier<ThemeData> themeNotifier =
      ValueNotifier(lightTheme); // Initial theme

  static ThemeData get currentTheme => themeNotifier.value;

  static void toggleTheme() {
    themeNotifier.value = (themeNotifier.value.brightness == Brightness.light)
        ? darkTheme
        : lightTheme;
  }

  // Light Theme: White-dominant with blue accents
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary, // White as primary
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondary, // Blue as accent seed
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    scaffoldBackgroundColor: AppColors.primary,
    cardColor: AppColors.primary.withOpacity(0.95),
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.lightText,
      ),
      headlineMedium: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.lightText,
      ),
      bodyLarge: const TextStyle(fontSize: 16, color: AppColors.lightText),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.grey[800]),
      labelMedium: const TextStyle(
        // NavBar text: Black in light mode
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.lightText, // Changed to black
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.secondary),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.secondary,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.secondary, // Text color
        side: const BorderSide(color: AppColors.secondary, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );

  // Dark Theme: Dark blue-dominant with white accents
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.darkBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondary,
      brightness: Brightness.dark,
      primary: AppColors.darkBackground,
      secondary: AppColors.secondary,
    ),
    cardColor: AppColors.darkBackground.withOpacity(0.95),
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.darkText,
      ),
      headlineMedium: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.darkText,
      ),
      bodyLarge: const TextStyle(fontSize: 16, color: AppColors.darkText),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.grey[300]),
      labelMedium: const TextStyle(
        // NavBar text: White in dark mode
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.primary, // White
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.primary),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.secondary,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.darkBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary, // Text color (white)
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
