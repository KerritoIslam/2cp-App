import 'package:app/features/chat/domain/messageEntity.dart';
import 'package:equatable/equatable.dart';

abstract class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

class MessagesInitial extends MessagesState {}

class MessagesLoading extends MessagesState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;

  const MessagesLoading(this.dbMessages, this.socketMessages);

  @override
  List<Object> get props => [dbMessages, socketMessages];
}

class MessagesLoaded extends MessagesState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;
  final List<MessageEntity> messages;
  const MessagesLoaded({
    required this.dbMessages,
    this.socketMessages = const [],
    this.messages = const [],
  });

  @override
  List<Object> get props => [dbMessages, socketMessages, messages];
}

class MessageSentSuccess extends MessagesLoaded {
  const MessageSentSuccess(
      List<MessageEntity> dbMessages, List<MessageEntity> socketMessages)
      : super(dbMessages: dbMessages, socketMessages: socketMessages);
}

class MessageSentError extends MessagesError {
  const MessageSentError(List<MessageEntity> messages)
      : super(messages: messages);
}

class MessageReceivedSuccess extends MessagesLoaded {
  const MessageReceivedSuccess(
      List<MessageEntity> dbMessages, List<MessageEntity> socketMessages)
      : super(dbMessages: dbMessages, socketMessages: socketMessages);
}

class MessageReceivedError extends MessagesError {
  const MessageReceivedError(List<MessageEntity> messages)
      : super(messages: messages);
}

class MessagesError extends MessagesState {
  final List<MessageEntity> messages;
  final String? message;

  const MessagesError({this.messages = const [], this.message});

  @override
  List<Object> get props => [messages, message ?? ''];
}
