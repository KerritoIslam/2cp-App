//TODO Fill According to the design
import 'package:app/features/notifications/data/models/notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

@freezed
class Notification with _$Notification {
  const Notification._(); 
  factory Notification({
    required String id,
    required String title,
    required String description,
    required String time,
    required String image,
   required bool isRead,
  }) = _Notification;
 factory Notification.fromModel(NotificationModel model) {
    return Notification(
      id:model.id,
      title: model.title,
      description: model.description,
      //TODO:convertt date to elapsed time
      time: "8h Ago",
      image:"example.com/image.jpg",
      isRead: model.isRead,
    );
  }
  Notification markAsRead() {
    return copyWith(isRead: true);
  }
  Notification markAsUnread(){
    return copyWith(isRead: false);
  }
}
