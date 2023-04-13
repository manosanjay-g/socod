import 'package:flutter/material.dart';

//Screens
import 'package:socod/screens/home_screen.dart';
import 'package:socod/screens/individual_user_screen.dart';
import 'package:socod/screens/matches_screen.dart';
import 'package:socod/screens/preferences_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static final List _pages = [
    HomeScreen(),
    MatchesScreen(),
    PreferencesScreen(),
  ];
  static const List<BottomNavigationBarItem> _pagesIcon = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Match",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        primaryColor: Colors.purple[300],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SOCOD",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(
                Icons.account_circle,
                size: 30,
              ),
            ),
          ],
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: _pagesIcon,
          selectedItemColor: Colors.purple[300],
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
