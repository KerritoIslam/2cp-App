import 'package:app/features/chat/domain/messageEntity.dart';
import 'package:equatable/equatable.dart';

abstract class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

class LoadMessages extends MessagesEvent {
  final int chatId;

  const LoadMessages({required this.chatId});

  @override
  List<Object> get props => [chatId];
}

class SendMessage extends MessagesEvent {
  final MessageEntity message;

  const SendMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class ReceiveMessage extends MessagesEvent {
  final MessageEntity message;

  const ReceiveMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class DeleteMessage extends MessagesEvent {
  final int messageId;

  const DeleteMessage({required this.messageId});

  @override
  List<Object> get props => [messageId];
}
