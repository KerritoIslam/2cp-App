import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/notifications/domain/entitities/notification.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';
//TODO add Special style for read
//TODO find a way to remove the ElapsedTime when sliding (I should use a controller but it causes a bug so this is what I shoudl solve) 

class NotifcationTile extends StatefulWidget {
  final ENotification notification;
  const NotifcationTile({super.key, required this.notification});

  @override
  _NotifcationTileState createState() => _NotifcationTileState();
}

class _NotifcationTileState extends State<NotifcationTile> with SingleTickerProviderStateMixin {
  late FPopoverController _popoverController;

  @override
  void initState() {
    super.initState();
    _popoverController = FPopoverController(vsync: this);
  }

  @override
  void dispose() {
    _popoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding( 
 padding: EdgeInsets.only(right: 11.h),
        child:Slidable(
          endActionPane:ActionPane(
extentRatio:0.4,
        motion: StretchMotion(), children: [
           SlidableAction(
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(20),
 icon: Icons.delete           ,onPressed: (ctx){
              context.read<notificationsBloc>().add(notificationDeleted(widget.notification));
            }
    
              ,), 
            
          ]) ,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: SvgPicture.asset('assets/icons/profile_pic.svg'),
            ),
              Spacer(),
              
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          
                //Title
                Text(widget.notification.title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).secondaryHeaderColor)),
                SizedBox(width: 10.w,),
                Row(
          
                  children: [
                    //Divider
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 266.w,
                        child: Text(widget.notification.description, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium)),
                    ),
                    //description
                  ],
                )
              ],
            ),
            Spacer(),
            Column(
              children: [
                //ElapsedTime
                Text(widget.notification.time, style: Theme.of(context).textTheme.bodyMedium),
                //PopoverMenu
                SizedBox(
                  height:10.h ,
                ),
                //SizedBox(
                //  width: 50.w,
                //  child: Builder(
                //    builder: (context) {
                //
                //      return SizedBox(
                //        width: 50.w,
                //        child: FPopoverMenu(
                //          scrollController: ScrollController(),
                //          cacheExtent: 100,
                //          maxHeight: 200,
                //          dragStartBehavior: DragStartBehavior.start,
                //          menuAnchor: Alignment.topCenter,
                //          childAnchor: Alignment.bottomCenter,
                //          directionPadding: true, // or remove it
                //          hideOnTapOutside: FHidePopoverRegion.anywhere,
                //          shift: FPortalShift.flip,
                //          menu: [
                //            FTileGroup(
                //              children: [
                //                FTile(
                //                  title: Text('Mark as read'),
                //                  prefixIcon: Icon(Icons.mark_email_read, color: Theme.of(context).secondaryHeaderColor),
                //                  onPress: () {
                //                    _popoverController.hide();
                //                  },
                //                ),
                //                FTile(
                //                  title: Text('Delete'),
                //                  prefixIcon: Icon(Icons.delete, color: Theme.of(context).secondaryHeaderColor),
                //                  onPress: () {
                //                    _popoverController.dispose();
                //                  },
                //                ),
                //              ],
                //            ),
                //          ],
                //          popoverController: _popoverController,
                //          child: SizedBox(
                //            width: 24.w,
                //            height: 24.h,
                //            child: GestureDetector(
                //              onTap: (){
                //                _popoverController.toggle();
                //              },
                //              child: Icon(Icons.more_vert, color: Theme.of(context).secondaryHeaderColor), )
                //          ),
                //        ),
                //      );
                //    }
                //  ),
                //)
              ],
            )
          ],
                ),
        ),
    )    );
  }
}

