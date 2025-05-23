// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get profilepic => throw _privateConstructorUsedError;
  String get date_joined => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get education =>
      throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get experience =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get cv => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? description,
      Map<String, dynamic> profilepic,
      String date_joined,
      List<Map<String, dynamic>> education,
      List<String> skills,
      List<Map<String, dynamic>> experience,
      Map<String, dynamic> cv});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? description = freezed,
    Object? profilepic = null,
    Object? date_joined = null,
    Object? education = null,
    Object? skills = null,
    Object? experience = null,
    Object? cv = null,
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
      profilepic: null == profilepic
          ? _value.profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      date_joined: null == date_joined
          ? _value.date_joined
          : date_joined // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      cv: null == cv
          ? _value.cv
          : cv // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? description,
      Map<String, dynamic> profilepic,
      String date_joined,
      List<Map<String, dynamic>> education,
      List<String> skills,
      List<Map<String, dynamic>> experience,
      Map<String, dynamic> cv});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? description = freezed,
    Object? profilepic = null,
    Object? date_joined = null,
    Object? education = null,
    Object? skills = null,
    Object? experience = null,
    Object? cv = null,
  }) {
    return _then(_$UserModelImpl(
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
      profilepic: null == profilepic
          ? _value._profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      date_joined: null == date_joined
          ? _value.date_joined
          : date_joined // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value._education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      experience: null == experience
          ? _value._experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      cv: null == cv
          ? _value._cv
          : cv // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.name,
      required this.email,
      this.description = '',
      final Map<String, dynamic> profilepic = const {
        "link": '',
        "name": '',
        "size": 0,
        'created_at': ''
      },
      required this.date_joined,
      final List<Map<String, dynamic>> education = const [],
      final List<String> skills = const [],
      final List<Map<String, dynamic>> experience = const [],
      final Map<String, dynamic> cv = const {
        "link": '',
        "name": '',
        "size": 0,
        'created_at': ''
      }})
      : _profilepic = profilepic,
        _education = education,
        _skills = skills,
        _experience = experience,
        _cv = cv,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey()
  final String? description;
  final Map<String, dynamic> _profilepic;
  @override
  @JsonKey()
  Map<String, dynamic> get profilepic {
    if (_profilepic is EqualUnmodifiableMapView) return _profilepic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_profilepic);
  }

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

  final List<String> _skills;
  @override
  @JsonKey()
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  final List<Map<String, dynamic>> _experience;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get experience {
    if (_experience is EqualUnmodifiableListView) return _experience;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experience);
  }

  final Map<String, dynamic> _cv;
  @override
  @JsonKey()
  Map<String, dynamic> get cv {
    if (_cv is EqualUnmodifiableMapView) return _cv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cv);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, description: $description, profilepic: $profilepic, date_joined: $date_joined, education: $education, skills: $skills, experience: $experience, cv: $cv)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._profilepic, _profilepic) &&
            (identical(other.date_joined, date_joined) ||
                other.date_joined == date_joined) &&
            const DeepCollectionEquality()
                .equals(other._education, _education) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._experience, _experience) &&
            const DeepCollectionEquality().equals(other._cv, _cv));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      description,
      const DeepCollectionEquality().hash(_profilepic),
      date_joined,
      const DeepCollectionEquality().hash(_education),
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_experience),
      const DeepCollectionEquality().hash(_cv));

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final int id,
      required final String name,
      required final String email,
      final String? description,
      final Map<String, dynamic> profilepic,
      required final String date_joined,
      final List<Map<String, dynamic>> education,
      final List<String> skills,
      final List<Map<String, dynamic>> experience,
      final Map<String, dynamic> cv}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get description;
  @override
  Map<String, dynamic> get profilepic;
  @override
  String get date_joined;
  @override
  List<Map<String, dynamic>> get education;
  @override
  List<String> get skills;
  @override
  List<Map<String, dynamic>> get experience;
  @override
  Map<String, dynamic> get cv;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
