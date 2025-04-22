import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/data/models/team_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'invitation_model.freezed.dart';
part 'invitation_model.g.dart';

@freezed
class InvitationModel with _$InvitationModel {
  const factory InvitationModel({
    required int id,
    required TeamModel team,
    required User? inviter,
    required User? receiver,  
    required String createdate,
    required String status,
    
  }) = _InvitationModel;
 


  factory InvitationModel.fromJson(Map<String, dynamic> json) =>
      _$InvitationModelFromJson(json);
}
