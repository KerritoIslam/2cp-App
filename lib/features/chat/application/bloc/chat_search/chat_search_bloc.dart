import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/chat/domain/chatEntity.dart';
import 'package:app/features/chat/domain/repositories/chat_search_repository.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'chat_search_event.dart';
part 'chat_search_state.dart';

class ChatSearchBloc extends Bloc<ChatSearchEvent, ChatSearchState> {
  int _limit = 10;
  String _currentQuery = '';
  int _currentPage = 1;
  bool _hasMore = true;
  List<Company> _allResults = [];

  EventTransformer<Event> debounce<Event>(Duration duration) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }

  final ChatSearchRepository chatSearchRepository;
  ChatSearchBloc(this.chatSearchRepository) : super(ChatSearchInitial()) {
    on<ChatSearchCompaniesEvent>((event, emit) async {
      emit(ChatSearchLoading());
      _hasMore = false;
      _limit = 10;
      _currentPage = 1;
      _currentQuery = event.query;

      if (_currentQuery.isEmpty) {
        emit(ChatSearchSuccess(
          companies: [],
          hasMore: false,
          message: 'No results found',
        ));
        return;
      }

      final result = await chatSearchRepository.searchCompanies(
        event.query,
        _currentPage,
        _limit,
      );

      result.fold(
        (failure) => emit(ChatSearchError(message: failure.message)),
        (companies) {
          _allResults = companies;
          _hasMore = companies.length == _limit;

          emit(ChatSearchSuccess(
            companies: companies,
            hasMore: _hasMore,
            message: '',
          ));
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 300)));

    on<ChatSearchMoreCompaniesEvent>((event, emit) async {
      if (!_hasMore || state is ChatSearchLoading) return;
      _currentPage++;

      try {
        final newResult = await chatSearchRepository.searchCompanies(
          _currentQuery,
          _currentPage,
          _limit,
        );

        newResult.fold(
          (failure) => emit(ChatSearchError(message: failure.message)),
          (companies) {
            _allResults.addAll(companies);
            _hasMore = companies.length == _limit;

            emit(ChatSearchSuccess(
              companies: _allResults,
              hasMore: _hasMore,
              message: '',
            ));
          },
        );
      } catch (e) {
        emit(ChatSearchError(message: e.toString()));
      }
    }, transformer: debounce(const Duration(milliseconds: 300)));
    on<ChatSearchCreateChatEvent>((event, emit) async {
      emit(ChatSearchCreateChatLoading());
      final result = await chatSearchRepository.createChat(event.userId);
      result.fold(
        (failure) => emit(ChatSearchError(message: failure.message)),
        (chat) => emit(ChatSearchCreateChatSuccess(chat: chat)),
      );
    });
  }
}
