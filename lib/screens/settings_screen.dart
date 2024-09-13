import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const SettingsScreen({super.key, required this.toggleTheme});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                  widget.toggleTheme();
                });
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.pause),
            title: const Text('Pause Account'),
            onTap: () {
              // Add functionality to pause account
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Verify Your Account'),
            onTap: () {
              // Add functionality to verify account
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.block),
            title: const Text('Block Someone'),
            onTap: () {
              // Add functionality to block someone
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete Account'),
            onTap: () {
              // Add functionality to delete account
            },
          ),
        ],
      ),
    );
  }
}
