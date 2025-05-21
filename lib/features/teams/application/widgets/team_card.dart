import 'dart:math';

import 'package:app/features/teams/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TeamCard extends StatefulWidget {
  final Team team;
  const TeamCard({super.key, required this.team});

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  late Team team;
  List<String> getSkills(Team _team) {
    List<String> skills = [];
    for (var student in _team.students) {
      skills.addAll(student.skills);
    }
    skills = skills.toSet().toList();
    skills.sort((a, b) => a.compareTo(b));
    return skills;
  }

  String formattedPeriodToNow(String lastActiveDate) {
    DateTime lastActive = DateTime.parse(lastActiveDate);
    Duration difference = DateTime.now().difference(lastActive);
    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  @override
  void initState() {
    team = widget.team;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/protected/layout/2/team_details", extra: team);
      },
      child: Container(
          height: 214.h,
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
                width: 200.w,
                child: Stack(
                  children:
                      List.generate(min(team.students.length, 5), (index) {
                    return Positioned(
                      left: index * 25, // Controls the overlap
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: team.students[index].profilepic['link'] != ''
                            ? NetworkImage(team.students[index].profilepic['link'])
                            : AssetImage('assets/images/avatar.png')
                                as ImageProvider,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                team.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text('members: ${team.students.length}',
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: List.generate(min(getSkills(team).length, 3),
                    (index) {
                  return Container(
                    margin: EdgeInsets.only(right: 5.w),
                    padding: EdgeInsets.only(right: 5.w),
                    child: Chip(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      label: Text(
                        getSkills(team)[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      backgroundColor: Theme.of(context).dividerColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                  );
                })
                  ..add(
                    Text(
                      getSkills(team).length - 3 > 0
                          ? "+${getSkills(team).length - 3} more"
                          : "",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
              ),
            ],
          )),
    );
  }
}
