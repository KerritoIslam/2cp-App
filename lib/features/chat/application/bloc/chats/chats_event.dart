part of 'chats_bloc.dart';
abstract class ChatsEvents {
  const ChatsEvents();
}
class ChatsInitialEvent extends ChatsEvents {
  const ChatsInitialEvent();
}
class RequestChatsEvent extends ChatsEvents {
  final int page;
  final int limit;
  const RequestChatsEvent(this.page, this.limit);
}
class RequestMoreChatsEvent extends ChatsEvents {
  const RequestMoreChatsEvent();
}
class DeleteChatEvent extends ChatsEvents {
  final int chatId;
  const DeleteChatEvent(this.chatId);
}
class RequestChatMessagesEvent extends ChatsEvents {
  const RequestChatMessagesEvent();
}
class RefreshChatsEvent extends ChatsEvents {
  const RefreshChatsEvent();
}


