part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatInit extends ChatState {}

class ChatLoading extends ChatState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;

  ChatLoading(this.dbMessages, this.socketMessages);

  @override
  List<Object?> get props => [dbMessages, socketMessages];
}

class ChatError extends ChatState {
  final List<MessageEntity> messages;

  ChatError(this.messages);

  @override
  List<Object?> get props => [messages];
}

class ChatLoaded extends ChatState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;

  ChatLoaded(this.dbMessages, this.socketMessages);

  @override
  List<Object?> get props => [dbMessages, socketMessages];
}

class MessageSentSuccess extends ChatState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;

  MessageSentSuccess(this.dbMessages, this.socketMessages);

  @override
  List<Object?> get props => [dbMessages, socketMessages];
}

class MessageReceivedSucces extends ChatState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;

  MessageReceivedSucces(this.dbMessages, this.socketMessages);

  @override
  List<Object?> get props => [dbMessages, socketMessages];
}
