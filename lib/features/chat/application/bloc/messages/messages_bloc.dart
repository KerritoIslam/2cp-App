import 'dart:convert';

import 'package:app/features/authentication/domain/auth_repository.dart';
import 'package:app/features/chat/application/bloc/messages/messages_state.dart';
import 'package:app/features/chat/data/remote/ws.service.dart';
import 'package:app/features/chat/domain/messageEntity.dart';
import 'package:app/features/chat/domain/repositories/chat_repository.dart';
import 'package:app/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final WsService _wsService;
  final ChatRepository _chatRepository;
  final authRepository = locator.get<AuthRepository>();
  int page = 1;
  int limit = 15;
  bool isLastPage = false;
  String? currentRoomName;

  MessagesBloc(this._wsService, this._chatRepository)
      : super(MessagesInitial()) {
    on<LoadMessages>(_onLoadMessages);
    on<LoadMoreMessages>(_onLoadMoreMessages);
    on<SendMessage>(_onSendMessage);
    on<ReceiveMessage>(_onReceiveMessage);
    on<closeConnection>(_onCloseConnection);
  }

  Future<void> _onLoadMessages(
      LoadMessages event, Emitter<MessagesState> emit) async {
    page = 1;
    isLastPage = false;
    currentRoomName = event.roomName;
    emit(MessagesLoading([], []));

    final res = await _chatRepository.getChatMessages(
      event.roomName,
      page: page,
      limit: limit,
    );

    return res.fold(
      (fail) => emit(MessagesError(message: fail.message)),
      (messages) async {
        if (messages.length < limit) isLastPage = true;
        emit(MessagesLoaded(dbMessages: messages));
        try {
          final response = await authRepository.checkTokens();
          final token =
              response.fold((fail) => "", (token) => token.accessToken);
          _wsService.connect(token, event.roomName);
          _wsService.stream.listen((message) {
            final messageData = jsonDecode(message);
            add(ReceiveMessage(MessageEntity(
                id: 3,
                message: messageData['message'],
                sent_time: DateTime.now(),
                sender: messageData['sender'])));
          });
        } catch (e) {
          emit(MessagesError(message: 'Error loading messages'));
        }
      },
    );
  }

  Future<void> _onLoadMoreMessages(
      LoadMoreMessages event, Emitter<MessagesState> emit) async {
    if (isLastPage || currentRoomName == null) return;

    page++;
    final currentState = state;
    if (currentState is MessagesLoaded) {
      emit(MessagesLoading(
          currentState.dbMessages, currentState.socketMessages));

      final res = await _chatRepository.getChatMessages(
        currentRoomName!,
        page: page,
        limit: limit,
      );

      return res.fold(
        (fail) => emit(MessagesError(message: fail.message)),
        (messages) {
          if (messages.length < limit) isLastPage = true;
          final updatedMessages = [...messages, ...currentState.dbMessages];
          emit(MessagesLoaded(dbMessages: updatedMessages));
        },
      );
    }
  }

  Future<void> _onSendMessage(
      SendMessage event, Emitter<MessagesState> emit) async {
    try {
      _wsService.sendMessage(event.message);
    } catch (e) {
      emit(MessagesError(message: 'Error sending message'));
    }
  }

  Future<void> _onReceiveMessage(
      ReceiveMessage event, Emitter<MessagesState> emit) async {
    try {
      final currentState = state;
      if (currentState is MessagesLoaded) {
        final updatedMessages =
            List<MessageEntity>.from(currentState.dbMessages)
              ..add(event.message);
        emit(MessageReceivedSuccess(
            updatedMessages, currentState.socketMessages));
      }
    } catch (e) {
      emit(MessageReceivedError(
          state is MessagesLoaded ? (state as MessagesLoaded).dbMessages : []));
    }
  }

  void _onCloseConnection(MessagesEvent event, Emitter<MessagesState> emit) {
    _wsService.disconnect();
    emit(MessagesInitial());
  }
}

// Events
abstract class MessagesEvent {}

class LoadMessages extends MessagesEvent {
  final String roomName;
  LoadMessages({required this.roomName});
}

class LoadMoreMessages extends MessagesEvent {}

class SendMessage extends MessagesEvent {
  final String message;
  final String roomName;
  SendMessage({required this.message, required this.roomName});
}

class ReceiveMessage extends MessagesEvent {
  final MessageEntity message;
  ReceiveMessage(this.message);
}

class closeConnection extends MessagesEvent {}
