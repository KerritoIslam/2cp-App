import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team(
      {required int id,
      required String name,
      @Default([]) List<User> students,
      required User leader,
      required DateTime createdAt}) = _Team;
  
  
  factory Team.fromJson(Map<String, dynamic> json) {

    return _$TeamFromJson(json);
  }
}
