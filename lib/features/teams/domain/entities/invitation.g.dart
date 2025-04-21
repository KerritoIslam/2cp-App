// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationImpl _$$InvitationImplFromJson(Map<String, dynamic> json) =>
    _$InvitationImpl(
      id: (json['id'] as num).toInt(),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      inviter: json['inviter'] == null
          ? null
          : User.fromJson(json['inviter'] as Map<String, dynamic>),
      receiver: json['receiver'] == null
          ? null
          : User.fromJson(json['receiver'] as Map<String, dynamic>),
      createdate: DateTime.parse(json['createdate'] as String),
      status: $enumDecode(_$InvitationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$InvitationImplToJson(_$InvitationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'team': instance.team,
      'inviter': instance.inviter,
      'receiver': instance.receiver,
      'createdate': instance.createdate.toIso8601String(),
      'status': _$InvitationStatusEnumMap[instance.status]!,
    };

const _$InvitationStatusEnumMap = {
  InvitationStatus.pending: 'pending',
  InvitationStatus.accepted: 'accepted',
  InvitationStatus.rejected: 'rejected',
  InvitationStatus.cancelled: 'cancelled',
};
