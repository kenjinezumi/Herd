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

    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo at the top
              Center(
                child: Image.asset(
                  'assets/logo/herd.png', // Ensure the logo is placed in your assets folder
                  height: 200, // Logo size
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),

              // HERD Title
              Center(
                child: Text(
                  'HERD',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: Colors.green.shade800,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Email Input
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade800),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Smaller Google-like Register Button
              ElevatedButton(
                onPressed: () async {
                  final user = User(
                    userId: userBox.length + 1,
                    name: 'Anonymous', // Placeholder name
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
                    dateOfBirth: DateTime(1990, 1, 1), // Example data
                  );
                  final success = await userRepository.register(user, ''); // No password needed
                  if (success) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration failed')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0), // Smaller button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0), // Softer, small-radius button
                  ),
                  backgroundColor: Colors.green.shade800, // Updated to backgroundColor
                ),
                child: const Text(
                  'Register with Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Smaller font
                ),
              ),
              const SizedBox(height: 20),

              // Already have an account? Login
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Already have an account? Login'),
              ),
              const SizedBox(height: 30),

              // Divider between email and social login options
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade400)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or', style: TextStyle(color: Colors.grey.shade600)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade400)),
                ],
              ),
              const SizedBox(height: 20),

              // Social Login Options
              Center(
                child: Column(
                  children: [
                    const Text('Sign up with'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Google Sign-In Button
                        ElevatedButton.icon(
                          icon: Image.asset(
                            'assets/icons/google_logo.png',
                            height: 20,
                            width: 20,
                          ),
                          label: const Text('Google'),
                          onPressed: () {
                            // Google sign-in functionality
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            backgroundColor: Colors.white, // Updated to backgroundColor
                            foregroundColor: Colors.black, // Updated to foregroundColor
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),

                        // Apple Sign-In Button
                        ElevatedButton.icon(
                          icon: const Icon(Icons.apple, color: Colors.white),
                          label: const Text('Apple'),
                          onPressed: () {
                            // Apple sign-in functionality
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            backgroundColor: Colors.black, // Updated to backgroundColor
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),

                        // Phone Number Sign-In Button
                        ElevatedButton.icon(
                          icon: const Icon(Icons.phone, color: Colors.white),
                          label: const Text('Phone'),
                          onPressed: () {
                            // Phone number sign-in functionality
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            backgroundColor: Colors.blue.shade700, // Updated to backgroundColor
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
