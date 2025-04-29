// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
//test commit
ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      id: (json['id'] as num).toInt(),
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      room_name: json['room_name'] as String,
      last_message: json['last_message'] as String,
      last_message_time: json['last_message_time'] as String,
      is_online: json['is_online'] as bool?,
      is_typing: json['is_typing'] as bool?,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'room_name': instance.room_name,
      'last_message': instance.last_message,
      'last_message_time': instance.last_message_time,
      'is_online': instance.is_online,
      'is_typing': instance.is_typing,
    };
