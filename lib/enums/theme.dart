import 'package:flutter/material.dart';

enum AppTheme{
  lightTheme,
  darkTheme,
}

class AppThemes{
  static final themeData = {
    AppTheme.darkTheme:ThemeData(
      primarySwatch: Colors.cyan,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
    ),

    AppTheme.lightTheme:ThemeData(
      primarySwatch: Colors.cyan,
      primaryColor: Colors.white,
      brightness: Brightness.light,
    )


  };
}