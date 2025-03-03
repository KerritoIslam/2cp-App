part of 'search_bloc.dart';

enum SearchType{
company,
opportunity
}
abstract class SearchEvent {}
class SearchRequested extends SearchEvent {
  final String query;
  final SearchType type; 
  SearchRequested(this.query,this.type);
}
