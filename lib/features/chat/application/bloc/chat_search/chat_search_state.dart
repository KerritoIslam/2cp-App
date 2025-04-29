part of 'chat_search_bloc.dart';

abstract class ChatSearchState extends Equatable {
  const ChatSearchState();

  @override
  List<Object> get props => [];
}

class ChatSearchInitial extends ChatSearchState {}

class ChatSearchLoading extends ChatSearchState {}

class ChatSearchError extends ChatSearchState {
  final String message;

  const ChatSearchError({required this.message});

  @override
  List<Object> get props => [message];
}

class ChatSearchSuccess extends ChatSearchState {
  final List<Company> companies;
  final bool hasMore;
  final String message;

  const ChatSearchSuccess({
    required this.companies,
    required this.hasMore,
    this.message = '',
  });

  @override
  List<Object> get props => [companies, hasMore, message];
}

class ChatSearchCreateChatSuccess extends ChatSearchState {
  final ChatEntity chat;

  const ChatSearchCreateChatSuccess({required this.chat});

  @override
  List<Object> get props => [chat];
}

class ChatSearchCreateChatLoading extends ChatSearchState {}