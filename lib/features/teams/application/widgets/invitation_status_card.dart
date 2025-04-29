import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:app/features/teams/domain/entities/invitation.dart';
import 'package:app/features/teams/domain/enum/invitation_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class InvitationStatusCard extends StatefulWidget {
  final Invitation invitation;
  const InvitationStatusCard({super.key, required this.invitation});

  @override
  State<InvitationStatusCard> createState() => _InvitationStatusCardState();
}

class _InvitationStatusCardState extends State<InvitationStatusCard> {
  late Invitation invitation;
  String formattedPeriodToNow(DateTime lastActive) {
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
    invitation = widget.invitation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(invitation.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.read<TeamsBloc>().add(
                    TeamsDeleteInvitationEvent(id: invitation.id!),
                  );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
          leading: CircleAvatar(
            backgroundImage: (invitation.inviter!.profilepic ?? '').isEmpty
                ? AssetImage("assets/images/avatar.png")
                : NetworkImage(invitation.inviter!.profilepic!)
                    as ImageProvider,
          ),
          title: RichText(
            text: TextSpan(
                text: invitation.receiver!.name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                children: [
                  TextSpan(
                    text: " to join ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  TextSpan(
                      text: invitation.team.name,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ))
                ]),
          ),
          subtitle: Text(formattedPeriodToNow(invitation.createdate),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).secondaryHeaderColor,
                  )),
          trailing: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: invitation.status == InvitationStatus.accepted
                    ? Theme.of(context).primaryColor.withOpacity(0.6)
                    : invitation.status == InvitationStatus.pending
                        ? Colors.orange.withOpacity(0.6)
                        : Colors.red.withOpacity(0.6),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Text(
              invitation.status.name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: invitation.status == InvitationStatus.accepted
                        ? Theme.of(context).primaryColor.withOpacity(0.6)
                        : invitation.status == InvitationStatus.pending
                            ? Colors.orange.withOpacity(0.6)
                            : Colors.red.withOpacity(0.6),
                  ),
            ),
          )),
    );
  }
}
