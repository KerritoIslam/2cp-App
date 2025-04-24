import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/data/models/invitation_model.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:app/features/teams/domain/enum/invitation_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation.freezed.dart';

@freezed
class Invitation with _$Invitation {
  const factory Invitation({
    required int? id,
    required Team team,
    required User? inviter,
    required User? receiver,
    required DateTime createdate,
    required InvitationStatus status,
  }) = _Invitation;
  const Invitation._();
  factory Invitation.fromModel(InvitationModel model) {
    return Invitation(
      id: model.id,
      team: Team.fromModel(model.team),
      inviter: model.inviter,
      receiver: model.receiver,
      createdate: DateTime.parse(model.createdate),
      status: InvitationStatus.values.firstWhere((e) => e.name == model.status),
    );
  }
  InvitationModel toModel() {
    return InvitationModel(
      id: id,
      team: team.toModel(),
      inviter: inviter,
      receiver: receiver,
      createdate: createdate.toIso8601String(),
      status: status.name,
    );
  }
}
