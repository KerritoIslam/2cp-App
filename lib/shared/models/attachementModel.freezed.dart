// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attachementModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attachementmodel _$AttachementmodelFromJson(Map<String, dynamic> json) {
  return _Attachementmodel.fromJson(json);
}

/// @nodoc
mixin _$Attachementmodel {
  int get id => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get fileType => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  String get fileSize => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Attachementmodel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attachementmodel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachementmodelCopyWith<Attachementmodel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachementmodelCopyWith<$Res> {
  factory $AttachementmodelCopyWith(
          Attachementmodel value, $Res Function(Attachementmodel) then) =
      _$AttachementmodelCopyWithImpl<$Res, Attachementmodel>;
  @useResult
  $Res call(
      {int id,
      String fileName,
      String fileType,
      String fileUrl,
      String fileSize,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AttachementmodelCopyWithImpl<$Res, $Val extends Attachementmodel>
    implements $AttachementmodelCopyWith<$Res> {
  _$AttachementmodelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attachementmodel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? fileType = null,
    Object? fileUrl = null,
    Object? fileSize = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttachementmodelImplCopyWith<$Res>
    implements $AttachementmodelCopyWith<$Res> {
  factory _$$AttachementmodelImplCopyWith(_$AttachementmodelImpl value,
          $Res Function(_$AttachementmodelImpl) then) =
      __$$AttachementmodelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String fileName,
      String fileType,
      String fileUrl,
      String fileSize,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$AttachementmodelImplCopyWithImpl<$Res>
    extends _$AttachementmodelCopyWithImpl<$Res, _$AttachementmodelImpl>
    implements _$$AttachementmodelImplCopyWith<$Res> {
  __$$AttachementmodelImplCopyWithImpl(_$AttachementmodelImpl _value,
      $Res Function(_$AttachementmodelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attachementmodel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? fileType = null,
    Object? fileUrl = null,
    Object? fileSize = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AttachementmodelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachementmodelImpl extends _Attachementmodel {
  _$AttachementmodelImpl(
      {required this.id,
      required this.fileName,
      required this.fileType,
      required this.fileUrl,
      required this.fileSize,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$AttachementmodelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachementmodelImplFromJson(json);

  @override
  final int id;
  @override
  final String fileName;
  @override
  final String fileType;
  @override
  final String fileUrl;
  @override
  final String fileSize;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Attachementmodel(id: $id, fileName: $fileName, fileType: $fileType, fileUrl: $fileUrl, fileSize: $fileSize, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachementmodelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileName, fileType, fileUrl,
      fileSize, createdAt, updatedAt);

  /// Create a copy of Attachementmodel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachementmodelImplCopyWith<_$AttachementmodelImpl> get copyWith =>
      __$$AttachementmodelImplCopyWithImpl<_$AttachementmodelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachementmodelImplToJson(
      this,
    );
  }
}

abstract class _Attachementmodel extends Attachementmodel {
  factory _Attachementmodel(
      {required final int id,
      required final String fileName,
      required final String fileType,
      required final String fileUrl,
      required final String fileSize,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AttachementmodelImpl;
  _Attachementmodel._() : super._();

  factory _Attachementmodel.fromJson(Map<String, dynamic> json) =
      _$AttachementmodelImpl.fromJson;

  @override
  int get id;
  @override
  String get fileName;
  @override
  String get fileType;
  @override
  String get fileUrl;
  @override
  String get fileSize;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Attachementmodel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachementmodelImplCopyWith<_$AttachementmodelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
