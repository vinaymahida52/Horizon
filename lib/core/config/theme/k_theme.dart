import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/constants/app_constants.dart';

final themeProvider = ChangeNotifierProvider<KTheme>((ref) => KTheme());

class KTheme extends ChangeNotifier {
  static double get largeFontSize => 20.0;
  static double get mediumFontSize => 16.0;
  static double get smallFontSize => 12.0;

  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  TextStyle get bodyLarge =>
      TextStyle(fontSize: largeFontSize, fontFamily: AppConstants.fontFamilty);

  TextStyle get bodyMedium =>
      TextStyle(fontSize: mediumFontSize, fontFamily: AppConstants.fontFamilty);

  TextStyle get bodySmall =>
      TextStyle(fontSize: smallFontSize, fontFamily: AppConstants.fontFamilty);

  TextTheme commonTextTheme({Color color = ColorPalette.blackColor}) {
    return TextTheme(
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
    );
  }

  ButtonStyle get commonButtonStyle => ButtonStyle(
        foregroundColor:
            WidgetStateProperty.all<Color>(ColorPalette.whiteColor),
        backgroundColor:
            WidgetStateProperty.all<Color>(ColorPalette.primaryColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  ThemeData get theme => isDark ? darkTheme : lightTheme;

  AppBarTheme get appBarTheme => AppBarTheme(
        backgroundColor: ColorPalette.whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorPalette.blackColor),
      );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: ColorPalette.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: commonButtonStyle,
        ),
        appBarTheme: appBarTheme,
        textTheme: commonTextTheme(color: ColorPalette.whiteColor),
      );

  ThemeData get lightTheme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: ColorPalette.whiteColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: ColorPalette.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: commonButtonStyle,
        ),
        appBarTheme: appBarTheme,
        textTheme: commonTextTheme(color: ColorPalette.blackColor),
      );
}
