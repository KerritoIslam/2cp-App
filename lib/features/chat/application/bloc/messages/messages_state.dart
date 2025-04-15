part of 'messages_bloc.dart';

sealed class MessagesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MessagesInit extends MessagesState {}

class MessagesLoading extends MessagesState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;

  MessagesLoading(this.dbMessages, this.socketMessages);

  @override
  List<Object?> get props => [dbMessages, socketMessages];
}

class MessagesError extends MessagesState {
  final List<MessageEntity> messages;

  MessagesError(this.messages);

  @override
  List<Object?> get props => [messages];
}

class MessagesLoaded extends MessagesState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;

  MessagesLoaded(this.dbMessages, this.socketMessages);

  @override
  List<Object?> get props => [dbMessages, socketMessages];
}

class MessageSentSuccess extends MessagesState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;

  MessageSentSuccess(this.dbMessages, this.socketMessages);

  @override
  List<Object?> get props => [dbMessages, socketMessages];
}

class MessageReceivedSucces extends MessagesState {
  final List<MessageEntity> dbMessages;
  final List<MessageEntity> socketMessages;

  MessageReceivedSucces(this.dbMessages, this.socketMessages);

  @override
  List<Object?> get props => [dbMessages, socketMessages];
}
