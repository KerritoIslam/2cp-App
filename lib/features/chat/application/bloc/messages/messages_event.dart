part of 'messages_bloc.dart';

abstract class MessagesEvent {}

class MessageReceivedEvent extends MessagesEvent {
  MessageEntity receivedMessage;
  MessageReceivedEvent(this.receivedMessage);
}

class MessageSentEvent extends MessagesEvent {
  MessageEntity sentMessage;
  MessageSentEvent(this.sentMessage);
}

class DbMessagesRequestedEvent extends MessagesEvent {
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

class CheckIfNeedMoreMessageEvent extends MessagesEvent {
  final int companyId;
  final int userId;

  CheckIfNeedMoreMessageEvent({required this.companyId, required this.userId});
}

class ClearMessagesEvent extends MessagesEvent {}
