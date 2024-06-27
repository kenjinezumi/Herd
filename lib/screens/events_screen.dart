import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.translate('events') ?? 'Events'),
      ),
      body: const Center(
        child: Text('Events Screen'),
      ),
    );
  }
}
