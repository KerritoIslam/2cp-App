import 'package:app/features/chat/domain/messageEntity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<MessageEntity> dbMesssages = [];
  List<MessageEntity> socketMessages = [];
  int page = 20;
  int limit = 20;
  bool isLastPage = false;
  ChatBloc() : super(ChatInit()) {
    //TODO:Add socket listner Here
    on<MessageReceivedEvent>((event, emit) {
      final newDbMessages = [...dbMesssages, event.receivedMessage];
      final newSocketMessages = [...socketMessages, event.receivedMessage];
      dbMesssages = newDbMessages;
      socketMessages = newSocketMessages;

      emit(MessageReceivedSucces(newDbMessages, newSocketMessages));
    });
    on<MessageSentEvent>((event, emit) {
      final newDbMessages = [...dbMesssages, event.sentMessage];
      final newSocketMessages = [...socketMessages, event.sentMessage];
      dbMesssages = newDbMessages;
      socketMessages = newSocketMessages;
      emit(MessageSentSuccess(newDbMessages, newSocketMessages));
    });
    on<DbMessagesRequestedEvent>((event, emit) {
      emit(ChatLoading(dbMesssages, socketMessages));
      //Mock Call api

      //Mock Reponse
      final List<MessageEntity> res = [];
      if (res.length < limit) {
        isLastPage = true;
      }
      final newDbMessages = [...dbMesssages, ...res];
      final newSocketMessages = [...socketMessages, ...res];
      dbMesssages = newDbMessages;
      socketMessages = newSocketMessages;
      emit(ChatLoaded(newDbMessages, newSocketMessages));
    });
    on<CheckIfNeedMoreMessageEvent>((event, emit) {
      if (!isLastPage) {
        page++;
        return add(DbMessagesRequestedEvent(
            page: page,
            limit: limit,
            companyId: event.companyId,
            userId: event.userId));
      }
    });
    on<ClearMessagesEvent>((event, emit) {
      dbMesssages = [];
      socketMessages = [];
      page = 20;
      limit = 20;
      isLastPage = false;
      emit(ChatInit());
    });
  }
}
