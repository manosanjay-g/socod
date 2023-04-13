import 'package:flutter/material.dart';
import 'package:socod/screens/screens.dart';
import 'package:socod/screens/socod_screen.dart';

var routes = <String, WidgetBuilder>{
  '/home': (_) => SocodApp(),
  '/individual-chat-screen': (_) => IndividualChatScreen(),
  '/individual-user-screen': (_) => IndividualUserScreen(),
  '/matches-screen': (_) => MatchesScreen(),
  '/otp-screen': (_) => OTPScreen(),
  '/preferences-screen': (_) => PreferencesScreen(),
  '/signin-screen': (_) => SignInScreen(),
  '/signup-screen': (_) => SignUpScreen(),
};
