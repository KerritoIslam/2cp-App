import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/features/chat/application/bloc/messages/messages_bloc.dart';
import 'package:app/features/chat/application/bloc/messages/messages_state.dart';
import 'package:app/features/chat/application/widgets/messages_list.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/shared/widgets/loadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConversationPage extends StatefulWidget {
  final Company company;
  final String roomName;
  const ConversationPage({
    super.key,
    required this.company,
    required this.roomName,
  });

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  int _currentId = 0;
  late MessagesBloc bloc;
  

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = context.read<MessagesBloc>();
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      _currentId = authState.user.id;
    }
    bloc.add(LoadMessages(roomName: widget.roomName));
  }

  @override
  

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    bloc.add(closeConnection());
    super.dispose();
  }

 

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final message = _messageController.text;
    _messageController.clear();

    context
        .read<MessagesBloc>()
        .add(SendMessage(message: message, roomName: widget.roomName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: widget.company.profilepic == ''
                  ? const AssetImage('assets/images/avatar.png')
                  : NetworkImage(widget.company.profilepic) as ImageProvider,
            ),
            SizedBox(width: 8.w),
            Text(widget.company.name,
                style: Theme.of(context).textTheme.displaySmall),
          ],
        ),
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<MessagesBloc, MessagesState>(
              listener: (context, state) {
                
              },
              builder: (context, state) {
                if (state is MessagesInitial || state is MessagesLoading) {
                  return const Center(child: Loadingindicator());
                }

                if (state is MessagesError) {
                  return Center(
                    child: Text(state.message ?? 'An error occurred'),
                  );
                }

                if (state is MessagesLoaded) {
                  return Stack(
                    children: [
                      MessagesList(
                        company: widget.company,
                        dbMessages: state.dbMessages,
                        socketMessages: state.socketMessages,
                        currentId: _currentId,
                        scrollController: _scrollController,
                      ),
                      
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -1),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.05),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.r),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.r,
                          vertical: 8.r,
                        ),
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
