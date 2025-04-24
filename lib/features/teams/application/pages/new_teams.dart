import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:app/features/teams/application/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class NewTeam extends StatefulWidget {
  final VoidCallback? onfabpressed;
  NewTeam({super.key, required this.onfabpressed});

  @override
  State<NewTeam> createState() => _NewTeamState();
}

class _NewTeamState extends State<NewTeam> {
  late List<User> invitations = [];
  Future<String?> showInviteDialog(BuildContext context) async {
    TextEditingController _titlecontroller = TextEditingController();
    final title = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          backgroundColor: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    controller: _titlecontroller,
                    cursorColor: Color(0xFF5BA470),
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      labelText: 'Enter your team name',
                      labelStyle:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Color(0xFF5BA470),
                              ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF5BA470)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(side: BorderSide.none),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    ElevatedButton(
                      onPressed: () {
                        if (_titlecontroller.text.isNotEmpty) {
                          final teamName = _titlecontroller.text;
                          Navigator.pop(context, teamName);
                        }
                      },
                      child: Text(
                        "Create",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    return title;
  }

  @override
  void initState() {
    invitations;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.go('/protected/layout/2');
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: invitations.isEmpty
                ? Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'invite',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).primaryColor,
                              ),
                          children: [
                            TextSpan(
                              text: "your colleagues \n to join your Team",
                              style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/our_team.svg',
                        height: 377,
                        width: 356,
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                : Container(
                    constraints: BoxConstraints(
                      minHeight: 70.h,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.2),
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                              onPressed: () async {
                                final title = await showInviteDialog(context);
                                if (title != null) {
                                  final List<String> emails = invitations
                                      .map((invitation) => invitation.email)
                                      .toList();
                                  context.read<TeamsBloc>().add(
                                        TeamsCreateEvent(
                                          name: title,
                                          emails: emails,
                                        ),
                                      );
                                  setState(() {
                                    invitations.clear();
                                  });
                                }
                              },
                              child: Text(
                                "create team",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            )),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: List.generate(invitations.length, (index) {
                            return Chip(
                              label: Text(invitations[index].name),
                              onDeleted: () {
                                setState(() {
                                  invitations.removeAt(index);
                                });
                              },
                              deleteIcon: Icon(
                                Icons.close,
                                size: 18.sp,
                                color: Colors.red,
                              ),
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ColleaguesSearchBar(),
            ),
          ),
          BlocConsumer<TeamsBloc, TeamsState>(listener: (context, state) {
            if (state is TeamsSearchForMembersError) {
              toastification.show(
                title: Text(
                  'Network Error',
                  style: TextStyle(color: Colors.red),
                ),
                type: ToastificationType.error,
                autoCloseDuration: const Duration(seconds: 2),
              );
            } else if (state is TeamsCreateError) {
              toastification.show(
                title: Text(
                  'Team was not created',
                  style: TextStyle(color: Colors.red),
                ),
                type: ToastificationType.error,
                autoCloseDuration: const Duration(seconds: 2),
              );
            } else if (state is TeamsCreateSuccess) {
              toastification.show(
                title: Text('Team was created successfully'),
                type: ToastificationType.success,
                autoCloseDuration: const Duration(seconds: 2),
              );
              context.go('/protected/layout/2');
            }
          }, builder: (context, state) {
            if (state is TeamsSearchForMembersLoading) {
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is TeamsSearchForMembersError) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.red,
                        ),
                  ),
                ),
              );
            } else if (state is TeamsSearchForMembersSuccess) {
              final members = state.members.where((element) {
                return !invitations
                    .any((invitation) => invitation.id == element.id);
              }).toList();

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 35,
                      ),
                      child: ListTile(
                        tileColor:
                            Theme.of(context).primaryColor.withOpacity(0.4),
                        leading: CircleAvatar(
                          backgroundImage:
                              (members[index].profilepic ?? '').isEmpty
                                  ? const AssetImage("assets/images/avatar.png")
                                  : NetworkImage(members[index].profilepic!)
                                      as ImageProvider,
                        ),
                        title: Text(
                          members[index].name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        subtitle: Text(
                          members[index].email,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(0),
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                invitations.add(members[index]);
                                members.removeAt(index);
                              });
                            },
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  childCount: members.length,
                ),
              );
            } else {
              return SliverToBoxAdapter(child: SizedBox.shrink());
            }
          }),
        ],
      ),
    );
  }
}
