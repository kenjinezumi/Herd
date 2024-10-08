import 'package:flutter/material.dart';
import 'package:swipeable_stack/swipeable_stack.dart';
import '../models/user.dart';
import '../models/dummy_data.dart'; // Import dummy data

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  List<User> contacts = [];
  late SwipeableStackController<User> _controller;

  @override
  void initState() {
    super.initState();
    users = getDummyUsers(); // Load dummy users
    contacts = getDummyContacts(); // Load dummy contacts
    _controller = SwipeableStackController<User>();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Swipe'),
              Tab(text: 'My Contacts'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            users.isNotEmpty
                ? Column(
                    children: [
                      // Swiping Stack
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SwipeableStack<User>(
                            controller: _controller,
                            dataSet: users,
                            builder: (context, user, constraints) {
                              return UserCard(user: user);
                            },
                            onSwipeCompleted: (user, direction) {
                              if (users.indexOf(user) == users.length - 1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("No more users"),
                                    duration: Duration(milliseconds: 500),
                                  ),
                                );
                              }
                            },
                            overlayBuilder: (context, constraints, user, direction, swipeProgress) {
                              double clampedOpacity = swipeProgress.clamp(0.0, 1.0); // Ensure opacity is between 0.0 and 1.0
                              return Center(
                                child: Opacity(
                                  opacity: clampedOpacity,
                                  child: Icon(
                                    direction == SwipeDirection.right ? Icons.thumb_up : Icons.thumb_down,
                                    color: direction == SwipeDirection.right ? Colors.green : Colors.red,
                                    size: 100,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // Buttons for Swiping
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.red, size: 40),
                              onPressed: () {
                                _controller.next(swipeDirection: SwipeDirection.left);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.check, color: Colors.green, size: 40),
                              onPressed: () {
                                _controller.next(swipeDirection: SwipeDirection.right);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(), // Progress indicator while loading
                  ),
            contacts.isNotEmpty
                ? ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(contacts[index].profilePictureUrl),
                        ),
                        title: Text(contacts[index].name),
                        subtitle: Text(contacts[index].bio ?? 'No bio available'),
                      );
                    },
                  )
                : const Center(
                    child: Text('No contacts available'),
                  ),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SingleChildScrollView(  // Add SingleChildScrollView here
          child: Column(
            children: [
              Image.asset(
                user.profilePictureUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4, // Adjust the height for better fit
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '${user.name}, ${user.age}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Text(
                        user.location ?? 'No location available',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 4.0,
                      runSpacing: 2.0,
                      children: user.interests.map((interest) {
                        return Chip(
                          label: Text(interest, style: const TextStyle(fontSize: 12)),
                          padding: const EdgeInsets.all(4.0),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.bio ?? 'No bio available',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
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
