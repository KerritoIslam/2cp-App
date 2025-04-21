import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:app/features/teams/domain/enum/invitation_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation.freezed.dart';
part 'invitation.g.dart';

@freezed
class Invitation with _$Invitation {
  const factory Invitation({
    required int id,
    required Team team,
    required User? inviter,
    required User? receiver,  
    required DateTime createdate,
    required  InvitationStatus status,
  }) = _Invitation;

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);
}
