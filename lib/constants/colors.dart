import 'package:flutter/material.dart';

class AppColors {
  // Primary: White (#FFFFFF)
  static const Color primary = Colors.white;

  // Secondary: Blue (#007AFF)
  static const Color secondary = Colors.blue;

  // Derived shades for themes
  static const Color darkBackground =
      Colors.black; // Dark blue for dark mode backgrounds
  static const Color lightText = Colors.black; // Black text for light mode
  static const Color darkText = primary; // White text for dark mode
  static Color accentHighlight =
      secondary.withOpacity(0.8); // For hover effects
}
