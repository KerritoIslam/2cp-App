part of 'search_bloc.dart';

abstract class SearchState {}
class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
class SearchSuccess extends SearchState {
  final SearchResult data;
  SearchSuccess(this.data);
}

class SearchEmpty extends SearchState{}
