import 'package:app/features/teams/application/widgets/shearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewTeam extends StatefulWidget {
  const NewTeam({super.key});

  @override
  State<NewTeam> createState() => _NewTeamState();
}

class _NewTeamState extends State<NewTeam> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'invite',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).primaryColor,
                      ),
                  children: [
                    TextSpan(
                      text: "your colleagues \n to join your Team",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  ],
                )),
            SvgPicture.asset(
              'assets/images/our_team.svg',
              height: 377,
              width: 356,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ColleaguesSearchBar(),
            )
          ],
        ),
      ),
    );
  }
}
