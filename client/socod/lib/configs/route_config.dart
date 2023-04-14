import 'package:flutter/material.dart';
import 'package:socod/screens/screens.dart';
import 'package:socod/screens/socod_screen.dart';

var routes = <String, WidgetBuilder>{
  '/home': (_) => const SocodApp(),
  '/individual-chat-screen': (_) => const IndividualChatScreen(),
  '/individual-user-screen': (_) => const IndividualUserScreen(),
  '/matches-screen': (_) => const MatchesScreen(),
  '/otp-screen': (_) => const OTPScreen(),
  '/preferences-screen': (_) => const PreferencesScreen(),
  '/signin-screen': (_) => SignInScreen(),
  '/signup-screen': (_) => const SignUpScreen(),
};
