import 'package:app/features/chat/application/bloc/messages/messages_bloc.dart';
import 'package:app/features/chat/application/bloc/messages/messages_state.dart';
import 'package:app/features/chat/application/widgets/chat_message_bubble.dart';
import 'package:app/features/chat/domain/messageEntity.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessagesList extends StatefulWidget {
  final Company company;
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;
  final int currentId;
  final ScrollController scrollController;
  const MessagesList({
    super.key,
    required this.dbMessages,
    required this.socketMessages,
    required this.currentId,
    required this.company,
    required this.scrollController,
  });

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  bool _isLoadingMore = false;
  bool _hasRequestedMore = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (widget.scrollController.position.pixels ==
        widget.scrollController.position.maxScrollExtent) {
      if (!_isLoadingMore && !_hasRequestedMore) {
        _hasRequestedMore = true;
        context.read<MessagesBloc>().add(LoadMoreMessages());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final allMessages = [...widget.dbMessages, ...widget.socketMessages];
    allMessages.sort((a, b) => b.sent_time.compareTo(a.sent_time));

    return BlocListener<MessagesBloc, MessagesState>(
      listener: (context, state) {
        if (state is MessagesLoading) {
          _isLoadingMore = true;
        } else if (state is MessagesLoaded) {
          _isLoadingMore = false;
          _hasRequestedMore = false;
        }
      },
      child: ListView.builder(
        controller: widget.scrollController,
        reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
        itemCount: allMessages.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == allMessages.length) {
            return Container(
              height: 50,
              child: const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
          }

          final message = allMessages[index];
          final isMe = message.sender == widget.currentId;

          return ChatMessageBubble(
            company: widget.company,
            message: message.message,
            time: DateFormat('HH:mm').format(message.sent_time),
            isMe: isMe,
            status: 'sent', // TODO: Implement message status
          );
        },
      ),
    );
  }
}
