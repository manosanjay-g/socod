import 'package:flutter/material.dart';
import 'screens.dart';

class SocodApp extends StatefulWidget {
  const SocodApp({super.key});

  @override
  State<SocodApp> createState() => _SocodAppState();
}

class _SocodAppState extends State<SocodApp> {
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
    return Scaffold(
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
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
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
