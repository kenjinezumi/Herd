import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user.dart';
import '../models/event.dart';
import '../models/group.dart';
import '../repositories/user_repository.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box<User>('users');
    final userRepository = UserRepository(userBox, Hive.box<Event>('events'), Hive.box<Group>('groups'));

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
      ),
      body: SingleChildScrollView( // Added SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add logo at the top
              Center(
                child: Image.asset(
                  'assets/logo/herd.png', // Ensure the logo is placed in your assets folder
                  height: 250, // Adjust the size
                  width: 250,
                ),
              ),
              const SizedBox(height: 10),

              // Add "HERD" text below the logo in a fashionable way
              Center(
                child: Text(
                  'HERD',
                  style: TextStyle(
                    fontSize: 40, // Larger font size for emphasis
                    fontWeight: FontWeight.bold, // Make it bold
                    letterSpacing: 4.0, // Add spacing between letters for style
                    color: Colors.green.shade800, // A stylish color for the brand
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Google-style Login with Email
              ElevatedButton.icon(
                onPressed: () async {
                  final user = await userRepository.login(emailController.text, passwordController.text);
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login failed')));
                  }
                },
                icon: const Icon(Icons.email, color: Colors.white),
                label: const Text('Continue with Email', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Google Sign-in Button
              OutlinedButton.icon(
                onPressed: () {
                  // Add Google login logic
                },
                icon: Image.asset('assets/icons/google_logo.png', height: 24, width: 24),
                label: const Text('Continue with Google'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Apple Sign-in Button
              OutlinedButton.icon(
                onPressed: () {
                  // Add Apple login logic
                },
                icon: const Icon(Icons.apple, color: Colors.black),
                label: const Text('Continue with Apple'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Phone Number Sign-in Button
              OutlinedButton.icon(
                onPressed: () {
                  // Add phone number login logic
                },
                icon: const Icon(Icons.phone, color: Colors.black),
                label: const Text('Continue with Phone'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Register Button
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: const Text('Don\'t have an account? Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
