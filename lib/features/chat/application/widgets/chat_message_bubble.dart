import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;
  final String status;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isMe,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.r),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            CircleAvatar(
              radius: 16.r,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            SizedBox(width: 8.w),
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
              decoration: BoxDecoration(
                color: isMe
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).cardColor.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                  bottomLeft: Radius.circular(isMe ? 16.r : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 16.r),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: isMe
                              ? Colors.white
                              : Theme.of(context).secondaryHeaderColor,
                          fontSize: 14.sp,
                        ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        time,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: isMe
                                  ? Colors.white.withOpacity(0.7)
                                  : Theme.of(context)
                                      .secondaryHeaderColor
                                      .withOpacity(0.5),
                              fontSize: 10.sp,
                            ),
                      ),
                      if (isMe) ...[
                        SizedBox(width: 4.w),
                        Icon(
                          status == "sent" ? Icons.check : Icons.done_all,
                          color: Colors.white.withOpacity(0.7),
                          size: 14.r,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isMe) SizedBox(width: 24.w),
        ],
      ),
    );
  }
}
