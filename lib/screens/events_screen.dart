import 'package:flutter/material.dart';
import 'package:swipeable_stack/swipeable_stack.dart';
import '../localization/app_localizations.dart';
import '../models/event.dart';
import '../models/dummy_data.dart'; // Import dummy data

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.translate('events') ?? 'Events'),
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)?.translate('browse_events') ?? 'Browse Events'),
              Tab(text: AppLocalizations.of(context)?.translate('my_events') ?? 'My Events'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BrowseEventsTab(),
            MyEventsTab(),
          ],
        ),
      ),
    );
  }
}

class BrowseEventsTab extends StatefulWidget {
  const BrowseEventsTab({super.key});

  @override
  _BrowseEventsTabState createState() => _BrowseEventsTabState();
}

class _BrowseEventsTabState extends State<BrowseEventsTab> {
  List<Event> events = [];
  late SwipeableStackController<Event> _controller;

  @override
  void initState() {
    super.initState();
    events = getDummyEvents(); // Load dummy events
    _controller = SwipeableStackController<Event>();
  }

  @override
  Widget build(BuildContext context) {
    return events.isNotEmpty
        ? Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.7,
              child: SwipeableStack<Event>(
                controller: _controller,
                dataSet: events,
                builder: (context, event, constraints) {
                  return EventCard(event: event);
                },
                onSwipeCompleted: (event, direction) {
                  print('Event swiped: ${event.name}, Direction: $direction');
                  if (events.indexOf(event) == events.length - 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No more events"),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  }
                },
                overlayBuilder: (context, constraints, event, direction, swipeProgress) {
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
            child: Text('No events available'),
          );
  }
}

class MyEventsTab extends StatelessWidget {
  const MyEventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('My Events'),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({required this.event, super.key});

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
              event.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              event.description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              event.location,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              event.date.toString(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
