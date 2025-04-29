// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatModel {
  int get id => throw _privateConstructorUsedError;
  CompanyModel get company => throw _privateConstructorUsedError;
  String get room_name => throw _privateConstructorUsedError;
  String get last_message => throw _privateConstructorUsedError;
  String get last_message_time => throw _privateConstructorUsedError;
  bool? get is_online => throw _privateConstructorUsedError;
  bool? get is_typing => throw _privateConstructorUsedError;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {int id,
      CompanyModel company,
      String room_name,
      String last_message,
      String last_message_time,
      bool? is_online,
      bool? is_typing});

  $CompanyModelCopyWith<$Res> get company;
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? room_name = null,
    Object? last_message = null,
    Object? last_message_time = null,
    Object? is_online = freezed,
    Object? is_typing = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      room_name: null == room_name
          ? _value.room_name
          : room_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_message: null == last_message
          ? _value.last_message
          : last_message // ignore: cast_nullable_to_non_nullable
              as String,
      last_message_time: null == last_message_time
          ? _value.last_message_time
          : last_message_time // ignore: cast_nullable_to_non_nullable
              as String,
      is_online: freezed == is_online
          ? _value.is_online
          : is_online // ignore: cast_nullable_to_non_nullable
              as bool?,
      is_typing: freezed == is_typing
          ? _value.is_typing
          : is_typing // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyModelCopyWith<$Res> get company {
    return $CompanyModelCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
          _$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) =
      __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      CompanyModel company,
      String room_name,
      String last_message,
      String last_message_time,
      bool? is_online,
      bool? is_typing});

  @override
  $CompanyModelCopyWith<$Res> get company;
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
      _$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? room_name = null,
    Object? last_message = null,
    Object? last_message_time = null,
    Object? is_online = freezed,
    Object? is_typing = freezed,
  }) {
    return _then(_$ChatModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      room_name: null == room_name
          ? _value.room_name
          : room_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_message: null == last_message
          ? _value.last_message
          : last_message // ignore: cast_nullable_to_non_nullable
              as String,
      last_message_time: null == last_message_time
          ? _value.last_message_time
          : last_message_time // ignore: cast_nullable_to_non_nullable
              as String,
      is_online: freezed == is_online
          ? _value.is_online
          : is_online // ignore: cast_nullable_to_non_nullable
              as bool?,
      is_typing: freezed == is_typing
          ? _value.is_typing
          : is_typing // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ChatModelImpl extends _ChatModel {
  const _$ChatModelImpl(
      {required this.id,
      required this.company,
      required this.room_name,
      required this.last_message,
      required this.last_message_time,
      this.is_online = false,
      this.is_typing = false})
      : super._();

  @override
  final int id;
  @override
  final CompanyModel company;
  @override
  final String room_name;
  @override
  final String last_message;
  @override
  final String last_message_time;
  @override
  @JsonKey()
  final bool? is_online;
  @override
  @JsonKey()
  final bool? is_typing;

  @override
  String toString() {
    return 'ChatModel(id: $id, company: $company, room_name: $room_name, last_message: $last_message, last_message_time: $last_message_time, is_online: $is_online, is_typing: $is_typing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.room_name, room_name) ||
                other.room_name == room_name) &&
            (identical(other.last_message, last_message) ||
                other.last_message == last_message) &&
            (identical(other.last_message_time, last_message_time) ||
                other.last_message_time == last_message_time) &&
            (identical(other.is_online, is_online) ||
                other.is_online == is_online) &&
            (identical(other.is_typing, is_typing) ||
                other.is_typing == is_typing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, company, room_name,
      last_message, last_message_time, is_online, is_typing);

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);
}

abstract class _ChatModel extends ChatModel {
  const factory _ChatModel(
      {required final int id,
      required final CompanyModel company,
      required final String room_name,
      required final String last_message,
      required final String last_message_time,
      final bool? is_online,
      final bool? is_typing}) = _$ChatModelImpl;
  const _ChatModel._() : super._();

  @override
  int get id;
  @override
  CompanyModel get company;
  @override
  String get room_name;
  @override
  String get last_message;
  @override
  String get last_message_time;
  @override
  bool? get is_online;
  @override
  bool? get is_typing;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
