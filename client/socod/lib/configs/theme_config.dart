import 'package:flutter/material.dart';

abstract class AppColors {
  static const secondary = Color(0XFF9575CD);
  static const text = Color(0XFFFFFFFF);
  static const icon = Color(0XFFFFFFFF);
  static const background = Color.fromARGB(255, 30, 30, 30);
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
      );
}
