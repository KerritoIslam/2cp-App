import 'package:app/features/chat/application/bloc/chats/chats_bloc.dart';
import 'package:app/features/chat/application/widgets/chat _search.dart';
import 'package:app/features/chat/application/widgets/chat_list_item.dart';
import 'package:app/shared/widgets/loadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      context.read<ChatsBloc>().add(RequestMoreChatsEvent());
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
    context.read<ChatsBloc>().add(RequestChatsEvent(1, 15));
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Hero(
          tag: 'search_bar',
          child: Material(
            color: Colors.transparent,
            child: ChatSearchBar(
              isSearch: false,
              controller: TextEditingController(),
              onSearch: (value) {},
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: BlocBuilder<ChatsBloc, ChatsState>(
          builder: (context, state) {
            final chats = state.chats;

            if (state is ChatsLoadingState && chats.isEmpty) {
              return const Center(child: Loadingindicator());
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ChatsBloc>().add(RefreshChatsEvent());
              },
              child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: chats.length + 1,
                itemBuilder: (context, index) {
                  if (index == chats.length) {
                    if (state is ChatsLoadingState) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: Loadingindicator()),
                      );
                    }
                    return const SizedBox.shrink();
                  }

                  final chat = chats[index];
                  return ChatListItem(
                    roomName: chat.roomName,
                    company: chat.company,
                    lastMessage: chat.lastMessage,
                    time: "Just now", // mock
                    isOnline: index == 0,
                    unreadCount: index == 0 ? 1 : 0,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
