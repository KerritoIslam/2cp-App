import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/notifications/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';

class NotificationsStatics{
static final List<Map<String,dynamic>> mockNotifications = 
[
  {
    "id": "1",
    "title": "Meeting Reminder",
    "description": "Don't forget your meeting with the team at 3 PM.",
    "date": "2024-02-04T14:00:00.000Z",
    "type": "reminder",
    "isRead":false,
    
    "imageUrl":"https://shorturl.at/yV4Ls"
  },
  {
    "id": "2",
    "title": "Task Deadline",
    "description": "Your project submission is due by midnight.",
    "date": "2024-02-05T23:59:00.000Z",
    "type": "deadline",
    "isRead":false,
"imageUrl":"https://shorturl.at/yV4Ls"

  },
  {
    "id": "3",
    "title": "System Update",
    "description": "A new version of the app is available. Please update.",
    "date": "2024-02-05T08:30:00.000Z",
    "type": "update",
    "isRead":true,"imageUrl":"https://shorturl.at/yV4Ls"

  },
  {
    "id": "4",
    "title": "New Message",
    "description": "You have received a new message from John.",
    "date": "2024-02-05T15:45:00.000Z",
    "type": "message",
    "isRead":false,"imageUrl":"https://shorturl.at/yV4Ls"

  },
  {
    "id": "5",
    "title": "Event Invitation",
    "description": "You have been invited to the annual tech conference.",
    "date": "2024-02-03T10:00:00.000Z",
    "type": "invitation",
    "isRead":true,"imageUrl":"https://shorturl.at/yV4Ls"

  },
    {
    "id": "6",
    "title": "Event Invitation",
   "description": "You have been invited to the annual tech conference.",
    "date": "2024-02-03T10:00:00.000Z",
    "type": "invitation",
    "isRead":true,"imageUrl":"https://shorturl.at/yV4Ls"

  },
    {
    "id": "7",
    "title": "Event Invitation",
    "description": "You have been invited to the annual tech conference.",
    "date": "2024-02-03T10:00:00.000Z",
    "type": "invitation",
    "isRead":true,"imageUrl":"https://shorturl.at/yV4Ls"

  },
    {
    "id": "8",
    "title": "Event Invitation",
    "description": "You have been invited to the annual tech conference.",
    "date": "2024-02-03T10:00:00.000Z",
    "type": "invitation",
    "isRead":true,"imageUrl":"https://shorturl.at/yV4Ls"

  },{
    "id": "9",
    "title": "Event Invitation",
    "description": "You have been invited to the annual tech conference.",
    "date": "2024-02-03T10:00:00.000Z",
    "type": "invitation",
    "isRead":true,"imageUrl":"https://shorturl.at/yV4Ls"

  }
]
;
  
}
class NotificationRemoteDataSource{
  final apiClient=DioServices.dio;

    //NOTE: this will be replaced with the id stored in the jwt TOken when Auth is setup
  final userId="4";
  Future<Either<Failure,List<NotificationModel>>> getUserNotification()async{
    try {
           await Future.delayed(Duration(milliseconds: 20));
      return Right( NotificationsStatics.mockNotifications.map((n)=>NotificationModel.fromJson(n)).toList()
      );        } catch (e) {
          
      return Left(Failure(e.toString()));
        }
  }
  Future<Either<Failure,Unit>> markNotificationAsRead(String id)async{
    try {
      await Future.delayed(Duration(milliseconds: 20));
      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  Future<Either<Failure,Unit>> deleteNotification(String id)async{
    try {
      await Future.delayed(Duration(milliseconds: 20));
      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
}

