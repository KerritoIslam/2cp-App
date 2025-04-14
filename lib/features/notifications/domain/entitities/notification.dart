//TODO Fill According to the design
import 'package:app/features/notifications/data/models/notification_model.dart';
import 'package:app/utils/time_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

@freezed
class ENotification with _$ENotification {
  const ENotification._();
  factory ENotification({
    required int id,
    required String title,
    required String description,
    required String time,
    required String image,
    required bool isRead,
    required String imageUrl,
  }) = _Notification;
  factory ENotification.fromModel(NotificationModel model) {
    return ENotification(
      id: int.parse(model.id),
      title: model.title,
      description: model.description,
      time: getElapsedTime(DateTime.now().difference(model.date)),
      image: model.imageUrl,
      isRead: model.isRead,
      imageUrl: model.imageUrl,
    );
  }
  ENotification markAsRead() {
    return copyWith(isRead: true);
  }

  ENotification markAsUnread() {
    return copyWith(isRead: false);
  }
}
