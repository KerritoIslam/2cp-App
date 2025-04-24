import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/data/models/team_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';

@freezed
class Team with _$Team {
  const factory Team(
      {required int? id,
      required String name,
      @Default([]) List<User> students,
      required User leader,
      required DateTime createdate,String? description,}) = _Team;
      
  const Team._();
  factory Team.fromModel(TeamModel model) {
    return Team(
      id: model.id,
      name: model.name,
      students: model.students,
      leader: model.leader,
      createdate: DateTime.parse(model.createdate),
      description: model.description,
    );
  }
  TeamModel toModel() {
    return TeamModel(
      id: id,
      name: name,
      students: students,
      leader: leader,
      createdate: createdate.toIso8601String(),
      description: description,
    );
  }
}
