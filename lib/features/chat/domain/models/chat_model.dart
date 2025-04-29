import 'package:app/features/chat/domain/models/company_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
@JsonSerializable()
class ChatModel with _$ChatModel {
  const ChatModel._();

  const factory ChatModel({
    required int id,
    required CompanyModel company,
    required String room_name,
    required String last_message,
    required String last_message_time,
    @Default(false) bool? is_online,
    @Default(false) bool? is_typing,
  }) = _ChatModel;
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    if (json["last_message"] == null) {
      json["last_message"] = "";
    }
    else {
      json["last_message"] = json["last_message"]["message"];
    }
    json["last_message_time"] = "2025-04-28 10:00:00";

    return _$ChatModelFromJson(json);
  }
}
