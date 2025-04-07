part of 'chat_bloc.dart';

abstract class ChatEvent {}

class MessageReceivedEvent extends ChatEvent {
  MessageEntity receivedMessage;
  MessageReceivedEvent(this.receivedMessage);
}

class MessageSentEvent extends ChatEvent {
  MessageEntity sentMessage;
  MessageSentEvent(this.sentMessage);
}

class DbMessagesRequestedEvent extends ChatEvent {
  final int companyId;
  final int userId;
  final int page;
  final int limit;

  DbMessagesRequestedEvent(
      {required this.companyId,
      required this.userId,
      required this.page,
      required this.limit});
}

class CheckIfNeedMoreMessageEvent extends ChatEvent {
  final int companyId;
  final int userId;

  CheckIfNeedMoreMessageEvent({required this.companyId, required this.userId});
}

class ClearMessagesEvent extends ChatEvent {}
