import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messageEntity.freezed.dart';
@freezed
class MessageEntity  with _$MessageEntity {
  const factory MessageEntity({
    required String id,
    required String text,
    required DateTime createdAt,
    required User user,
    required Company company,
  }) = _MessageEntity;

  const MessageEntity._();

  }
