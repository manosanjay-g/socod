import 'package:flutter/material.dart';
import 'package:socod/configs/route_config.dart';
import 'package:socod/configs/theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: AppTheme.def(),
      initialRoute: isLoggedIn == true ? '/home' : '/signin-screen',
    );
  }
}
