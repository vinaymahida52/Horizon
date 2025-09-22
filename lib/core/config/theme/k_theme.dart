import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/constants/app_constants.dart';

final themeProvider = ChangeNotifierProvider<KTheme>((ref) => KTheme());

class KTheme extends ChangeNotifier {
  static double get titleMediumSize => 20.0;
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

  TextStyle get titleMedium => TextStyle(
        fontSize: titleMediumSize,
        fontFamily: AppConstants.fontFamilty,
        fontWeight: FontWeight.bold,
      );

  TextTheme commonTextTheme({Color color = ColorPalette.blackColor}) {
    return TextTheme(
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      titleMedium: titleMedium,
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
        iconTheme: kIconTheme(),
      );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: ColorPalette.primaryColor,
        ),
        tabBarTheme: kTabBarThemeData(),
        iconTheme: kIconTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: commonButtonStyle,
        ),
        appBarTheme: appBarTheme,
        textTheme: commonTextTheme(color: ColorPalette.whiteColor),
      );

  TabBarTheme kTabBarTheme() {
    return TabBarTheme(
      dividerColor: ColorPalette.dividerColor,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorPalette.primaryColor,
      ),
      labelColor: ColorPalette.whiteColor,
      unselectedLabelColor: ColorPalette.blackColor,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  IconThemeData kIconTheme() => IconThemeData(color: ColorPalette.primaryColor);

  TabBarThemeData kTabBarThemeData() => TabBarThemeData(
        dividerColor: ColorPalette.dividerColor,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorPalette.primaryColor,
        ),
        labelColor: ColorPalette.whiteColor,
        unselectedLabelColor: ColorPalette.blackColor,
        indicatorSize: TabBarIndicatorSize.tab,
      );

  ThemeData get lightTheme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: ColorPalette.darkenScaffoldColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: ColorPalette.primaryColor,
        ),
        tabBarTheme: kTabBarThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: commonButtonStyle,
        ),
        dividerColor: Colors.grey,
        appBarTheme: appBarTheme,
        textTheme: commonTextTheme(color: ColorPalette.blackColor),
      );
}
