import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'groups_screen.dart';
import 'events_screen.dart';
import 'profile_screen.dart';
import '../localization/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.toggleTheme}) : super(key: key);

  final VoidCallback toggleTheme;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      const GroupsScreen(),
      const EventsScreen(),
      ProfileScreen(toggleTheme: widget.toggleTheme),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)?.translate('home') ?? 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.group),
            label: AppLocalizations.of(context)?.translate('groups') ?? 'Groups',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.event),
            label: AppLocalizations.of(context)?.translate('events') ?? 'Events',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context)?.translate('profile') ?? 'Profile',
          ),
        ],
      ),
    );
  }
}
