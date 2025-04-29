// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      description: json['description'] as String?,
      number: json['number'] as String?,
      profilepic: json['profilepic'] as String?,
      links: json['links'] as String?,
      date_joined: json['date_joined'] as String,
      education: (json['education'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      gendre: json['gendre'] as String,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rating: (json['rating'] as num?)?.toInt(),
      internships: (json['internships'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      category: json['category'] as String?,
      cv: json['cv'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'description': instance.description,
      'number': instance.number,
      'profilepic': instance.profilepic,
      'links': instance.links,
      'date_joined': instance.date_joined,
      'education': instance.education,
      'gendre': instance.gendre,
      'skills': instance.skills,
      'rating': instance.rating,
      'internships': instance.internships,
      'category': instance.category,
      'cv': instance.cv,
    };
