part of 'chats_bloc.dart';

abstract class ChatsEvents {}

class RequestChatsEvent extends ChatsEvents {
  final int page;
  final int limit;
  RequestChatsEvent(this.page, this.limit);
}

class RequestMoreChatsEvent extends ChatsEvents {}

class RefreshChatsEvent extends ChatsEvents {}

class DeleteChatEvent extends ChatsEvents {
  final int chatId;
  DeleteChatEvent(this.chatId);
}

class NewChatReceivedEvent extends ChatsEvents {
  final ChatEntity chat;
  NewChatReceivedEvent(this.chat);
}
