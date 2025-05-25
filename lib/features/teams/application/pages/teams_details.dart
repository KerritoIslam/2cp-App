import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:app/features/teams/application/widgets/alert_dialog.dart';
import 'package:app/features/teams/application/widgets/invite.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:app/shared/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class TeamDetails extends StatefulWidget {
  final Team team;
  const TeamDetails({
    super.key,
    required this.team,
  });

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  List<String> getSkills(Team _team) {
    ;
    List<String> skills = [];
    for (var student in _team.students) {
      skills.addAll(student.skills);
    }
    skills = skills.toSet().toList();
    skills.sort((a, b) => a.compareTo(b));
    return skills;
  }

  late Team team;
  @override
  void initState() {
    team = widget.team;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AuthBloc>().state as Authenticated).user;
    return Scaffold(
      body: BlocConsumer<TeamsBloc, TeamsState>(
          listener: (context, state) {
            print(state.toString());
            if (state is TeamsError) {
              showDialog(
                context: context,
                builder: (context) {
                  return TeamsAlertDialog(
                    title: 'Error',
                    message: state.message,
                    buttonText: 'OK',
                    onPressed: () {
                      context.go('/protected/layout/2');
                      Navigator.of(context).pop();
                    },
                  );
                },
              );
            }
            if (state is TeamsUpdateSuccess) {
              toastification.show(
                title: Text('${state.message}'),
                type: ToastificationType.success,
                autoCloseDuration: const Duration(seconds: 2),
              );
              team = state.team;
            }
            if (state is TeamsKickMemberSuccess) {
              toastification.show(
                title: Text('${state.message}'),
                type: ToastificationType.success,
                autoCloseDuration: const Duration(seconds: 2),
              );
            }

            if (state is TeamsLeaveSuccess) {
              toastification.show(
                title: Text('${state.message}'),
                type: ToastificationType.success,
                autoCloseDuration: const Duration(seconds: 2),
              );
              context.go('/protected/layout/2');
            }
            if (state is TeamsDeleteSuccess) {
              toastification.show(
                title: Text('${state.message}'),
                type: ToastificationType.success,
                autoCloseDuration: const Duration(seconds: 2),
              );

              context.go('/protected/layout/2');
            }
          },
          bloc: context.read<TeamsBloc>(),
          builder: (context, state) {
            if (state is TeamsLoading || state is TeamsInitial) {
              return LoadingPage();
            } else
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    floating: true,
                    snap: true,
                    title: Text(
                      team.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 28,
                          ),
                    ),
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Members',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                              const Spacer(),
                              Visibility(
                                visible: team.leader.id == user.id,
                                child: IconButton(
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return InviteDialog(
                                            team: team,
                                          );
                                        });
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/invite.svg',
                                    height: 30,
                                    width: 30,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ..._buildMemberList(team.students, user),
                          const SizedBox(height: 16),
                          Text('Skills',
                              style: Theme.of(context).textTheme.displayMedium),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: getSkills(team)
                            
                                .map((skill) => Chip(
                                      label: Text(skill,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.black)),
                                      backgroundColor: Colors.green[100],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          side: BorderSide.none),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          Text('Description',
                              style: Theme.of(context).textTheme.displayMedium),
                          const SizedBox(height: 8),
                          Text(
                            team.description ?? 'No description available',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 24),
                          Visibility(
                            visible: team.leader.id == user.id,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                                  child: OutlinedButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              TextEditingController
                                                  nameController =
                                                  TextEditingController(
                                                      text: team.name);
                                              TextEditingController
                                                  descriptionController =
                                                  TextEditingController(
                                                      text: team.description);
                                              return AlertDialog(
                                                backgroundColor: Theme.of(
                                                        context)
                                                    .scaffoldBackgroundColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                title: Text('Edit Team',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    TextField(
                                                      controller:
                                                          nameController,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Team Name',
                                                        labelStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 16),
                                                    TextField(
                                                      controller:
                                                          descriptionController,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Description',
                                                        labelStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .secondaryHeaderColor,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<TeamsBloc>()
                                                          .add(TeamsUpdateEvent(
                                                              team: team.copyWith(
                                                                  name:
                                                                      nameController
                                                                          .text,
                                                                  description:
                                                                      descriptionController
                                                                          .text)));
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Submit',
                                                        style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                        )),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Text(
                                        'Edit',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                        minimumSize: Size(190.w, 50.h),
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                                  child: OutlinedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return TeamsAlertDialog(
                                              title: 'Delete Team',
                                              message:
                                                  'Are you sure you want to delete this team?',
                                              onPressed: () async {
                                                context.read<TeamsBloc>().add(
                                                    TeamsDeleteEvent(
                                                        id: team.id!));
                                                /* context
                                                    .go('/protected/layout/2'); */
                                              },
                                              buttonText: 'Delete',
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Delete',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Colors.red,
                                            ),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color: Colors.red,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                        minimumSize: Size(190.w, 50.h),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            width: double.infinity,
                            child: OutlinedButton(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return TeamsAlertDialog(
                                        title: 'Leave Team',
                                        message:
                                            'Are you sure you want to leave this team?',
                                        buttonText: 'Leave',
                                        onPressed: () async {
                                          context.read<TeamsBloc>().add(
                                              TeamsLeaveEvent(id: team.id!));
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Leave Team',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  minimumSize: Size(170.w, 50.h),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
          }),
    );
  }

  List<Widget> _buildMemberList(List<User> members, User user) {
    List<User> sortedMembers = members.toList();
    sortedMembers.sort((a, b) {
      if (a.id == team.leader.id) {
        return -1;
      }
      if (b.id == team.leader.id) {
        return 1;
      }
      return a.name.compareTo(b.name);
    });
    return sortedMembers.map((member) {
      final role = member.id == team.leader.id ? 'Owner' : 'Member';
      return Container(
          height: 100.h,
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
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
          child: ListTile(
              tileColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                  backgroundImage: member.profilepic['link'] != ''
                      ? NetworkImage(member.profilepic['link'])
                      : AssetImage('assets/images/avatar.png')
                          as ImageProvider),
              title: Text(
                member.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(role,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
              trailing: (role == 'Member' && team.leader.id == user.id)
                  ? IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return TeamsAlertDialog(
                              title: 'Kick Member',
                              message:
                                  'Are you sure you want to kick this member?',
                              buttonText: 'Kick',
                              onPressed: () async {
                                context.read<TeamsBloc>().add(
                                    TeamsKickMemberEvent(
                                        teamId: team.id!, userId: member.id));
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        );
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/kickout.svg',
                        height: 30,
                        width: 30,
                      ),
                    )
                  : null));
    }).toList();
  }
}
