import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required int id,
    required String name,
    required String email,
    @Default('') String? description,
    @Default({"link": '', "name": '', "size": 0 ,'created_at': ''})
        Map<String, dynamic> profilepic,
    required String date_joined,
    @Default([]) List<Map<String, dynamic>> education,
    @Default([]) List<String> skills,
    @Default([]) List<Map<String, dynamic>> experience,
    @Default({"link": '', "name": '', "size": 0 ,'created_at': ''})
        Map<String, dynamic> cv,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
