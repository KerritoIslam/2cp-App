part of 'notifications_bloc.dart';

abstract class notificationsState {}

 class notificationsInitial extends notificationsState {}
class notficationsLoading extends notificationsState {}
class notificationsLoaded extends notificationsState {
  final List<Notification> notifications;
  notificationsLoaded(this.notifications);
}
class notificationsError extends notificationsState {
  final String message;
  notificationsError(this.message);
}

