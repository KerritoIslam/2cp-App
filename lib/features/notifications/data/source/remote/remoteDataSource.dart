import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/notifications/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';

class NotificationsStatics {
  static final List<Map<String, dynamic>> mockNotifications = [
  ];
}

class NotificationRemoteDataSource {
  final apiClient = DioServices.dio;

  //NOTE: this will be replaced with the id stored in the jwt TOken when Auth is setup
  final userId = "4";
  Future<Either<Failure, List<NotificationModel>>> getUserNotification() async {
    try {
      await Future.delayed(Duration(milliseconds: 20));
      return Right(NotificationsStatics.mockNotifications
          .map((n) => NotificationModel.fromJson(n))
          .toList());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Unit>> markNotificationAsRead(int id) async {
    try {
      await Future.delayed(Duration(milliseconds: 20));
      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Unit>> deleteNotification(int id) async {
    try {
      await Future.delayed(Duration(milliseconds: 20));
      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
