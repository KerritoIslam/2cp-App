
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

 factory User.fromModel(UserModel model) {
    return User(
      id: model.id,
      name: model.name,
      email: model.email,
      description: model.description,
      number: model.number,
      profilepic: model.profilepic,
      links: model.links,
      date_joined: model.date_joined,
      education: model.education,
      gendre: model.gendre,
      skills: model.skills,
      rating: model.rating,
      internships: model.internships,
      category: model.category,
      cv: model.cv,
    );
  }
  UserModel toModel() {
    return UserModel(
      id: id,
      name: name,
      email: email,
      description: description,
      number: number,
      profilepic: profilepic,
      links: links,
      date_joined: date_joined,
      education: education,
      gendre: gendre,
      skills: skills,
      rating: rating,
      internships: internships,
      category: category,
      cv: cv,
    );
  }
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //somthing
}
