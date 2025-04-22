// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamModelImpl _$$TeamModelImplFromJson(Map<String, dynamic> json) =>
    _$TeamModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      students: (json['students'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      leader: User.fromJson(json['leader'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$TeamModelImplToJson(_$TeamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'students': instance.students,
      'leader': instance.leader,
      'createdAt': instance.createdAt,
    };
