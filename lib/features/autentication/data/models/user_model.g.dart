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
      number: json['number'] as String?,
      profilepic: json['profilepic'] as String?,
      links: json['links'] as String?,
      date_joined: json['date_joined'] as String,
      education: json['education'] as String?,
      gendre: json['gendre'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      rating: (json['rating'] as num?)?.toInt(),
      category: json['category'] as String?,
      cv: json['cv'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'number': instance.number,
      'profilepic': instance.profilepic,
      'links': instance.links,
      'date_joined': instance.date_joined,
      'education': instance.education,
      'gendre': instance.gendre,
      'skills': instance.skills,
      'rating': instance.rating,
      'category': instance.category,
      'cv': instance.cv,
    };
