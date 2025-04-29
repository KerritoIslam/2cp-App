import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';
@JsonSerializable() 
@freezed
class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    required int id,
    required String message,
    required int  sender,
    required String sent_time,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) { 
    return _$ChatMessageModelFromJson(json);
  }
}
