import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, required this.toggleTheme}) : super(key: key);

  final VoidCallback toggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Pause Account'),
            leading: const Icon(Icons.pause),
            onTap: () {
              // Add functionality for pausing account
            },
          ),
          ListTile(
            title: const Text('Verify Your Account'),
            leading: const Icon(Icons.verified),
            onTap: () {
              // Add functionality for verifying account
            },
          ),
          ListTile(
            title: const Text('Block Someone'),
            leading: const Icon(Icons.block),
            onTap: () {
              // Add functionality for blocking someone
            },
          ),
          ListTile(
            title: const Text('Delete Account'),
            leading: const Icon(Icons.delete),
            onTap: () {
              // Add functionality for deleting account
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Toggle Theme'),
            leading: const Icon(Icons.brightness_6),
            onTap: toggleTheme,
          ),
        ],
      ),
    );
  }
}
