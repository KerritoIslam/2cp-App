// ignore_for_file: camel_case_types

part of 'notifications_bloc.dart';

abstract class notificationsEvent {}
class notificationsFetched extends notificationsEvent {}
class notificationsRefreshed extends notificationsEvent {}
class notificationsMarkedAsRead extends notificationsEvent {
  final ENotification notification;
  notificationsMarkedAsRead(this.notification);
}
class notificationDeleted extends notificationsEvent {
  final ENotification notification;
  notificationDeleted(this.notification);
}
