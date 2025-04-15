part of 'chats_bloc.dart';
abstract class ChatsState {
}
class ChatsInitialState extends ChatsState {
}
class ChatsLoadingState extends ChatsState {
 final List<ChatEntity> chats;
   ChatsLoadingState(this.chats);
}
class ChatsLoadedState extends ChatsState {
  final List<ChatEntity> chats;
    ChatsLoadedState(this.chats);
}
class ChatsErrorState extends ChatsState {
  final String error;
  final List<ChatEntity> chats;
  ChatsErrorState(this.chats,this.error);
}
