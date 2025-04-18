import 'package:app/features/chat/domain/chatEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_event.dart';
part 'chats_state.dart';
class ChatsBloc extends Bloc<ChatsEvents,ChatsState> {
 int page=1;
 int limit=15;
 bool isLastPage=false;
List<ChatEntity> chats=[];
  ChatsBloc() : super(ChatsInitialState()){
   on<RequestChatsEvent>((event, emit) async {
     emit(ChatsLoadingState(chats));
      //TODO mock api 
      final List<ChatEntity> res=[];
      final newMessages=[...chats,...res];
      if (res.length<limit) {
        isLastPage=true;
      }
      chats=newMessages;
      emit(ChatsLoadedState(chats));
    });
    on<RequestMoreChatsEvent>((event, emit) async {
      if (isLastPage) return;
      page++;
      add(RequestChatsEvent(page, limit));});
    on<RefreshChatsEvent>((event, emit) async {
      page=1;
      isLastPage=false;
      chats=[];
      add(RequestChatsEvent(page, limit));
    });
    on<DeleteChatEvent>((event, emit) async {
      final chatId=event.chatId;
      chats.removeWhere((chat) => chat.id==chatId);
      //For immutability
      chats=List.from(chats);
      emit(ChatsLoadedState(chats));
    });

  } 
}
