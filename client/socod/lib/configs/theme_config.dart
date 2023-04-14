import 'package:flutter/material.dart';

abstract class AppColors {
  static const secondary = Color.fromARGB(255, 211, 61, 189);
  static const text = Color(0XFFFFFFFF);
  static const icon = Color.fromARGB(255, 255, 255, 255);
  static const background = Color.fromARGB(255, 27, 27, 27);
}

abstract class AppTheme {
  static ThemeData def() => ThemeData(
        fontFamily: "Montserrat",
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.background,
        iconTheme: const IconThemeData(color: AppColors.icon),
        accentColor: AppColors.secondary,
        focusColor: AppColors.text,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );
}
