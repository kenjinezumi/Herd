import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'theme/app_theme.dart'; // Import AppTheme
import 'localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Import localization libraries
import 'package:hive_flutter/hive_flutter.dart';
import 'models/user.dart';
import 'models/event.dart';
import 'models/group.dart';

void main() async {
  await Hive.initFlutter();

  // Register adapters for Hive
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(GroupAdapter());

  // Open Hive boxes
  await Hive.openBox<User>('users');
  await Hive.openBox<Event>('events');
  await Hive.openBox<Group>('groups');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box<User>('users');
    final bool isLoggedIn = userBox.isNotEmpty; // Simplified login check

    return MaterialApp(
      title: 'Herd',
      theme: _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: isLoggedIn ? MainScreen(toggleTheme: _toggleTheme) : const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => MainScreen(toggleTheme: _toggleTheme),
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
    );
  }
}
