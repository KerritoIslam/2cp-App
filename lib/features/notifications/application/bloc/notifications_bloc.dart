import 'package:app/features/notifications/domain/entitities/notification.dart';
import 'package:app/features/notifications/domain/repositories/notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class notificationsBloc extends Bloc<notificationsEvent, notificationsState> {
  final NotificationRepository repo;

  final List<Notification> notifications = [];
  notificationsBloc(this.repo) : super(notificationsInitial()) {
    on<notificationsFetched>((event, emit)async {
     final res=await this.repo.getNotifications();
      return res.fold((l)=>emit(notificationsError(l.message)), (r){
        notifications.addAll(r);
        emit(notificationsLoaded(notifications));
      });
      
    });
    on<notificationsRefreshed>((event, emit)async {
        final res=await repo.getNotifications();
        return res.fold((l)=>emit(notificationsError(l.message)), (r){
          notifications.clear();
          notifications.addAll(r);
          emit(notificationsLoaded(notifications));
        }
      );
    }
    );
    on<notificationsMarkedAsRead>((event, emit)async {
      final res=await repo.markAsRead(event.notification.id);
      return res.fold((failure){

notifications.firstWhere((element) => element.id==event.notification.id).markAsUnread(); 

        return emit(notificationsError(failure.message));
      }, (_){

        notifications.firstWhere((element) => element.id==event.notification.id).markAsRead(); 
          emit(notificationsLoaded(notifications));
      });
    });
    on<notificationDeleted>((event, emit)async {
      final res=await repo.deleteNotification(event.notification.id);
      return res.fold((failure){
        return emit(notificationsError(failure.message));
      }, (_){
        notifications.removeWhere((element) => element.id==event.notification.id);
        emit(notificationsLoaded(notifications));
      });
    });
}
}
