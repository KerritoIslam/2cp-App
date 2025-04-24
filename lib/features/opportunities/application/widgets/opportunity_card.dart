import 'dart:io';

import 'package:app/features/applications%20status/application/bloc/applications_bloc.dart';
import 'package:app/features/applications%20status/constants/status.dart';
import 'package:app/features/applications%20status/domain/entities/application.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/application/widgets/attachmentField.dart';
import 'package:app/features/opportunities/application/widgets/skill_bubble.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/shared/widgets/action_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class opportunityCard extends StatefulWidget {
  final Opportunity opportunity;
  final bool saved;
  const opportunityCard(
      {super.key, required this.opportunity, this.saved = false});

  @override
  State<opportunityCard> createState() => _opportunityCardState();
}

class _opportunityCardState extends State<opportunityCard> {
  late bool isSaved;
  late bool isApplied;

  @override
  //TODO:optimize this somehow
  void initState() {
    isApplied = false;
    if (widget.saved) {
      isSaved = true;
    } else {
      isSaved = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.85),
      margin: EdgeInsets.all(2.r),
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
                      imageUrl: widget.opportunity.company.profilepic,
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
                          widget.opportunity.title,
                          style: Theme.of(context).textTheme.displayMedium!),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    isSaved
                        ? Icons.bookmark_outlined
                        : Icons.bookmark_outline_sharp,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  onPressed: () {
                    if (!isSaved) {
                      context
                          .read<OpportunitiesSavedBloc>()
                          .add(SaveOpportunityEvent(widget.opportunity.id));
                    } else {
                      context.read<OpportunitiesSavedBloc>().add(
                          RemoveSavedOpportunityEvent(widget.opportunity.id));
                    }

                    setState(() {
                      isSaved = !isSaved;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.opportunity.company.name,
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
                children: widget.opportunity.skills
                    .map((s) => SkillBubble(skill: s))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (ctx) => OpportunityDetailsSheet(
                    opportunity: widget.opportunity,
                  ),
                );
              },
              child: Text(
                'View more',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
                width: double.infinity,
                child: ActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: true,
                          context: context,
                          builder: (ctx) => SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.85,
                              child: FullScreenDialog(
                                application: widget.opportunity,
                                jobTitle: widget.opportunity.title,
                              )));
                    },
                    text: "Apply")

                //child: ElevatedButton(
                ),
          ],
        ),
      ),
    );
  }
}

class FullScreenDialog extends StatefulWidget {
  final String jobTitle;
  final Opportunity application;
  const FullScreenDialog({
    super.key,
    required this.jobTitle,
    required this.application,
  });

  @override
  State<FullScreenDialog> createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  late TextEditingController _proposalController;
  File? selectedFile;
  @override
  void initState() {
    super.initState();
    _proposalController = TextEditingController();
  }

  @override
  void dispose() {
    _proposalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the height of the keyboard

    return Dialog.fullscreen(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You want to apply for ${widget.jobTitle}?',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Write a few sentences to highlight your skills and what makes you stand out.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
              ),
              SizedBox(height: 24.h),
              TextField(
                controller: _proposalController,
                maxLines: 5,
                cursorColor: Theme.of(context).secondaryHeaderColor,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 16.sp,
                    ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  focusColor: Theme.of(context).secondaryHeaderColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              AttachmentField(
                onFileSelected: (file) {
                  print("file selected");
                  print(file.path);
                  setState(() {
                    selectedFile = file;
                  });
                },
              ),
              SizedBox(height: 24.h),
              ActionButton(
                onPressed: () {
                  context.pop();
                  Application application = Application(
                      id: 0,
                      status: ApplicationStatus.submitted,
                      proposal: _proposalController.text,
                      opportunity: widget.application);
                  context
                      .read<ApplicationBloc>()
                      .add(submitApplicationEvent(application, selectedFile));
                },
                text: "Apply Now",
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class OpportunityDetailsSheet extends StatelessWidget {
  final Opportunity opportunity;

  const OpportunityDetailsSheet({
    super.key,
    required this.opportunity,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 28.r, vertical: 20.r),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Draggable indicator
              Container(
                width: 40.w,
                height: 4.h,
                margin: EdgeInsets.only(bottom: 32.h),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).secondaryHeaderColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with company info
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: CachedNetworkImage(
                              imageUrl: opportunity.company.profilepic,
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                radius: 35.r,
                                backgroundImage: imageProvider,
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  opportunity.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: 28.sp,
                                        height: 1.3,
                                      ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  '${opportunity.company.name} • ${opportunity.company.category}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontSize: 18.sp,
                                      ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'Posted on March 10, 2025 at 11:30 am',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor
                                            .withOpacity(0.5),
                                        fontSize: 14.sp,
                                      ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'Updated by recruiter 8 hours ago',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor
                                            .withOpacity(0.5),
                                        fontSize: 14.sp,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        'Internship Details',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      SizedBox(height: 20.h),
                      _buildDetailItem(context, 'UI/UX Designer'),
                      SizedBox(height: 12.h),
                      _buildDetailItem(context, 'No experience needed'),
                      SizedBox(height: 12.h),
                      _buildDetailItem(context, 'Face-to-face internship'),
                      SizedBox(height: 40.h),
                      Text(
                        'Application details',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'No need for any experience, but for professional issues it is better to send a CV or a Resume.',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .secondaryHeaderColor
                                  .withOpacity(0.7),
                              fontSize: 16.sp,
                              height: 1.5,
                            ),
                      ),
                      SizedBox(height: 40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => context.pop(context),
                            child: Text(
                              'Back',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontSize: 16.sp,
                                  ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: ActionButton(
                              onPressed: () {
                                context.pop(context);
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (ctx) => FullScreenDialog(
                                    jobTitle: opportunity.title,
                                    application: opportunity,
                                  ),
                                );
                              },
                              text: 'Apply',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 8.r,
          color: Theme.of(context).secondaryHeaderColor.withOpacity(0.7),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color:
                      Theme.of(context).secondaryHeaderColor.withOpacity(0.7),
                  fontSize: 16.sp,
                  height: 1.5,
                ),
          ),
        ),
      ],
    );
  }
}
