import 'package:flutter/material.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final List<String> _interests = [
    'Painting', 'Writing', 'Yoga', 'Reading', 'Cooking', 'Traveling', 'Music', 'Gardening', 'Fitness', 'Photography'
  ];
  final Set<String> _selectedInterests = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Interests'),
      ),
      body: ListView(
        children: _interests.map((interest) {
          return CheckboxListTile(
            title: Text(interest),
            value: _selectedInterests.contains(interest),
            onChanged: (bool? selected) {
              setState(() {
                if (selected ?? false) {
                  _selectedInterests.add(interest);
                } else {
                  _selectedInterests.remove(interest);
                }
              });
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
