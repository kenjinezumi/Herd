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
                  height: 350, // Make the logo much larger
                  width: 350,
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
              const SizedBox(height: 10),

              // Email Input
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),

              // Password Input
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: () async {
                  final user = await userRepository.login(emailController.text, passwordController.text);
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login failed')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),

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
