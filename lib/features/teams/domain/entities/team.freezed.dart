// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Team {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<User> get students => throw _privateConstructorUsedError;
  User get leader => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res, Team>;
  @useResult
  $Res call(
      {int id,
      String name,
      List<User> students,
      User leader,
      DateTime createdAt});

  $UserCopyWith<$Res> get leader;
}

/// @nodoc
class _$TeamCopyWithImpl<$Res, $Val extends Team>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? students = null,
    Object? leader = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<User>,
      leader: null == leader
          ? _value.leader
          : leader // ignore: cast_nullable_to_non_nullable
              as User,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get leader {
    return $UserCopyWith<$Res>(_value.leader, (value) {
      return _then(_value.copyWith(leader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeamImplCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$TeamImplCopyWith(
          _$TeamImpl value, $Res Function(_$TeamImpl) then) =
      __$$TeamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      List<User> students,
      User leader,
      DateTime createdAt});

  @override
  $UserCopyWith<$Res> get leader;
}

/// @nodoc
class __$$TeamImplCopyWithImpl<$Res>
    extends _$TeamCopyWithImpl<$Res, _$TeamImpl>
    implements _$$TeamImplCopyWith<$Res> {
  __$$TeamImplCopyWithImpl(_$TeamImpl _value, $Res Function(_$TeamImpl) _then)
      : super(_value, _then);

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? students = null,
    Object? leader = null,
    Object? createdAt = null,
  }) {
    return _then(_$TeamImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      students: null == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<User>,
      leader: null == leader
          ? _value.leader
          : leader // ignore: cast_nullable_to_non_nullable
              as User,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$TeamImpl implements _Team {
  const _$TeamImpl(
      {required this.id,
      required this.name,
      final List<User> students = const [],
      required this.leader,
      required this.createdAt})
      : _students = students;

  @override
  final int id;
  @override
  final String name;
  final List<User> _students;
  @override
  @JsonKey()
  List<User> get students {
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  @override
  final User leader;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Team(id: $id, name: $name, students: $students, leader: $leader, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            (identical(other.leader, leader) || other.leader == leader) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_students), leader, createdAt);

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      __$$TeamImplCopyWithImpl<_$TeamImpl>(this, _$identity);
}

abstract class _Team implements Team {
  const factory _Team(
      {required final int id,
      required final String name,
      final List<User> students,
      required final User leader,
      required final DateTime createdAt}) = _$TeamImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  List<User> get students;
  @override
  User get leader;
  @override
  DateTime get createdAt;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
