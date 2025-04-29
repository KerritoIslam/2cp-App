import 'package:app/core/failure/failure.dart';
import 'package:app/features/chat/data/remote/chat_remote_data_source.dart';
import 'package:app/features/chat/domain/messageEntity.dart';
import 'package:dartz/dartz.dart';

class ChatRepository {
  final ChatRemoteDataSource _remoteDataSource;

  ChatRepository(this._remoteDataSource);

  Future<Either<Failure, List<MessageEntity>>> getChatMessages(String roomName,
      {required int page, required int limit}) async {
    final messages = await _remoteDataSource.getChatMessages(roomName,
        page: page, limit: limit);
    return messages.fold(
        (l) => left(l),
        (r) => right(r
            .map((model) => MessageEntity(
                  id: model.id,
                  message: model.message,
                  sent_time: DateTime.parse(model.sent_time),
                  sender: model.sender,
                ))
            .toList()));
  }
}
