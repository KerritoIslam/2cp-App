import 'package:freezed_annotation/freezed_annotation.dart';

part 'messageEntity.freezed.dart';

@freezed
class MessageEntity with _$MessageEntity {
  const MessageEntity._();
  const factory MessageEntity({
    required int id,
    required String message,
    required DateTime sent_time,
    required int sender,
  }) = _MessageEntity;
}
