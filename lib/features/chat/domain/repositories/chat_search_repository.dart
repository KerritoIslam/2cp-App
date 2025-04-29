import 'package:app/core/failure/failure.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/chat/data/remote/chat_search_rest_remote.dart';
import 'package:app/features/chat/domain/chatEntity.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:dartz/dartz.dart';

class ChatSearchRepository {
  final ChatSearchRemote remoteSource;
  ChatSearchRepository(this.remoteSource);

  Future<Either<Failure, List<Company>>> searchCompanies(
      String query, int page, int limit) async {
    try {
      final result = await remoteSource.searchCompanies(query, page, limit);
      return result.fold((failure) => left(failure), (companies) {
        final companyEntities = companies
            .map((companyModel) => Company.fromModel(companyModel))
            .toList();
        return right(companyEntities);
      });
    } catch (e) {
      return left(Failure('Failed to convert companies: $e'));
    }
  
  }
  //test commit
  Future<Either<Failure, ChatEntity>> createChat(int userId) async {
    try {
      final result = await remoteSource.createChat(userId);
      return result.fold((failure) => left(failure), (model) {
        return right(ChatEntity(
                  id: model.id,
                  roomName: model.room_name,
                  company: Company(
                    id: model.company.id,
                    name: model.company.name,
                    category: model.company.category,
                    profilepic: model.company.profilepic,
                  ),
                  lastMessage: model.last_message ,
                  lastMessageTime: model.last_message_time,
                  isOnline: model.is_online ?? false,
                  isTyping: model.is_typing ?? false,
                ));
      });
  
} catch (e) {
      return left(Failure('Failed to create chat: $e'));
    }
  }
}