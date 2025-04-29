// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      id: (json['id'] as num).toInt(),
      message: json['message'] as String,
      sender: (json['sender'] as num).toInt(),
      sent_time: json['sent_time'] as String,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'sender': instance.sender,
      'sent_time': instance.sent_time,
    };
