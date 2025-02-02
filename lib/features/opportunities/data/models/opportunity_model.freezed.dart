// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OpportunityModel _$OpportunityModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'internship':
      return InternshipModel.fromJson(json);
    case 'Problem':
      return ProblemModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OpportunityModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OpportunityModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  CompanyModel get company => throw _privateConstructorUsedError;
  OpportunityStatus get status => throw _privateConstructorUsedError;
  OpportunityCategory get category => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            String duration,
            OpportunityCategory category)
        internship,
    required TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            OpportunityCategory category)
        problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            String duration,
            OpportunityCategory category)?
        internship,
    TResult? Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            OpportunityCategory category)?
        problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            String duration,
            OpportunityCategory category)?
        internship,
    TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            OpportunityCategory category)?
        problem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternshipModel value) internship,
    required TResult Function(ProblemModel value) problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternshipModel value)? internship,
    TResult? Function(ProblemModel value)? problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternshipModel value)? internship,
    TResult Function(ProblemModel value)? problem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this OpportunityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpportunityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunityModelCopyWith<OpportunityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunityModelCopyWith<$Res> {
  factory $OpportunityModelCopyWith(
          OpportunityModel value, $Res Function(OpportunityModel) then) =
      _$OpportunityModelCopyWithImpl<$Res, OpportunityModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      List<String> skills,
      CompanyModel company,
      OpportunityStatus status,
      OpportunityCategory category});

  $CompanyModelCopyWith<$Res> get company;
}

/// @nodoc
class _$OpportunityModelCopyWithImpl<$Res, $Val extends OpportunityModel>
    implements $OpportunityModelCopyWith<$Res> {
  _$OpportunityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpportunityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? skills = null,
    Object? company = null,
    Object? status = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OpportunityStatus,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as OpportunityCategory,
    ) as $Val);
  }

  /// Create a copy of OpportunityModel
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
abstract class _$$InternshipModelImplCopyWith<$Res>
    implements $OpportunityModelCopyWith<$Res> {
  factory _$$InternshipModelImplCopyWith(_$InternshipModelImpl value,
          $Res Function(_$InternshipModelImpl) then) =
      __$$InternshipModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      List<String> skills,
      CompanyModel company,
      OpportunityStatus status,
      String duration,
      OpportunityCategory category});

  @override
  $CompanyModelCopyWith<$Res> get company;
}

/// @nodoc
class __$$InternshipModelImplCopyWithImpl<$Res>
    extends _$OpportunityModelCopyWithImpl<$Res, _$InternshipModelImpl>
    implements _$$InternshipModelImplCopyWith<$Res> {
  __$$InternshipModelImplCopyWithImpl(
      _$InternshipModelImpl _value, $Res Function(_$InternshipModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpportunityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? skills = null,
    Object? company = null,
    Object? status = null,
    Object? duration = null,
    Object? category = null,
  }) {
    return _then(_$InternshipModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OpportunityStatus,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as OpportunityCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InternshipModelImpl extends InternshipModel {
  const _$InternshipModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required final List<String> skills,
      required this.company,
      this.status = OpportunityStatus.ongoing,
      required this.duration,
      required this.category,
      final String? $type})
      : _skills = skills,
        $type = $type ?? 'internship',
        super._();

  factory _$InternshipModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InternshipModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final CompanyModel company;
  @override
  @JsonKey()
  final OpportunityStatus status;
  @override
  final String duration;
  @override
  final OpportunityCategory category;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OpportunityModel.internship(id: $id, title: $title, description: $description, skills: $skills, company: $company, status: $status, duration: $duration, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternshipModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      const DeepCollectionEquality().hash(_skills),
      company,
      status,
      duration,
      category);

  /// Create a copy of OpportunityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InternshipModelImplCopyWith<_$InternshipModelImpl> get copyWith =>
      __$$InternshipModelImplCopyWithImpl<_$InternshipModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            String duration,
            OpportunityCategory category)
        internship,
    required TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            OpportunityCategory category)
        problem,
  }) {
    return internship(
        id, title, description, skills, company, status, duration, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            String duration,
            OpportunityCategory category)?
        internship,
    TResult? Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            OpportunityCategory category)?
        problem,
  }) {
    return internship?.call(
        id, title, description, skills, company, status, duration, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            String duration,
            OpportunityCategory category)?
        internship,
    TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            OpportunityCategory category)?
        problem,
    required TResult orElse(),
  }) {
    if (internship != null) {
      return internship(
          id, title, description, skills, company, status, duration, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternshipModel value) internship,
    required TResult Function(ProblemModel value) problem,
  }) {
    return internship(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternshipModel value)? internship,
    TResult? Function(ProblemModel value)? problem,
  }) {
    return internship?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternshipModel value)? internship,
    TResult Function(ProblemModel value)? problem,
    required TResult orElse(),
  }) {
    if (internship != null) {
      return internship(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InternshipModelImplToJson(
      this,
    );
  }
}

abstract class InternshipModel extends OpportunityModel {
  const factory InternshipModel(
      {required final String id,
      required final String title,
      required final String description,
      required final List<String> skills,
      required final CompanyModel company,
      final OpportunityStatus status,
      required final String duration,
      required final OpportunityCategory category}) = _$InternshipModelImpl;
  const InternshipModel._() : super._();

  factory InternshipModel.fromJson(Map<String, dynamic> json) =
      _$InternshipModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get skills;
  @override
  CompanyModel get company;
  @override
  OpportunityStatus get status;
  String get duration;
  @override
  OpportunityCategory get category;

  /// Create a copy of OpportunityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InternshipModelImplCopyWith<_$InternshipModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProblemModelImplCopyWith<$Res>
    implements $OpportunityModelCopyWith<$Res> {
  factory _$$ProblemModelImplCopyWith(
          _$ProblemModelImpl value, $Res Function(_$ProblemModelImpl) then) =
      __$$ProblemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      List<String> skills,
      CompanyModel company,
      OpportunityStatus status,
      OpportunityCategory category});

  @override
  $CompanyModelCopyWith<$Res> get company;
}

