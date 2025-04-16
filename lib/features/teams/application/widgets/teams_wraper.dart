import 'package:app/features/teams/application/pages/invitation_page.dart';
import 'package:app/features/teams/application/pages/new_teams.dart';
import 'package:flutter/material.dart';

class TeamsPageWraper extends StatefulWidget {
  final int index;
  const TeamsPageWraper({super.key, required this.index});

  @override
  State<TeamsPageWraper> createState() => _TeamsPageWraperState();
}

class _TeamsPageWraperState extends State<TeamsPageWraper> {
  @override
  Widget build(BuildContext context) {
    print(widget.index);
    switch (widget.index) {
      case 0:
        return const InvitationsPage();
      case 1:
        return const NewTeam();
      default:
        return const InvitationsPage();
    }
  }
}
