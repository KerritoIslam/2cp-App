import 'package:app/features/chat/domain/messageEntity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  List<MessageEntity> dbMesssages = [];
  List<MessageEntity> socketMessages = [];
  int page = 20;
  int limit = 20;
  bool isLastPage = false;
  MessagesBloc() : super(MessagesInit()) {
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
      emit(MessagesLoading(dbMesssages, socketMessages));
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
      emit(MessagesLoaded(newDbMessages, newSocketMessages));
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
      emit(MessagesInit());
    });
  }
}
