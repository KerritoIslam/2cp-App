import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.g.dart';
part 'notification_model.freezed.dart';
@freezed
class NotificationModel with _$NotificationModel {
  const NotificationModel._();
  factory NotificationModel({
    required String id,
    required String title,
    required String description,
    required DateTime date,
    required bool isRead,
    required String imageUrl,
     }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
 }

