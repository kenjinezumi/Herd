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
                ? Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: SwipeableStack<User>(
                        controller: _controller,
                        dataSet: users,
                        builder: (context, user, constraints) {
                          return UserCard(user: user);
                        },
                        onSwipeCompleted: (user, direction) {
                          print('User swiped: ${user.name}, Direction: $direction');
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
                                direction == SwipeDirection.right
                                    ? Icons.thumb_up
                                    : Icons.thumb_down,
                                color: direction == SwipeDirection.right ? Colors.green : Colors.red,
                                size: 100,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const Center(
                    child: Text('No users available'),
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
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                user.profilePictureUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.bio ?? 'No bio available',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.location ?? 'No location available',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

