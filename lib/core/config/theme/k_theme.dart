import 'package:flutter/material.dart';
import 'package:horizon/core/config/theme/color_pallete.dart';
import 'package:horizon/core/constants/app_constants.dart';

class KTheme {
  static double get largeFontSize => 20.0;
  static double get mediumFontSize => 16.0;
  static double get smallFontSize => 12.0;

  static TextStyle get bodyLarge =>
      TextStyle(fontSize: largeFontSize, fontFamily: AppConstants.fontFamilty);

  static TextStyle get bodyMedium =>
      TextStyle(fontSize: mediumFontSize, fontFamily: AppConstants.fontFamilty);

  static TextStyle get bodySmall =>
      TextStyle(fontSize: smallFontSize, fontFamily: AppConstants.fontFamilty);

  static TextTheme commonTextTheme({Color color = ColorPalette.blackColor}) {
    return TextTheme(
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
    );
  }

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: ColorPalette.primaryColor,
        ),
        textTheme: commonTextTheme(color: ColorPalette.whiteColor),
      );

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: ColorPalette.primaryColor,
        ),
        textTheme: commonTextTheme(color: ColorPalette.blackColor),
      );
}
