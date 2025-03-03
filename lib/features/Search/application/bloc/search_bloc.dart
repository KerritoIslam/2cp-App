
import 'package:app/features/Search/domain/entities/SearchResultEntitiy.dart';
import 'package:app/features/Search/domain/repositories/search_repostitory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepostitory repostitory;
  SearchBloc(this.repostitory) : super(SearchInitial()) {
    on<SearchRequested>(_onSearchRequested,transformer:debounce(_duration) );
     }
Future<void>_onSearchRequested
(
  SearchRequested event,
  Emitter<SearchState> emit,
  )async{
  emit(SearchLoading());
  final res=await repostitory.search(event.query);
  res.fold((l)=>emit(SearchError(l.message)),(r){
        if (r.opportunities.isEmpty && r.companies.isEmpty){
        return emit(SearchEmpty());
        }
      return emit(SearchSuccess(r));});
  }
}
