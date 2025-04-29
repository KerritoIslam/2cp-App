// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get profilepic => throw _privateConstructorUsedError;
  String? get links => throw _privateConstructorUsedError;
  String get date_joined => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get education =>
      throw _privateConstructorUsedError;
  String get gendre => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get internships =>
      throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get cv => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? description,
      String? number,
      String? profilepic,
      String? links,
      String date_joined,
      List<Map<String, dynamic>> education,
      String gendre,
      List<String> skills,
      int? rating,
      List<Map<String, dynamic>> internships,
      String? category,
      String? cv});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? description = freezed,
    Object? number = freezed,
    Object? profilepic = freezed,
    Object? links = freezed,
    Object? date_joined = null,
    Object? education = null,
    Object? gendre = null,
    Object? skills = null,
    Object? rating = freezed,
    Object? internships = null,
    Object? category = freezed,
    Object? cv = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      profilepic: freezed == profilepic
          ? _value.profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as String?,
      date_joined: null == date_joined
          ? _value.date_joined
          : date_joined // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      gendre: null == gendre
          ? _value.gendre
          : gendre // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      internships: null == internships
          ? _value.internships
          : internships // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      cv: freezed == cv
          ? _value.cv
          : cv // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? description,
      String? number,
      String? profilepic,
      String? links,
      String date_joined,
      List<Map<String, dynamic>> education,
      String gendre,
      List<String> skills,
      int? rating,
      List<Map<String, dynamic>> internships,
      String? category,
      String? cv});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? description = freezed,
    Object? number = freezed,
    Object? profilepic = freezed,
    Object? links = freezed,
    Object? date_joined = null,
    Object? education = null,
    Object? gendre = null,
    Object? skills = null,
    Object? rating = freezed,
    Object? internships = null,
    Object? category = freezed,
    Object? cv = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      profilepic: freezed == profilepic
          ? _value.profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as String?,
      date_joined: null == date_joined
          ? _value.date_joined
          : date_joined // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value._education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      gendre: null == gendre
          ? _value.gendre
          : gendre // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      internships: null == internships
          ? _value._internships
          : internships // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      cv: freezed == cv
          ? _value.cv
          : cv // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.name,
      required this.email,
      this.description,
      this.number,
      this.profilepic,
      this.links,
      required this.date_joined,
      final List<Map<String, dynamic>> education = const [],
      required this.gendre,
      final List<String> skills = const [],
      this.rating,
      final List<Map<String, dynamic>> internships = const [],
      this.category,
      this.cv})
      : _education = education,
        _skills = skills,
        _internships = internships,
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? description;
  @override
  final String? number;
  @override
  final String? profilepic;
  @override
  final String? links;
  @override
  final String date_joined;
  final List<Map<String, dynamic>> _education;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get education {
    if (_education is EqualUnmodifiableListView) return _education;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_education);
  }

  @override
  final String gendre;
  final List<String> _skills;
  @override
  @JsonKey()
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final int? rating;
  final List<Map<String, dynamic>> _internships;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get internships {
    if (_internships is EqualUnmodifiableListView) return _internships;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_internships);
  }

  @override
  final String? category;
  @override
  final String? cv;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, description: $description, number: $number, profilepic: $profilepic, links: $links, date_joined: $date_joined, education: $education, gendre: $gendre, skills: $skills, rating: $rating, internships: $internships, category: $category, cv: $cv)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.profilepic, profilepic) ||
                other.profilepic == profilepic) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.date_joined, date_joined) ||
                other.date_joined == date_joined) &&
            const DeepCollectionEquality()
                .equals(other._education, _education) &&
            (identical(other.gendre, gendre) || other.gendre == gendre) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._internships, _internships) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.cv, cv) || other.cv == cv));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      description,
      number,
      profilepic,
      links,
      date_joined,
      const DeepCollectionEquality().hash(_education),
      gendre,
      const DeepCollectionEquality().hash(_skills),
      rating,
      const DeepCollectionEquality().hash(_internships),
      category,
      cv);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final int id,
      required final String name,
      required final String email,
      final String? description,
      final String? number,
      final String? profilepic,
      final String? links,
      required final String date_joined,
      final List<Map<String, dynamic>> education,
      required final String gendre,
      final List<String> skills,
      final int? rating,
      final List<Map<String, dynamic>> internships,
      final String? category,
      final String? cv}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get description;
  @override
  String? get number;
  @override
  String? get profilepic;
  @override
  String? get links;
  @override
  String get date_joined;
  @override
  List<Map<String, dynamic>> get education;
  @override
  String get gendre;
  @override
  List<String> get skills;
  @override
  int? get rating;
  @override
  List<Map<String, dynamic>> get internships;
  @override
  String? get category;
  @override
  String? get cv;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
