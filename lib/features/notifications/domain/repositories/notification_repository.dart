import 'package:app/core/failure/failure.dart';
import 'package:app/features/notifications/data/source/remote/remoteDataSource.dart';
import 'package:app/features/notifications/domain/entitities/notification.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;
  NotificationRepository(this._remoteDataSource);
  Future<Either<Failure,List<ENotification>>> getNotifications() async {
    // Fetch notifications from API
    try {
      final res=await _remoteDataSource.getUserNotification();
      return res.fold((l)=> Left(l), (notifications)=> Right(notifications.map((e) => ENotification.fromModel(e)).toList()));
           
        } catch (e) {
      if (kDebugMode) {
        print(e);
      }
          return Left( Failure("An error occured while fetching notifications") );
        }
  }
  Future<Either<Failure,Unit>> markAsRead(String id) async {
    // Mark notification as read
    try {
      return _remoteDataSource.markNotificationAsRead(id);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left( Failure("An error occured while marking notification as read") );
    }
  }
  Future<Either<Failure,Unit>> deleteNotification(String id) async {
    // Delete notification
    try {
      return _remoteDataSource.deleteNotification(id);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left( Failure("An error occured while deleting notification") );
    }
  }
  
}
