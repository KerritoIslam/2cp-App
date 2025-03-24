import 'package:app/features/applications%20status/application/bloc/applications_bloc.dart';
import 'package:app/features/applications%20status/domain/entities/application.dart';
import 'package:app/features/opportunities/application/widgets/skill_bubble.dart';
import 'package:app/shared/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:app/features/applications%20status/constants/status.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ApplicationCard extends StatefulWidget {
  final Application application;
  const ApplicationCard({
    Key? key,
    required this.application,
  }) : super(key: key);

  @override
  State<ApplicationCard> createState() => _ApplicationCardState();
}

class _ApplicationCardState extends State<ApplicationCard> {
  @override
  //TODO:optimize this somehow
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.85),
      margin: EdgeInsets.all(26.r),
      shadowColor: Theme.of(context).shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      placeholder: (context, url) => CircleAvatar(),
                      imageUrl:
                          widget.application.opportunity.company.profilepic,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 20.r,
                        backgroundImage: imageProvider,
                      ),
                      width: 60.w,
                      height: 60.h,
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                          overflow: TextOverflow.clip,
                          widget.application.opportunity.title,
                          style: Theme.of(context).textTheme.displayMedium!),
                    ),
                  ],
                ),
                DeleteButton(id: widget.application.id)
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.application.opportunity.company.name,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color:
                      Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
                  fontSize: 25.r),
            ),
            const SizedBox(height: 16),
            SizedBox(
              child: Wrap(
                runSpacing: 8.h,
                spacing: 8.w,
                children: widget.application.opportunity.skills
                    .map((s) => SkillBubble(skill: s))
                    .toList(),
              ),
            ),

            const SizedBox(height: 24),
            // Application Status Section
            _buildApplicationStatus(context),
            const SizedBox(height: 24),
            Row(
              children: [
                SizedBox(width: 12.w),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationStatus(BuildContext context) {
    // Get status color based on application status
    Color getStatusColor(ApplicationStatus status) {
      switch (status) {
        case ApplicationStatus.submitted:
          return Colors.blue;
        case ApplicationStatus.inReview:
          return Colors.orange;
        case ApplicationStatus.accepted:
          return Colors.green;
        case ApplicationStatus.rejected:
          return Colors.red;
        default:
          return Colors.grey; // Default color
      }
    }

    // Get status icon based on application status
    IconData getStatusIcon(ApplicationStatus status) {
      switch (status) {
        case ApplicationStatus.submitted:
          return Icons.check_circle_outline;
        case ApplicationStatus.inReview:
          return Icons.pending_outlined;
        case ApplicationStatus.accepted:
          return Icons.verified_outlined;
        case ApplicationStatus.rejected:
          return Icons.cancel_outlined;
        default:
          return Icons.help_outline; // Default icon
      }
    }

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: getStatusColor(widget.application.status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: getStatusColor(widget.application.status).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                getStatusIcon(widget.application.status),
                color: getStatusColor(widget.application.status),
                size: 24.r,
              ),
              SizedBox(width: 12.w),
              Text(
                'Application Status',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ApplicationStatusMixin
                            .statusMap[widget.application.status] ??
                        'Unknown',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: getStatusColor(widget.application.status),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Last updated 2 hours ago',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(0.5),
                          fontSize: 12.sp,
                        ),
                  ),
                ],
              ),
              if (widget.application.status == ApplicationStatus.accepted)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.r, vertical: 6.r),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.celebration_outlined,
                        color: Colors.green,
                        size: 16.r,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Congratulations!',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final String id;
  const DeleteButton({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Show delete confirmation dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              'Cancel Application',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 20.sp,
                  ),
            ),
            content: Text(
              'Are you sure you want to cancel this application?',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        Theme.of(context).secondaryHeaderColor.withOpacity(0.7),
                  ),
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(context),
                child: Text(
                  'No',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                ),
              ),
              TextButton(
                onPressed: () {
                  context
                      .read<ApplicationBloc>()
                      .add(deleteApplicationEvent(id));
                  context.pop(context);
                },
                child: Text(
                  'Yes',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.red,
                      ),
                ),
              ),
            ],
          ),
        );
      },
      icon: Icon(
        Icons.delete_outline,
        color: Colors.red,
        size: 28.r,
      ),
    );
  }
}
