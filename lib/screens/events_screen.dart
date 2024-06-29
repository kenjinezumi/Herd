import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

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

class BrowseEventsTab extends StatelessWidget {
  const BrowseEventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Browse Events'),
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
