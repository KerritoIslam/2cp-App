import 'package:app/features/teams/application/pages/invitation_page.dart';
import 'package:app/features/teams/application/pages/my_teams_page.dart';
import 'package:app/features/teams/application/pages/new_teams.dart';
import 'package:flutter/material.dart';

class TeamsPageWraper extends StatefulWidget {
  final int initialindex;
  const TeamsPageWraper({super.key, this.initialindex = 0});

  @override
  State<TeamsPageWraper> createState() => _TeamsPageWraperState();
}

class _TeamsPageWraperState extends State<TeamsPageWraper> {
  late int currentIndex;
  @override
  void initState() {
    print("initial index is ${widget.initialindex}");
    currentIndex = widget.initialindex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("current index is $currentIndex");
    switch (currentIndex) {
      case 0:
        return InvitationsPage(
          onfabpressed: () => onPageChanged(1),
        );
      case 1:
        return const NewTeam();
      case 2:
        return const MyTeamsPage();
      default:
        return InvitationsPage(onfabpressed: () => onPageChanged(1));
    }
  }
}