/// @nodoc
class __$$ProblemModelImplCopyWithImpl<$Res>
    extends _$OpportunityModelCopyWithImpl<$Res, _$ProblemModelImpl>
    implements _$$ProblemModelImplCopyWith<$Res> {
  __$$ProblemModelImplCopyWithImpl(
      _$ProblemModelImpl _value, $Res Function(_$ProblemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpportunityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? skills = null,
    Object? company = null,
    Object? status = null,
    Object? category = null,
  }) {
    return _then(_$ProblemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OpportunityStatus,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as OpportunityCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProblemModelImpl extends ProblemModel {
  const _$ProblemModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required final List<String> skills,
      required this.company,
      this.status = OpportunityStatus.ongoing,
      required this.category,
      final String? $type})
      : _skills = skills,
        $type = $type ?? 'problem',
        super._();

  factory _$ProblemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final CompanyModel company;
  @override
  @JsonKey()
  final OpportunityStatus status;
  @override
  final OpportunityCategory category;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OpportunityModel.problem(id: $id, title: $title, description: $description, skills: $skills, company: $company, status: $status, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      const DeepCollectionEquality().hash(_skills), company, status, category);

  /// Create a copy of OpportunityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemModelImplCopyWith<_$ProblemModelImpl> get copyWith =>
      __$$ProblemModelImplCopyWithImpl<_$ProblemModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            String duration,
            OpportunityCategory category)
        internship,
    required TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            OpportunityCategory category)
        problem,
  }) {
    return problem(id, title, description, skills, company, status, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            String duration,
            OpportunityCategory category)?
        internship,
    TResult? Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            OpportunityCategory category)?
        problem,
  }) {
    return problem?.call(
        id, title, description, skills, company, status, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            String duration,
            OpportunityCategory category)?
        internship,
    TResult Function(
            String id,
            String title,
            String description,
            List<String> skills,
            CompanyModel company,
            OpportunityStatus status,
            OpportunityCategory category)?
        problem,
    required TResult orElse(),
  }) {
    if (problem != null) {
      return problem(id, title, description, skills, company, status, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternshipModel value) internship,
    required TResult Function(ProblemModel value) problem,
  }) {
    return problem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternshipModel value)? internship,
    TResult? Function(ProblemModel value)? problem,
  }) {
    return problem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternshipModel value)? internship,
    TResult Function(ProblemModel value)? problem,
    required TResult orElse(),
  }) {
    if (problem != null) {
      return problem(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProblemModelImplToJson(
      this,
    );
  }
}

abstract class ProblemModel extends OpportunityModel {
  const factory ProblemModel(
      {required final String id,
      required final String title,
      required final String description,
      required final List<String> skills,
      required final CompanyModel company,
      final OpportunityStatus status,
      required final OpportunityCategory category}) = _$ProblemModelImpl;
  const ProblemModel._() : super._();

  factory ProblemModel.fromJson(Map<String, dynamic> json) =
      _$ProblemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get skills;
  @override
  CompanyModel get company;
  @override
  OpportunityStatus get status;
  @override
  OpportunityCategory get category;

  /// Create a copy of OpportunityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProblemModelImplCopyWith<_$ProblemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
