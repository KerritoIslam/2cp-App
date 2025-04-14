import 'package:app/features/chat/application/widgets/chat_message_bubble.dart';
import 'package:app/features/chat/domain/messageEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

//TODO add pagination logic
class ConversationPage extends StatelessWidget {
  final String companyId;

  const ConversationPage({
    super.key,
    required this.companyId,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Use companyId to fetch messages and company details
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onPressed: () => context.pop(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yassir', // TODO: Replace with actual company name
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  'Online',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.green,
                        fontSize: 12.sp,
                      ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              itemCount: 20,
              itemBuilder: (context, index) {
                final bool isMe = index % 2 == 0;
                return ChatMessageBubble(
                  message: "Hello sir, Good Morning",
                  time: "09:30 am",
                  isMe: isMe,
                  status: index == 0 ? "sent" : "read",
                );
              },
            ),
          ),
          // Message Input
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                top: BorderSide(
                  color:
                      Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Write your message',
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context)
                                      .secondaryHeaderColor
                                      .withOpacity(0.5),
                                ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
