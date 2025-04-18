import 'package:app/features/chat/application/widgets/chat_list_item.dart';
import 'package:app/features/chat/domain/messageEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chat List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                itemCount: 10, // Replace with actual chat list length
                itemBuilder: (context, index) {
                  return ChatListItem(
                    companyId: "company_$index",
                    companyName: "Yassir",
                    lastMessage: "Please send your CV/Resume here",
                    time: "5m ago",
                    imageUrl: "https://picsum.photos/200",
                    isOnline: index == 0,
                    unreadCount: index == 0 ? 1 : 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
