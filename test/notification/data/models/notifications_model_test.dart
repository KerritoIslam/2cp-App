import 'package:app/features/notifications/data/models/notification_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
 group('Notification Serilazation Tests: ', () {
  test('Should Return a Notification from Json', () {
//Arrange
final json={
  'id': '1',
  'title': 'Congratulations',
  'description': 'You have been selected for the internship',
  'date': DateTime.now().toIso8601String(),
   'type':"Problem_Status",
    'status':"ongoing",  
    };
      //ACT
    final model = NotificationModel.fromJson(json);
//Assert
    expect(model.id, '1');
    expect(model.title, 'Congratulations');
    expect(model.description, 'You have been selected for the internship');
    })  ;
  });
  test('Should Return a Json from Notification', () {
    //Arrange
    final model = NotificationModel(
      id: '1',
      title: 'Congratulations',
      description: 'You have been selected for the internship',
      date: DateTime.now(),
      type: "Problem_Status",
      status: "ongoing",
    );
    //ACT
    final json = model.toJson();
    //Assert
    expect(json, {
      'id': '1',
      'title': 'Congratulations',
      'description': 'You have been selected for the internship',
      'date': model.date.toIso8601String(),
      'type': "Problem_Status",
      'status': "ongoing",
    });
    
  });
}
