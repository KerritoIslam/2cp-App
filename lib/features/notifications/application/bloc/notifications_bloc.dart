import 'package:app/features/notifications/domain/entitities/notification.dart';
import 'package:app/features/notifications/domain/repositories/notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class notificationsBloc extends Bloc<notificationsEvent, notificationsState> {
  final NotificationRepository repo;

  final List<ENotification> notifications = [];
  notificationsBloc(this.repo) : super(notificationsInitial()) {
    on<notificationsFetched>((event, emit)async {
     final res=await repo.getNotifications();
      return res.fold((l)=>emit(notificationsError(l.message,notifications)), (r){
        notifications.addAll(r);
        emit(notificationsLoaded(notifications));
      });
      
    });
    on<notificationsRefreshed>((event, emit)async {
        final res=await repo.getNotifications();
        return res.fold((l)=>emit(notificationsError(l.message,notifications)), (r){
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

        return emit(notificationsError(failure.message,notifications));
      }, (_){

        notifications.firstWhere((element) => element.id==event.notification.id).markAsRead(); 
          emit(notificationsLoaded(notifications));
      });
    });
    on<notificationDeleted>((event, emit)async {
      final res=await repo.deleteNotification(event.notification.id);
      return res.fold((failure){
        return emit(notificationsError(failure.message,notifications));
      }, (_){
        notifications.removeWhere((element) => element.id==event.notification.id);
        emit(notificationsLoaded(notifications));
          final player=AudioPlayer();
          return player.play(AssetSource('sounds/delete.mp3'),volume: 0.5);
        
      });
    });
}
}
