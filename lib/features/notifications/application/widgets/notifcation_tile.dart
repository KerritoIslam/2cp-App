import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/notifications/domain/entitities/notification.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

class _NotifcationTileState extends State<NotifcationTile> {

  bool showMore=false;
  @override
  void initState() {
    super.initState();
       // Add status listener to trigger actual deletion when animation completes
  }

  // Handle animation completion
  
  // Start the deletion process
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                          context.read<notificationsBloc>().add(notificationDeleted(widget.notification));
                        },
                      ),
                    ]
                  ),
                  child: Container(
          margin: EdgeInsets.all( 10.r),
          padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 2.w),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.85),
          

          ),
                              child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: CachedNetworkImage(imageUrl:widget.notification.imageUrl,
imageBuilder: (context, imageProvider) => CircleAvatar(
  radius: 30.r,
  backgroundImage: imageProvider,
                  )
                )                        ),
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

                                    child: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              splashFactory: NoSplash.splashFactory,
                            ),
                            onPressed: (){
                              setState(() {
                                showMore=!showMore;
                              });
                            },
                                      child: Text(
                                        widget.notification.description,
                                        overflow:!showMore? TextOverflow.ellipsis:TextOverflow.visible,
                                        style: Theme.of(context).textTheme.bodyMedium
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  Text(
                              widget.notification.time,
                              style: Theme.of(context).textTheme.bodyMedium
                            ),

                          ],
                        ),
                        const Spacer(),
                                              ],
                    ),
                  ),
                ),
              );
    
  }
}
