
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
    String? number,
    String? profilepic,
    String? links,
    required String date_joined,
    String? education,
    required String gendre,
    required List<String> skills,
     int? rating,
    String? category,
    String? cv,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //somthing
}
