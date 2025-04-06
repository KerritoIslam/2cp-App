import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChatListItem extends StatelessWidget {
  final String companyId;
  final String companyName;
  final String lastMessage;
  final String time;
  final String imageUrl;
  final bool isOnline;
  final int unreadCount;

  const ChatListItem({
    Key? key,
    required this.companyId,
    required this.companyName,
    required this.lastMessage,
    required this.time,
    required this.imageUrl,
    this.isOnline = false,
    this.unreadCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/protected/chat/conversation/$companyId');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 12.r),
        child: Row(
          children: [
            // Company Avatar with Online Status
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 25.r,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) => CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Theme.of(context).cardColor,
                  ),
                ),
                if (isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12.r,
                      height: 12.r,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12.w),
            // Message Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        companyName,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context)
                                  .secondaryHeaderColor
                                  .withOpacity(0.5),
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          lastMessage,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .secondaryHeaderColor
                                        .withOpacity(0.7),
                                    fontSize: 14.sp,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (unreadCount > 0) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.r, vertical: 2.r),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            unreadCount.toString(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
