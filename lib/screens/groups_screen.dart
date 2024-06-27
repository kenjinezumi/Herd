import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.translate('groups') ?? 'Groups'),
      ),
      body: const Center(
        child: Text('Groups Screen'),
      ),
    );
  }
}
