import 'package:app/core/failure/failure.dart';
import 'package:app/features/chat/data/remote/chat_list_remote_data_source.dart';
import 'package:app/features/chat/domain/chatEntity.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:dartz/dartz.dart';

class ChatListRepository {
  final ChatListRemoteDataSource _remoteDataSource;

  ChatListRepository(this._remoteDataSource);

  Future<Either<Failure, List<ChatEntity>>> getChats(
      {required int page, required int limit}) async {
    final chats = await _remoteDataSource.getChats(page: page, limit: limit);
    return chats.fold(
        (l) => left(l),
        (r) => right(r
            .map((model) => ChatEntity(
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
                ))
            .toList()));
  }

  Future<void> deleteChat(int chatId) async {
    await _remoteDataSource.deleteChat(chatId);
  }
}
