// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationModelImpl _$$InvitationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationModelImpl(
      id: (json['id'] as num?)?.toInt(),
      team: TeamModel.fromJson(json['team'] as Map<String, dynamic>),
      inviter: json['inviter'] == null
          ? null
          : User.fromJson(json['inviter'] as Map<String, dynamic>),
      receiver: json['receiver'] == null
          ? null
          : User.fromJson(json['receiver'] as Map<String, dynamic>),
      createdate: json['createdate'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$InvitationModelImplToJson(
        _$InvitationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'team': instance.team,
      'inviter': instance.inviter,
      'receiver': instance.receiver,
      'createdate': instance.createdate,
      'status': instance.status,
    };
