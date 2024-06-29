import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';
import '../models/event.dart';
import '../models/group.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box<User>('users');
    final userRepository = UserRepository(userBox, Hive.box<Event>('events'), Hive.box<Group>('groups'));

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final user = User(
                  userId: userBox.length + 1,
                  name: nameController.text,
                  email: emailController.text,
                  profilePictureUrl: 'https://via.placeholder.com/150',
                  pictures: [],
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                  preferences: {},
                  interests: [],
                  deviceId: 'dummy_device_id',
                  deviceType: 'android',
                  eventIds: [],
                  groupIds: [],
                );
                final success = await userRepository.register(user, passwordController.text);
                if (success) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration failed')));
                }
              },
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
