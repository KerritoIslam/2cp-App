// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Invitation {
  int? get id => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;
  User? get inviter => throw _privateConstructorUsedError;
  User? get receiver => throw _privateConstructorUsedError;
  DateTime get createdate => throw _privateConstructorUsedError;
  InvitationStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvitationCopyWith<Invitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationCopyWith<$Res> {
  factory $InvitationCopyWith(
          Invitation value, $Res Function(Invitation) then) =
      _$InvitationCopyWithImpl<$Res, Invitation>;
  @useResult
  $Res call(
      {int? id,
      Team team,
      User? inviter,
      User? receiver,
      DateTime createdate,
      InvitationStatus status});

  $TeamCopyWith<$Res> get team;
  $UserCopyWith<$Res>? get inviter;
  $UserCopyWith<$Res>? get receiver;
}

/// @nodoc
class _$InvitationCopyWithImpl<$Res, $Val extends Invitation>
    implements $InvitationCopyWith<$Res> {
  _$InvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? team = null,
    Object? inviter = freezed,
    Object? receiver = freezed,
    Object? createdate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
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
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
    ) as $Val);
  }

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }

  /// Create a copy of Invitation
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

  /// Create a copy of Invitation
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
abstract class _$$InvitationImplCopyWith<$Res>
    implements $InvitationCopyWith<$Res> {
  factory _$$InvitationImplCopyWith(
          _$InvitationImpl value, $Res Function(_$InvitationImpl) then) =
      __$$InvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      Team team,
      User? inviter,
      User? receiver,
      DateTime createdate,
      InvitationStatus status});

  @override
  $TeamCopyWith<$Res> get team;
  @override
  $UserCopyWith<$Res>? get inviter;
  @override
  $UserCopyWith<$Res>? get receiver;
}

/// @nodoc
class __$$InvitationImplCopyWithImpl<$Res>
    extends _$InvitationCopyWithImpl<$Res, _$InvitationImpl>
    implements _$$InvitationImplCopyWith<$Res> {
  __$$InvitationImplCopyWithImpl(
      _$InvitationImpl _value, $Res Function(_$InvitationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? team = null,
    Object? inviter = freezed,
    Object? receiver = freezed,
    Object? createdate = null,
    Object? status = null,
  }) {
    return _then(_$InvitationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
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
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
    ));
  }
}

/// @nodoc

class _$InvitationImpl extends _Invitation {
  const _$InvitationImpl(
      {required this.id,
      required this.team,
      required this.inviter,
      required this.receiver,
      required this.createdate,
      required this.status})
      : super._();

  @override
  final int? id;
  @override
  final Team team;
  @override
  final User? inviter;
  @override
  final User? receiver;
  @override
  final DateTime createdate;
  @override
  final InvitationStatus status;

  @override
  String toString() {
    return 'Invitation(id: $id, team: $team, inviter: $inviter, receiver: $receiver, createdate: $createdate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.inviter, inviter) || other.inviter == inviter) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.createdate, createdate) ||
                other.createdate == createdate) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, team, inviter, receiver, createdate, status);

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationImplCopyWith<_$InvitationImpl> get copyWith =>
      __$$InvitationImplCopyWithImpl<_$InvitationImpl>(this, _$identity);
}

abstract class _Invitation extends Invitation {
  const factory _Invitation(
      {required final int? id,
      required final Team team,
      required final User? inviter,
      required final User? receiver,
      required final DateTime createdate,
      required final InvitationStatus status}) = _$InvitationImpl;
  const _Invitation._() : super._();

  @override
  int? get id;
  @override
  Team get team;
  @override
  User? get inviter;
  @override
  User? get receiver;
  @override
  DateTime get createdate;
  @override
  InvitationStatus get status;

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvitationImplCopyWith<_$InvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
