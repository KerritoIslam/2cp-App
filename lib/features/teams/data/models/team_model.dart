import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
class TeamModel with _$TeamModel {
  const factory TeamModel({
    required int id,
    required String name,
   @Default([]) List<User> students,
   required User leader,
   required String createdAt
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
}
