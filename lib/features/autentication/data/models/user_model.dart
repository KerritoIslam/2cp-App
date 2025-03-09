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
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
