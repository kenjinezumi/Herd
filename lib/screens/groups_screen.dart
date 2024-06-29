import 'package:flutter/material.dart';
import 'package:swipeable_stack/swipeable_stack.dart';
import '../localization/app_localizations.dart';
import '../models/group.dart';
import '../models/dummy_data.dart'; // Import dummy data

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.translate('groups') ?? 'Groups'),
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)?.translate('browse_groups') ?? 'Browse Groups'),
              Tab(text: AppLocalizations.of(context)?.translate('my_groups') ?? 'My Groups'), 
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BrowseGroupsTab(),
            MyGroupsTab(),
          ],
        ),
      ),
    );
  }
}

class BrowseGroupsTab extends StatefulWidget {
  const BrowseGroupsTab({super.key});

  @override
  _BrowseGroupsTabState createState() => _BrowseGroupsTabState();
}

class _BrowseGroupsTabState extends State<BrowseGroupsTab> {
  List<Group> groups = [];
  late SwipeableStackController<Group> _controller;

  @override
  void initState() {
    super.initState();
    groups = getDummyGroups(); // Load dummy groups
    _controller = SwipeableStackController<Group>();
  }

  @override
  Widget build(BuildContext context) {
    return groups.isNotEmpty
        ? Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.7,
              child: SwipeableStack<Group>(
                controller: _controller,
                dataSet: groups,
                builder: (context, group, constraints) {
                  return GroupCard(group: group);
                },
                onSwipeCompleted: (group, direction) {
                  print('Group swiped: ${group.name}, Direction: $direction');
                  if (groups.indexOf(group) == groups.length - 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No more groups"),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  }
                },
                overlayBuilder: (context, constraints, group, direction, swipeProgress) {
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
            child: Text('No groups available'),
          );
  }
}

class MyGroupsTab extends StatelessWidget {
  const MyGroupsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('My Groups'),
    );
  }
}

class GroupCard extends StatelessWidget {
  final Group group;
  const GroupCard({required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              group.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              group.description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
