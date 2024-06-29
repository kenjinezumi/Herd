import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/user.dart';
import 'models/event.dart';
import 'models/group.dart';
import 'screens/main_screen.dart';
import 'theme/app_theme.dart'; // Import AppTheme
import 'localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Import localization libraries

import 'models/dummy_data.dart'; // Import the dummy data

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Register the adapters
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(GroupAdapter());

  // Open the boxes
  await Hive.openBox<User>('users');
  await Hive.openBox<Event>('events');
  await Hive.openBox<Group>('groups');

  // Initialize dummy data
  var userBox = Hive.box<User>('users');
  var eventBox = Hive.box<Event>('events');
  var groupBox = Hive.box<Group>('groups');

  // Add your dummy data initialization here
  var users = getDummyUsers();
  var events = getDummyEvents();
  var groups = getDummyGroups();

  for (var user in users) {
    userBox.put(user.userId, user);
  }

  for (var event in events) {
    eventBox.put(event.eventId, event);
  }

  for (var group in groups) {
    groupBox.put(group.groupId, group);
  }

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
    return MaterialApp(
      title: 'Herd',
      theme: _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: MainScreen(toggleTheme: _toggleTheme),
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
