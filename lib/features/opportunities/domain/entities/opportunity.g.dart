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
          OpportunityStatus.open,
      duration: json['duration'] as String,
      applicantsAvatars: (json['applicantsAvatars'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalApplications: (json['totalApplications'] as num).toInt(),
      category: json['category'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InternshipImplToJson(_$InternshipImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'skills': instance.skills,
      'company': instance.company,
      'status': _$OpportunityStatusEnumMap[instance.status]!,
      'duration': instance.duration,
      'applicantsAvatars': instance.applicantsAvatars,
      'totalApplications': instance.totalApplications,
      'category': instance.category,
      'runtimeType': instance.$type,
    };

const _$OpportunityStatusEnumMap = {
  OpportunityStatus.open: 'open',
  OpportunityStatus.close: 'close',
};

_$ProblemImpl _$$ProblemImplFromJson(Map<String, dynamic> json) =>
    _$ProblemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      totalApplications: (json['totalApplications'] as num).toInt(),
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      applicantsAvatars: (json['applicantsAvatars'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$OpportunityStatusEnumMap, json['status']) ??
          OpportunityStatus.open,
      category: json['category'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ProblemImplToJson(_$ProblemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'totalApplications': instance.totalApplications,
      'skills': instance.skills,
      'applicantsAvatars': instance.applicantsAvatars,
      'company': instance.company,
      'status': _$OpportunityStatusEnumMap[instance.status]!,
      'category': instance.category,
      'runtimeType': instance.$type,
    };
