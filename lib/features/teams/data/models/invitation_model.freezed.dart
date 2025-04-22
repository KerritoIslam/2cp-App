// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvitationModel _$InvitationModelFromJson(Map<String, dynamic> json) {
  return _InvitationModel.fromJson(json);
}

/// @nodoc
mixin _$InvitationModel {
  int get id => throw _privateConstructorUsedError;
  TeamModel get team => throw _privateConstructorUsedError;
  User? get inviter => throw _privateConstructorUsedError;
  User? get receiver => throw _privateConstructorUsedError;
  String get createdate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this InvitationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvitationModelCopyWith<InvitationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationModelCopyWith<$Res> {
  factory $InvitationModelCopyWith(
          InvitationModel value, $Res Function(InvitationModel) then) =
      _$InvitationModelCopyWithImpl<$Res, InvitationModel>;
  @useResult
  $Res call(
      {int id,
      TeamModel team,
      User? inviter,
      User? receiver,
      String createdate,
      String status});

  $TeamModelCopyWith<$Res> get team;
  $UserCopyWith<$Res>? get inviter;
  $UserCopyWith<$Res>? get receiver;
}

/// @nodoc
class _$InvitationModelCopyWithImpl<$Res, $Val extends InvitationModel>
    implements $InvitationModelCopyWith<$Res> {
  _$InvitationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? team = null,
    Object? inviter = freezed,
    Object? receiver = freezed,
    Object? createdate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamModel,
      inviter: freezed == inviter
          ? _value.inviter
          : inviter // ignore: cast_nullable_to_non_nullable
              as User?,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as User?,
      createdate: null == createdate
          ? _value.createdate
          : createdate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of InvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamModelCopyWith<$Res> get team {
    return $TeamModelCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }

  /// Create a copy of InvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get inviter {
    if (_value.inviter == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.inviter!, (value) {
      return _then(_value.copyWith(inviter: value) as $Val);
    });
  }

  /// Create a copy of InvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get receiver {
    if (_value.receiver == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.receiver!, (value) {
      return _then(_value.copyWith(receiver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvitationModelImplCopyWith<$Res>
    implements $InvitationModelCopyWith<$Res> {
  factory _$$InvitationModelImplCopyWith(_$InvitationModelImpl value,
          $Res Function(_$InvitationModelImpl) then) =
      __$$InvitationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      TeamModel team,
      User? inviter,
      User? receiver,
      String createdate,
      String status});

  @override
  $TeamModelCopyWith<$Res> get team;
  @override
  $UserCopyWith<$Res>? get inviter;
  @override
  $UserCopyWith<$Res>? get receiver;
}

/// @nodoc
class __$$InvitationModelImplCopyWithImpl<$Res>
    extends _$InvitationModelCopyWithImpl<$Res, _$InvitationModelImpl>
    implements _$$InvitationModelImplCopyWith<$Res> {
  __$$InvitationModelImplCopyWithImpl(
      _$InvitationModelImpl _value, $Res Function(_$InvitationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? team = null,
    Object? inviter = freezed,
    Object? receiver = freezed,
    Object? createdate = null,
    Object? status = null,
  }) {
    return _then(_$InvitationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamModel,
      inviter: freezed == inviter
          ? _value.inviter
          : inviter // ignore: cast_nullable_to_non_nullable
              as User?,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as User?,
      createdate: null == createdate
          ? _value.createdate
          : createdate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitationModelImpl implements _InvitationModel {
  const _$InvitationModelImpl(
      {required this.id,
      required this.team,
      required this.inviter,
      required this.receiver,
      required this.createdate,
      required this.status});

  factory _$InvitationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationModelImplFromJson(json);

  @override
  final int id;
  @override
  final TeamModel team;
  @override
  final User? inviter;
  @override
  final User? receiver;
  @override
  final String createdate;
  @override
  final String status;

  @override
  String toString() {
    return 'InvitationModel(id: $id, team: $team, inviter: $inviter, receiver: $receiver, createdate: $createdate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.inviter, inviter) || other.inviter == inviter) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.createdate, createdate) ||
                other.createdate == createdate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, team, inviter, receiver, createdate, status);

  /// Create a copy of InvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationModelImplCopyWith<_$InvitationModelImpl> get copyWith =>
      __$$InvitationModelImplCopyWithImpl<_$InvitationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationModelImplToJson(
      this,
    );
  }
}

abstract class _InvitationModel implements InvitationModel {
  const factory _InvitationModel(
      {required final int id,
      required final TeamModel team,
      required final User? inviter,
      required final User? receiver,
      required final String createdate,
      required final String status}) = _$InvitationModelImpl;

  factory _InvitationModel.fromJson(Map<String, dynamic> json) =
      _$InvitationModelImpl.fromJson;

  @override
  int get id;
  @override
  TeamModel get team;
  @override
  User? get inviter;
  @override
  User? get receiver;
  @override
  String get createdate;
  @override
  String get status;

  /// Create a copy of InvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvitationModelImplCopyWith<_$InvitationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
