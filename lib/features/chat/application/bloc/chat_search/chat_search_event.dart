part of 'chat_search_bloc.dart';

abstract class ChatSearchEvent extends Equatable {
  const ChatSearchEvent();

  @override
  List<Object> get props => [];
}

class ChatSearchCompaniesEvent extends ChatSearchEvent {
  final String query;
  final int page;
  final int limit;

  const ChatSearchCompaniesEvent({
    required this.query,
    required this.page,
    required this.limit,
  });

  @override
  List<Object> get props => [query, page, limit];
}

class ChatSearchMoreCompaniesEvent extends ChatSearchEvent {}

class ChatSearchCreateChatEvent extends ChatSearchEvent {
  final int userId;

  const ChatSearchCreateChatEvent({required this.userId});
}
