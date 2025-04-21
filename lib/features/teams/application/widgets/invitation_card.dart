import 'package:app/features/teams/domain/entities/invitation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvitationCard extends StatefulWidget {
  final Invitation invitation;
  const InvitationCard({super.key, required this.invitation});

  @override
  State<InvitationCard> createState() => _InvitationCardState();
}

class _InvitationCardState extends State<InvitationCard>
    with SingleTickerProviderStateMixin {
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
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: (invitation.inviter!.profilepic ?? '').isEmpty
              ? AssetImage("assets/images/avatar.png")
              : NetworkImage(invitation.inviter!.profilepic!) as ImageProvider,
        ),
        title: RichText(
            text: TextSpan(
          text: invitation.inviter!.name,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
          children: [
            TextSpan(
              text: " invited you to join\nhis team",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        )),
        subtitle: Text(formattedPeriodToNow(invitation.createdate),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).secondaryHeaderColor,
                )),
        trailing: SizedBox(
          width: 144.w,
          height: 40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "join",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 74.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Delete",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
