import 'package:flutter/material.dart';
import 'package:socod/configs/route_config.dart';
import 'package:socod/configs/theme_config.dart';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';
import 'package:socod/screens/screens.dart';
import 'package:socod/screens/socod_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: routes,
          theme: AppTheme.def(),
          home: authProvider.token() != null
              ? const SocodApp()
              : const SignInScreen(),
        ),
      ),
    );
  }
}
