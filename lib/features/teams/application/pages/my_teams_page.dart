import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/application/widgets/team_card.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTeamsPage extends StatefulWidget {
  final VoidCallback? onfabpressed;
  const MyTeamsPage({super.key, required this.onfabpressed});

  @override
  State<MyTeamsPage> createState() => _MyTeamsPageState();
}

class _MyTeamsPageState extends State<MyTeamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TeamCard(
            team: Team(
                        id: 0,
                        name: 'Team Name',
                        createdAt:DateTime.now(),
                        students: [ User(
                            id: 0,
                            name: 'Sender Name',
                            email: '',
                            date_joined: '15/10/2023',
                            gendre: 'm',
                            profilepic: 'https://github.com/Zaki-goumri.png'
                            ), User(
                            id: 0,
                            name: 'Sender Name',
                            email: '',
                            date_joined: '15/10/2023',
                            gendre: 'm',
                            profilepic: 'https://github.com/Zaki-goumri.png'
                            ), User(
                            id: 0,
                            name: 'Sender Name',
                            email: '',
                            date_joined: '15/10/2023',
                            gendre: 'm',
                            profilepic: 'https://github.com/Zaki-goumri.png'
                            ), User(
                            id: 0,
                            name: 'Sender Name',
                            email: '',
                            date_joined: '15/10/2023',
                            gendre: 'm',
                            profilepic: 'https://github.com/Zaki-goumri.png'
                            ), User(
                            id: 0,
                            name: 'Sender Name',
                            email: '',
                            date_joined: '15/10/2023',
                            gendre: 'm',
                            profilepic: 'https://github.com/Zaki-goumri.png'
                            ), User(
                            id: 0,
                            name: 'Sender Name',
                            email: '',
                            date_joined: '15/10/2023',
                            gendre: 'm',
                            profilepic: 'https://github.com/Zaki-goumri.png'
                            ), User(
                            id: 0,
                            name: 'Sender Name',
                            email: '',
                            date_joined: '15/10/2023',
                            gendre: 'm',
                            profilepic: 'https://github.com/Zaki-goumri.png'
                            ),








              ],
                        leader: User(
                            id: 0,
                            name: 'Sender Name',
                            email: '',
                            date_joined: '15/10/2023',
                            gendre: 'm',
                            profilepic: 'https://github.com/Zaki-goumri.png'
                            ),
                        )
          );
        },
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
