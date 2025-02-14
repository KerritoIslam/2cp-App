
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class User with _$User {
   const User._();
  const factory User({
    required int id,
    required String name,
    required String email,
     String? password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //somthing
}
