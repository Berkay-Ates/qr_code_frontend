import 'package:flutter/material.dart';

import '../itheme/app_theme.dart';
import 'app_light_theme_interface.dart';

class AppThemeLight extends AppTheme with AppLightThemeInterface {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get themeData => ThemeData.light().copyWith(
      appBarTheme: ThemeData.light().appBarTheme.copyWith(centerTitle: true),
      colorScheme: _appColorScheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      inputDecorationTheme: _appInputDecorationTheme(),
      iconTheme: const IconThemeData().copyWith(color: Colors.black));

  InputDecorationTheme _appInputDecorationTheme() =>
      const InputDecorationTheme(labelStyle: TextStyle(color: Colors.black), border: UnderlineInputBorder());

  ColorScheme get _appColorScheme => ColorScheme(
      primary: lightThemeArgs!.LAPIS_ON_NEPTUN, //*
      primaryContainer: lightThemeArgs!.white,
      secondary: lightThemeArgs!.darkPurple,
      secondaryContainer: lightThemeArgs!.lightBlue,
      surface: lightThemeArgs!.white, //*
      background: lightThemeArgs!.blue,
      error: lightThemeArgs!.red,
      onPrimary: lightThemeArgs!.white,
      onSecondary: lightThemeArgs!.black, //*
      onSurface: lightThemeArgs!.SUGAR_MILK, //*
      onBackground: lightThemeArgs!.darkGray, //*
      onError: lightThemeArgs!.white,
      brightness: lightThemeArgs!.brightnessLight);

  FloatingActionButtonThemeData get floatingActionButtonTheme => FloatingActionButtonThemeData(
      foregroundColor: lightThemeArgs!.white,
      backgroundColor: lightThemeArgs!.LAPIS_ON_NEPTUN,
      focusColor: lightThemeArgs!.black,
      hoverColor: lightThemeArgs!.black12,
      splashColor: lightThemeArgs!.black);
}
