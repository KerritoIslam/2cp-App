
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
//TODO add More userInfo
class User with _$User {
   const User._();
  const factory User({
   required int id,
    required String name,
    required String email,
    String? discription,
    String? number,
    String? profilepic,
    String? links,
    required String date_joined,
    @Default([]) List<Map<String,dynamic>> education,
    required String gendre,
    @Default([]) List<String> skills,
     int? rating,
    
    @Default([]) List<Map<String, dynamic>> internships,
    String? category,
    String? cv,

  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //somthing
}
