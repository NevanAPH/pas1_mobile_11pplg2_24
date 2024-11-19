import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF3D84EE);
  static const Color primaryColorLight = Color(0xFF3DADDD);
  static const Color primaryColorLighter = Color(0xFFC5F1FF);
  static const Color primaryColorDark = Color(0xFF257090);
  static const Color secondaryColor = Color(0xFF1BCA61);
  static const Color secondaryColorLight = Color(0xFF3DEB83);
  static const Color secondaryColorDark = Color(0xFF289D5E);
  static const Color warningColor = Color(0xFFD1B151);
  static const Color warningColorLight = Color(0xFFFEE564);
  static const Color warningColorDark = Color(0xFFB08C3C);
  static const Color errorColor = Color(0xFFFF6666);
  static const Color errorColorLight = Color(0xFFFF8585);
  static const Color errorColorDark = Color(0xFFEA4747);
  static const Color backgroundColor = Color(0xFFF4F4F4);
  static const Color backgroundLightColor = Color(0xFFFFFFFF);

  static const Color white100 = Color(0xFFFFFFFF);
  static const Color white90 = Color(0xFFEEEEEE);
  static const Color white80 = Color(0xFFDDDDDD);
  static const Color white50 = Color(0xFF888888);
  static const Color white30 = Color(0xFF555555);
  static const Color white10 = Color(0xFF333333);
  static const Color black = Color(0xFF0C0C20);

  static const Color textPrimaryColor = AppTheme.black;
  static const Color textSecondaryColor = AppTheme.white10;
  static const Color textButtonColor = AppTheme.white90;
  static const Color hintColor = AppTheme.white50;
  static const Color cursorColor = AppTheme.primaryColor;

  static ThemeData getThemeData() {
    return ThemeData(
        useMaterial3: true,
        primaryColor: AppTheme.primaryColor,
        primaryColorLight: AppTheme.primaryColorLight,
        primaryColorDark: AppTheme.primaryColorDark,
        scaffoldBackgroundColor: AppTheme.backgroundColor,
        hintColor: AppTheme.hintColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppTheme.white100,
        ),
        textTheme: const TextTheme(
          // Title
          titleLarge: TextStyle(
            fontFamily: 'Outfit',
            color: AppTheme.primaryColor,
            fontSize: 50,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Outfit',
            color: AppTheme.primaryColor,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Outfit',
            color: AppTheme.primaryColor,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),

          // Body
          bodyLarge: TextStyle(
            fontFamily: 'Outfit',
            color: AppTheme.textSecondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Outfit',
            color: AppTheme.textSecondaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Outfit',
            color: AppTheme.hintColor,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),

          // Label
          labelLarge: TextStyle(
            fontFamily: 'Outfit',
            color: AppTheme.textSecondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Outfit',
            color: AppTheme.textSecondaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Outfit',
            color: AppTheme.textSecondaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
