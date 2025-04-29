import 'package:app/features/chat/domain/models/chat_model.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chatEntity.freezed.dart';

@freezed
class ChatEntity with _$ChatEntity {
  const ChatEntity._();
  const factory ChatEntity({
    required int id,
    required Company company,
    required String lastMessage,
    required String lastMessageTime,
    required bool isOnline,
    required bool isTyping,
    required String roomName,
  }) = _ChatEntity;
  //test commit
}
