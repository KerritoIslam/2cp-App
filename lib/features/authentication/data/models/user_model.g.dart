// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      description: json['description'] as String? ?? '',
      profilepic: json['profilepic'] as Map<String, dynamic>? ??
          const {"link": '', "name": '', "size": 0, 'created_at': ''},
      date_joined: json['date_joined'] as String,
      education: (json['education'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      experience: (json['experience'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      cv: json['cv'] as Map<String, dynamic>? ??
          const {"link": '', "name": '', "size": 0, 'created_at': ''},
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'description': instance.description,
      'profilepic': instance.profilepic,
      'date_joined': instance.date_joined,
      'education': instance.education,
      'skills': instance.skills,
      'experience': instance.experience,
      'cv': instance.cv,
    };
