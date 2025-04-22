// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachementModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachementmodelImpl _$$AttachementmodelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttachementmodelImpl(
      id: (json['id'] as num).toInt(),
      fileName: json['fileName'] as String,
      fileType: json['fileType'] as String,
      fileUrl: json['fileUrl'] as String,
      fileSize: json['fileSize'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AttachementmodelImplToJson(
        _$AttachementmodelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'fileType': instance.fileType,
      'fileUrl': instance.fileUrl,
      'fileSize': instance.fileSize,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
