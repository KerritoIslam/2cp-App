import 'dart:async';

import 'package:app/features/chat/domain/chatEntity.dart';
import 'package:app/features/chat/domain/repositories/chat_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvents, ChatsState> {
  int page = 1;
  int limit = 15;
  bool isLastPage = false;
  List<ChatEntity> chats = [];
  final ChatListRepository _repository;

  ChatsBloc(this._repository) : super(ChatsInitialState()) {
    on<RequestChatsEvent>(_onRequestChats);
    on<RequestMoreChatsEvent>(_onRequestMoreChats);
    on<RefreshChatsEvent>(_onRefreshChats);
    on<DeleteChatEvent>(_onDeleteChat);
    on<NewChatReceivedEvent>(_onNewChatReceived);
  }

  Future<void> _onRequestChats(
      RequestChatsEvent event, Emitter<ChatsState> emit) async {
    emit(ChatsLoadingState(chats));

    try {
      final newChats = await _repository.getChats(page: page, limit: limit);
      newChats.fold((l) => emit(ChatsErrorState(l.message)), (r) {
        if (r.length < limit) isLastPage = true;
        final updatedChats = [...chats, ...r];
        chats = updatedChats;

        emit(ChatsLoadedState(chats));
      });
    } catch (e) {
      emit(ChatsErrorState(e.toString()));
    }
  }

  Future<void> _onRequestMoreChats(
      RequestMoreChatsEvent event, Emitter<ChatsState> emit) async {
    if (isLastPage) return;
    page++;
    add(RequestChatsEvent(page, limit));
  }

  Future<void> _onRefreshChats(
      RefreshChatsEvent event, Emitter<ChatsState> emit) async {
    emit(ChatsLoadingState([]));
    page = 1;
    isLastPage = false;
    chats = [];

    try {
      final newChats = await _repository.getChats(page: page, limit: limit);
      newChats.fold(
        (l) => emit(ChatsErrorState(l.message)),
        (r) {
          if (r.length < limit) isLastPage = true;
          chats = [...chats, ...r];
          emit(ChatsLoadedState(chats));
        },
      );
    } catch (e) {
      emit(ChatsErrorState(e.toString()));
    }
  }

  Future<void> _onDeleteChat(
      DeleteChatEvent event, Emitter<ChatsState> emit) async {
    try {
      await _repository.deleteChat(event.chatId);
      chats.removeWhere((chat) => chat.id == event.chatId);
      chats = List.from(chats);
      emit(ChatsLoadedState(chats));
    } catch (e) {
      emit(ChatsErrorState('Failed to delete chat'));
    }
  }

  void _onNewChatReceived(
      NewChatReceivedEvent event, Emitter<ChatsState> emit) {
    chats.insert(0, event.chat);
    emit(ChatsLoadedState(List.from(chats)));
  }
}
