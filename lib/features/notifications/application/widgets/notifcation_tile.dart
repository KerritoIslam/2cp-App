import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/notifications/domain/entitities/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class NotifcationTile extends StatefulWidget {
  final ENotification notification;
  const NotifcationTile({super.key, required this.notification});

  @override
  State<NotifcationTile> createState() => _NotifcationTileState();
}

class _NotifcationTileState extends State<NotifcationTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut)
    );
    
    // Add status listener to trigger actual deletion when animation completes
    _controller.addStatusListener(_handleAnimationStatus);
  }

  // Handle animation completion
  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed && _isDeleting) {
      // Actually delete the notification after animation completes
      context.read<notificationsBloc>().add(notificationDeleted(widget.notification));
    }
  }

  // Start the deletion process
  void _deleteNotification() {
    setState(() {
      _isDeleting = true;
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_handleAnimationStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: SizeTransition(
            sizeFactor: _animation,
            axisAlignment: -1.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(right: 11.h),
                child: Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 0.4,
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        icon: Icons.delete,
                        onPressed: (ctx) {
                          // Start the fade out animation
                          _deleteNotification();
                        },
                      ),
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: SvgPicture.asset('assets/icons/profile_pic.svg'),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            widget.notification.title,
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: Theme.of(context).secondaryHeaderColor
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Row(
                            children: [
                              // Description with ellipsis
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 266.w,
                                  child: Text(
                                    widget.notification.description,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyMedium
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          // Time elapsed
                          Text(
                            widget.notification.time,
                            style: Theme.of(context).textTheme.bodyMedium
                          ),
                          SizedBox(height: 10.h),
                          // Removed commented out PopoverMenu code for clarity
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
