import 'package:app/features/authentication/data/models/user_model.dart';
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
    String? description,
    @Default({"link": '', "name": '', "size": 0, 'created_at': ''})
    Map<String, dynamic> profilepic,
    required String date_joined,
    @Default([]) List<Map<String, dynamic>> education,
    @Default([]) List<String> skills,
    @Default([]) List<Map<String, dynamic>> experience,
    @Default({"link": '', "name": '', "size": 0, 'created_at': ''})
    Map<String, dynamic> cv,
  }) = _User;

  factory User.fromModel(UserModel model) {
    return User(
      id: model.id,
      name: model.name,
      email: model.email,
      description: model.description,
      profilepic: model.profilepic,
      experience: model.experience,
      date_joined: model.date_joined,
      education: model.education,
      skills: model.skills,
      cv: model.cv,
    );
  }
  UserModel toModel() {
    return UserModel(
      id: id,
      name: name,
      email: email,
      description: description,
      profilepic: profilepic,
      date_joined: date_joined,
      education: education,
      skills: skills,
      experience: experience,
      cv: cv,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //somthing
}
