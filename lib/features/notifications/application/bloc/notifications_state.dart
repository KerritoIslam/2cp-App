part of 'notifications_bloc.dart';

abstract class notificationsState {}

 class notificationsInitial extends notificationsState {}
class notificationsLoading extends notificationsState {}
class notificationsLoaded extends notificationsState {
  final List<ENotification> notifications;
  notificationsLoaded(this.notifications);
}
class notificationsError extends notificationsState {
  final String message;
  final List<ENotification> notifications;
  notificationsError(this.message, this.notifications);
}

