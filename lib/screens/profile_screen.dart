import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'settings_screen.dart';
import '../models/user.dart';
import '../models/event.dart';
import '../models/group.dart';
import '../repositories/user_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.toggleTheme});

  final VoidCallback toggleTheme;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserRepository userRepository;
  User? user;

  @override
  void initState() {
    super.initState();
    // Access the opened Hive boxes
    final userBox = Hive.box<User>('users');
    final eventBox = Hive.box<Event>('events');
    final groupBox = Hive.box<Group>('groups');
    userRepository = UserRepository(userBox, eventBox, groupBox);
    getUser();
  }

  void getUser() {
    setState(() {
      user = userRepository.getUser(1);  // Using the dummy user with userId 1
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    List<Event> events = userRepository.getUserEvents(int.parse(user!.id));  // Parse id to int
    List<Group> groups = userRepository.getUserGroups(int.parse(user!.id));  // Parse id to int

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen(toggleTheme: widget.toggleTheme)),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Add functionality to change the profile picture
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      user!.profilePictureUrl, // Profile picture URL
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          size: 15,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Add functionality to change the profile picture
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                user?.name ?? 'Loading...',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update profile logic
              },
              child: const Text('Update Profile'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  const Text('Events:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...events.map((event) => ListTile(
                        title: Text(event.name),
                        subtitle: Text(event.date.toString()),
                      )),
                  const Text('Groups:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...groups.map((group) => ListTile(
                        title: Text(group.name),
                        subtitle: Text(group.description),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
