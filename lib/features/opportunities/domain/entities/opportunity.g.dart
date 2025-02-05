// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InternshipImpl _$$InternshipImplFromJson(Map<String, dynamic> json) =>
    _$InternshipImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$OpportunityStatusEnumMap, json['status']) ??
          OpportunityStatus.ongoing,
      duration: json['duration'] as String,
      category: json['category'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InternshipImplToJson(_$InternshipImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'skills': instance.skills,
      'company': instance.company.toJson(),
      'status': _$OpportunityStatusEnumMap[instance.status]!,
      'duration': instance.duration,
      'category': instance.category,
      'runtimeType': instance.$type,
    };

const _$OpportunityStatusEnumMap = {
  OpportunityStatus.pending: 'pending',
  OpportunityStatus.ended: 'ended',
  OpportunityStatus.ongoing: 'ongoing',
};

_$ProblemImpl _$$ProblemImplFromJson(Map<String, dynamic> json) =>
    _$ProblemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$OpportunityStatusEnumMap, json['status']) ??
          OpportunityStatus.ongoing,
      category: json['category'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ProblemImplToJson(_$ProblemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'skills': instance.skills,
      'company': instance.company,
      'status': _$OpportunityStatusEnumMap[instance.status]!,
      'category': instance.category,
      'runtimeType': instance.$type,
    };
