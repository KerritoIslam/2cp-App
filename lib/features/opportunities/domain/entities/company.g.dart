// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: json['category'] as String? ?? '',
      profilepic: json['profilepic'] as String? ?? '',
      date_joined: json['date_joined'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      number: json['number'] as String?,
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'profilepic': instance.profilepic,
      'date_joined': instance.date_joined,
      'email': instance.email,
      'description': instance.description,
      'location': instance.location,
      'number': instance.number,
    };
