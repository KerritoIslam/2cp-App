import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:app/features/teams/application/widgets/search.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class InviteDialog extends StatefulWidget {
  final Team team;
  const InviteDialog({super.key, required this.team});

  @override
  State<InviteDialog> createState() => _InviteDialogState();
}

class _InviteDialogState extends State<InviteDialog> {
  List<User> invitations = [];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 500.h,
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        margin: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Invite to Team',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            ColleaguesSearchBar(),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  return CustomScrollView(
                    slivers: [
                      if (state is TeamsSearchForMembersLoading)
                        SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      if (state is TeamsSearchForMembersError)
                        SliverToBoxAdapter(
                          child: Center(
                            child: Text(
                              state.message,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                          ),
                        ),
                      if (state is TeamsSearchForMembersSuccess)
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final members = state.members.where((element) {
                                return !invitations.any((invitation) =>
                                        invitation.id == element.id) &&
                                    !widget.team.students.any((invitation) =>
                                        invitation.id == element.id);
                              }).toList();
                              final totalInvites = invitations.length;
                              final isInvitation = index < totalInvites;
                              final user = isInvitation
                                  ? invitations[index]
                                  : members[index - totalInvites];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: ListTile(
                                  tileColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        (user.profilepic ?? '').isEmpty
                                            ? const AssetImage(
                                                "assets/images/avatar.png")
                                            : NetworkImage(user.profilepic!)
                                                as ImageProvider,
                                  ),
                                  title: Text(
                                    user.name,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  subtitle: Text(
                                    user.email,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  trailing: Checkbox(
                                    value: isInvitation,
                                    fillColor: WidgetStateProperty.resolveWith(
                                      (states) => isInvitation
                                          ? Theme.of(context).primaryColor
                                          : const Color(0xFF9D9D9D),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        if (isInvitation) {
                                          // Move from invitations to members
                                          members.add(user);
                                          invitations.removeAt(index);
                                        } else {
                                          // Move from members to invitations
                                          invitations.add(user);
                                          members
                                              .removeAt(index - totalInvites);
                                        }
                                      });
                                    },
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            },
                            childCount: state.members
                                    .where((element) {
                                      return !invitations.any((invitation) =>
                                              invitation.id == element.id) &&
                                          !widget.team.students.any(
                                              (invitation) =>
                                                  invitation.id == element.id);
                                    })
                                    .toList()
                                    .length +
                                invitations.length,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15.h),
              child: OutlinedButton(
                  onPressed: ()async {
                    if (invitations.isNotEmpty) {
                       context.read<TeamsBloc>().add(
                            TeamsinviteEvent(
                              id: widget.team.id!,
                              emails: invitations
                                  .map((e) => e.email)
                                  .toList(),
                            ),
                          );
                      Navigator.pop(context);
                    } else {
                      toastification.show(
                        title: Text('No invitations',style: TextStyle(color: Colors.red),),
                        type: ToastificationType.error,
                        autoCloseDuration: const Duration(seconds: 2), 
                      );
                    }
                  },
                  child: Text(
                    'invite',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    minimumSize: Size(190.w, 50.h),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
