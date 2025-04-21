import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/application/widgets/invitation_card.dart';
import 'package:app/features/teams/domain/entities/invitation.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:app/features/teams/domain/enum/invitation_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InvitationsPage extends StatefulWidget {
  final VoidCallback? onfabpressed;
  const InvitationsPage({super.key, required this.onfabpressed});

  @override
  State<InvitationsPage> createState() => _InvitationsPageState();
}

List<Map<String, dynamic>> invitations = [
  {"name": "Ammou", "date": "2023-10-01", "pic": ""}
];

class _InvitationsPageState extends State<InvitationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
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
                    text: 'Your ',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                    children: [
                      TextSpan(
                        text: "Invitations",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                    ],
                  )),
              SvgPicture.asset(
                'assets/images/invitations.svg',
                height: 377,
                width: 356,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "invitations",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...invitations.map((invitation) => InvitationCard(
                    invitation: Invitation(
                      id: 0,
                      createdate: DateTime.now(),
                      team: Team(
                        id: 0,
                        name: 'Team Name',
                        createdAt:DateTime.now(),
                        students: [],
                        leader: User(
                            id: 0,
                            name: 'Sender Name',
                            email: '',
                            date_joined: '15/10/2023',
                            gendre: 'm',
                            profilepic: ''
                            ),
                        )
                      ,
                      inviter: User(
                          id: 0,
                          name: 'Sender Name',
                          email: 'sender@example.com',
                          date_joined: '15/10/2023',
                          gendre: 'm'),
                      receiver: User(
                          id: 1,
                          name: invitation['name'],
                          email: 'receiver@example.com',
                          date_joined: '15/10/2023',
                          gendre: 'm'),
                      
                      status: InvitationStatus.pending,
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onfabpressed!();
        },
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
