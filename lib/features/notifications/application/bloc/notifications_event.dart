// ignore_for_file: camel_case_types

part of 'notifications_bloc.dart';

abstract class notificationsEvent {}
class notificationsFetched extends notificationsEvent {}
class notificationsRefreshed extends notificationsEvent {}
class notificationsMarkedAsRead extends notificationsEvent {
  final Notification notification;
  notificationsMarkedAsRead(this.notification);
}
class notificationDeleted extends notificationsEvent {
  final Notification notification;
  notificationDeleted(this.notification);
}
