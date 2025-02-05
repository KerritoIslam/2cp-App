// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationModelImpl _$$ApplicationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationModelImpl(
      id: json['id'] as String,
      proposal: json['proposal'] as String,
      postId: json['postId'] as String,
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      sumbittedAt: DateTime.parse(json['sumbittedAt'] as String),
      type: json['type'] as String,
      status: $enumDecodeNullable(_$ApplicationStatusEnumMap, json['status']) ??
          ApplicationStatus.sumbitted,
    );

Map<String, dynamic> _$$ApplicationModelImplToJson(
        _$ApplicationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proposal': instance.proposal,
      'postId': instance.postId,
      'company': instance.company,
      'sumbittedAt': instance.sumbittedAt.toIso8601String(),
      'type': instance.type,
      'status': _$ApplicationStatusEnumMap[instance.status]!,
    };

const _$ApplicationStatusEnumMap = {
  ApplicationStatus.sumbitted: 'sumbitted',
  ApplicationStatus.inReview: 'inReview',
  ApplicationStatus.accepted: 'accepted',
  ApplicationStatus.rejected: 'rejected',
};
