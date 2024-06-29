import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

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

class BrowseGroupsTab extends StatelessWidget {
  const BrowseGroupsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Browse Groups'),
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
