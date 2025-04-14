// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationModelImpl _$$ApplicationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationModelImpl(
      id: (json['id'] as num).toInt(),
      proposal: json['proposal'] as String,
      post: OpportunityModel.fromJson(json['post'] as Map<String, dynamic>),
      sumbittedAt: DateTime.parse(json['sumbittedAt'] as String),
      type: json['type'] as String,
      status: $enumDecodeNullable(_$ApplicationStatusEnumMap, json['status']) ??
          ApplicationStatus.submitted,
    );

Map<String, dynamic> _$$ApplicationModelImplToJson(
        _$ApplicationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proposal': instance.proposal,
      'post': instance.post,
      'sumbittedAt': instance.sumbittedAt.toIso8601String(),
      'type': instance.type,
      'status': _$ApplicationStatusEnumMap[instance.status]!,
    };

const _$ApplicationStatusEnumMap = {
  ApplicationStatus.submitted: 'submitted',
  ApplicationStatus.inReview: 'inReview',
  ApplicationStatus.accepted: 'accepted',
  ApplicationStatus.rejected: 'rejected',
};
