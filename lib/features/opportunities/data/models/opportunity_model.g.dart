// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InternshipModelImpl _$$InternshipModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InternshipModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$OpportunityStatusEnumMap, json['status']) ??
          OpportunityStatus.open,
      duration: json['duration'] as String? ?? "",
      category: $enumDecode(_$OpportunityCategoryEnumMap, json['category']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InternshipModelImplToJson(
        _$InternshipModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'skills': instance.skills,
      'company': instance.company,
      'status': _$OpportunityStatusEnumMap[instance.status]!,
      'duration': instance.duration,
      'category': _$OpportunityCategoryEnumMap[instance.category]!,
      'runtimeType': instance.$type,
    };

const _$OpportunityStatusEnumMap = {
  OpportunityStatus.open: 'open',
  OpportunityStatus.close: 'close',
  OpportunityStatus.pending: 'pending',
};

const _$OpportunityCategoryEnumMap = {
  OpportunityCategory.EC: 'EC',
  OpportunityCategory.CS: 'CS',
  OpportunityCategory.EG: 'EG',
  OpportunityCategory.AH: 'AH',
  OpportunityCategory.HL: 'HL',
  OpportunityCategory.BM: 'BM',
  OpportunityCategory.LW: 'LW',
  OpportunityCategory.ED: 'ED',
  OpportunityCategory.None: 'None',
};

_$ProblemModelImpl _$$ProblemModelImplFromJson(Map<String, dynamic> json) =>
    _$ProblemModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$OpportunityStatusEnumMap, json['status']) ??
          OpportunityStatus.open,
      category: $enumDecode(_$OpportunityCategoryEnumMap, json['category']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ProblemModelImplToJson(_$ProblemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'skills': instance.skills,
      'company': instance.company,
      'status': _$OpportunityStatusEnumMap[instance.status]!,
      'category': _$OpportunityCategoryEnumMap[instance.category]!,
      'runtimeType': instance.$type,
    };
