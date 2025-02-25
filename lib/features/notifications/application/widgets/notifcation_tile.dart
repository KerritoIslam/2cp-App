import 'package:app/features/notifications/domain/entitities/notification.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: SvgPicture.asset('assets/icons/profile_pic.svg'),
          ),
          Column(
            children: [
              //Title
              Text(widget.notification.title, style: Theme.of(context).textTheme.headlineMedium),
              Row(
                children: [
                  //Divider
                  FDivider(
                    axis: Axis.vertical,
                  ),
                  Text(widget.notification.description, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium),
                  //description
                ],
              )
            ],
          ),
          Column(
            children: [
              //ElapsedTime
              Text(widget.notification.time, style: Theme.of(context).textTheme.bodyMedium),
              //PopoverMenu
              FPopoverMenu(
                scrollController: ScrollController(),
                cacheExtent: 100,
                maxHeight: 200,
                dragStartBehavior: DragStartBehavior.start,
                menuAnchor: Alignment.topCenter,
                childAnchor: Alignment.bottomCenter,
                directionPadding: false,
                hideOnTapOutside: FHidePopoverRegion.anywhere,
                shift: FPortalShift.flip,
                menu: [
                  FTileGroup(
                    children: [
                      FTile(
                        title: Text('Mark as read'),
                        prefixIcon: Icon(Icons.mark_email_read),
                        onPress: () {},
                      ),
                      FTile(
                        title: Text('Delete'),
                        prefixIcon: Icon(Icons.delete),
                        onPress: () {},
                      ),
                    ],
                  ),
                ],
                popoverController: _popoverController,
                child: Icon(Icons.more_vert),
              )
            ],
          )
        ],
      ),
    );
  }
}

