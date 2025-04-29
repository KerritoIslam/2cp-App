part of 'chats_bloc.dart';

abstract class ChatsState {
  final List<ChatEntity> chats;
  ChatsState(this.chats);
}

class ChatsInitialState extends ChatsState {
  ChatsInitialState() : super([]);
}

class ChatsErrorState extends ChatsState {
  final String message;
  ChatsErrorState(this.message) : super([]);
}

class ChatsLoadingState extends ChatsState {
  ChatsLoadingState(List<ChatEntity> chats) : super(chats);
}

class ChatsLoadedState extends ChatsState {
  ChatsLoadedState(List<ChatEntity> chats) : super(chats);
}
