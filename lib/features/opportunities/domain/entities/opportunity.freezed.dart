// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Opportunity _$OpportunityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'internship':
      return Internship.fromJson(json);
    case 'problem':
      return Problem.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Opportunity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Opportunity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  Company get company => throw _privateConstructorUsedError;
  OpportunityStatus get status => throw _privateConstructorUsedError;
  List<String> get applicantsAvatars => throw _privateConstructorUsedError;
  int get totalApplications => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String title,
            String description,
            List<String> skills,
            Company company,
            OpportunityStatus status,
            String duration,
            List<String> applicantsAvatars,
            int totalApplications,
            String category)
        internship,
    required TResult Function(
            int id,
            String title,
            String description,
            int totalApplications,
            List<String> skills,
            List<String> applicantsAvatars,
            Company company,
            OpportunityStatus status,
            String category)
        problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String title,
            String description,
            List<String> skills,
            Company company,
            OpportunityStatus status,
            String duration,
            List<String> applicantsAvatars,
            int totalApplications,
            String category)?
        internship,
    TResult? Function(
            int id,
            String title,
            String description,
            int totalApplications,
            List<String> skills,
            List<String> applicantsAvatars,
            Company company,
            OpportunityStatus status,
            String category)?
        problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String title,
            String description,
            List<String> skills,
            Company company,
            OpportunityStatus status,
            String duration,
            List<String> applicantsAvatars,
            int totalApplications,
            String category)?
        internship,
    TResult Function(
            int id,
            String title,
            String description,
            int totalApplications,
            List<String> skills,
            List<String> applicantsAvatars,
            Company company,
            OpportunityStatus status,
            String category)?
        problem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Internship value) internship,
    required TResult Function(Problem value) problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Internship value)? internship,
    TResult? Function(Problem value)? problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Internship value)? internship,
    TResult Function(Problem value)? problem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this Opportunity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunityCopyWith<Opportunity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunityCopyWith<$Res> {
  factory $OpportunityCopyWith(
          Opportunity value, $Res Function(Opportunity) then) =
      _$OpportunityCopyWithImpl<$Res, Opportunity>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      List<String> skills,
      Company company,
      OpportunityStatus status,
      List<String> applicantsAvatars,
      int totalApplications,
      String category});

  $CompanyCopyWith<$Res> get company;
}

/// @nodoc
class _$OpportunityCopyWithImpl<$Res, $Val extends Opportunity>
    implements $OpportunityCopyWith<$Res> {
  _$OpportunityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Opportunity
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
    Object? applicantsAvatars = null,
    Object? totalApplications = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
              as Company,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OpportunityStatus,
      applicantsAvatars: null == applicantsAvatars
          ? _value.applicantsAvatars
          : applicantsAvatars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalApplications: null == totalApplications
          ? _value.totalApplications
          : totalApplications // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<$Res> get company {
    return $CompanyCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InternshipImplCopyWith<$Res>
    implements $OpportunityCopyWith<$Res> {
  factory _$$InternshipImplCopyWith(
          _$InternshipImpl value, $Res Function(_$InternshipImpl) then) =
      __$$InternshipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      List<String> skills,
      Company company,
      OpportunityStatus status,
      String duration,
      List<String> applicantsAvatars,
      int totalApplications,
      String category});

  @override
  $CompanyCopyWith<$Res> get company;
}

/// @nodoc
class __$$InternshipImplCopyWithImpl<$Res>
    extends _$OpportunityCopyWithImpl<$Res, _$InternshipImpl>
    implements _$$InternshipImplCopyWith<$Res> {
  __$$InternshipImplCopyWithImpl(
      _$InternshipImpl _value, $Res Function(_$InternshipImpl) _then)
      : super(_value, _then);

  /// Create a copy of Opportunity
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
    Object? applicantsAvatars = null,
    Object? totalApplications = null,
    Object? category = null,
  }) {
    return _then(_$InternshipImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
              as Company,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OpportunityStatus,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      applicantsAvatars: null == applicantsAvatars
          ? _value._applicantsAvatars
          : applicantsAvatars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalApplications: null == totalApplications
          ? _value.totalApplications
          : totalApplications // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InternshipImpl extends Internship {
  const _$InternshipImpl(
      {required this.id,
      required this.title,
      required this.description,
      required final List<String> skills,
      required this.company,
      this.status = OpportunityStatus.open,
      required this.duration,
      required final List<String> applicantsAvatars,
      required this.totalApplications,
      required this.category,
      final String? $type})
      : _skills = skills,
        _applicantsAvatars = applicantsAvatars,
        $type = $type ?? 'internship',
        super._();

  factory _$InternshipImpl.fromJson(Map<String, dynamic> json) =>
      _$$InternshipImplFromJson(json);

  @override
  final int id;
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
  final Company company;
  @override
  @JsonKey()
  final OpportunityStatus status;
  @override
  final String duration;
  final List<String> _applicantsAvatars;
  @override
  List<String> get applicantsAvatars {
    if (_applicantsAvatars is EqualUnmodifiableListView)
      return _applicantsAvatars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicantsAvatars);
  }

  @override
  final int totalApplications;
  @override
  final String category;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Opportunity.internship(id: $id, title: $title, description: $description, skills: $skills, company: $company, status: $status, duration: $duration, applicantsAvatars: $applicantsAvatars, totalApplications: $totalApplications, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternshipImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other._applicantsAvatars, _applicantsAvatars) &&
            (identical(other.totalApplications, totalApplications) ||
                other.totalApplications == totalApplications) &&
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
      const DeepCollectionEquality().hash(_applicantsAvatars),
      totalApplications,
      category);

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InternshipImplCopyWith<_$InternshipImpl> get copyWith =>
      __$$InternshipImplCopyWithImpl<_$InternshipImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String title,
            String description,
            List<String> skills,
            Company company,
            OpportunityStatus status,
            String duration,
            List<String> applicantsAvatars,
            int totalApplications,
            String category)
        internship,
    required TResult Function(
            int id,
            String title,
            String description,
            int totalApplications,
            List<String> skills,
            List<String> applicantsAvatars,
            Company company,
            OpportunityStatus status,
            String category)
        problem,
  }) {
    return internship(id, title, description, skills, company, status, duration,
        applicantsAvatars, totalApplications, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String title,
            String description,
            List<String> skills,
            Company company,
            OpportunityStatus status,
            String duration,
            List<String> applicantsAvatars,
            int totalApplications,
            String category)?
        internship,
    TResult? Function(
            int id,
            String title,
            String description,
            int totalApplications,
            List<String> skills,
            List<String> applicantsAvatars,
            Company company,
            OpportunityStatus status,
            String category)?
        problem,
  }) {
    return internship?.call(id, title, description, skills, company, status,
        duration, applicantsAvatars, totalApplications, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String title,
            String description,
            List<String> skills,
            Company company,
            OpportunityStatus status,
            String duration,
            List<String> applicantsAvatars,
            int totalApplications,
            String category)?
        internship,
    TResult Function(
            int id,
            String title,
            String description,
            int totalApplications,
            List<String> skills,
            List<String> applicantsAvatars,
            Company company,
            OpportunityStatus status,
            String category)?
        problem,
    required TResult orElse(),
  }) {
    if (internship != null) {
      return internship(id, title, description, skills, company, status,
          duration, applicantsAvatars, totalApplications, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Internship value) internship,
    required TResult Function(Problem value) problem,
  }) {
    return internship(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Internship value)? internship,
    TResult? Function(Problem value)? problem,
  }) {
    return internship?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Internship value)? internship,
    TResult Function(Problem value)? problem,
    required TResult orElse(),
  }) {
    if (internship != null) {
      return internship(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InternshipImplToJson(
      this,
    );
  }
}

abstract class Internship extends Opportunity {
  const factory Internship(
      {required final int id,
      required final String title,
      required final String description,
      required final List<String> skills,
      required final Company company,
      final OpportunityStatus status,
      required final String duration,
      required final List<String> applicantsAvatars,
      required final int totalApplications,
      required final String category}) = _$InternshipImpl;
  const Internship._() : super._();

  factory Internship.fromJson(Map<String, dynamic> json) =
      _$InternshipImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get skills;
  @override
  Company get company;
  @override
  OpportunityStatus get status;
  String get duration;
  @override
  List<String> get applicantsAvatars;
  @override
  int get totalApplications;
  @override
  String get category;

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InternshipImplCopyWith<_$InternshipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProblemImplCopyWith<$Res>
    implements $OpportunityCopyWith<$Res> {
  factory _$$ProblemImplCopyWith(
          _$ProblemImpl value, $Res Function(_$ProblemImpl) then) =
      __$$ProblemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      int totalApplications,
      List<String> skills,
      List<String> applicantsAvatars,
      Company company,
      OpportunityStatus status,
      String category});

  @override
  $CompanyCopyWith<$Res> get company;
}

/// @nodoc
class __$$ProblemImplCopyWithImpl<$Res>
    extends _$OpportunityCopyWithImpl<$Res, _$ProblemImpl>
    implements _$$ProblemImplCopyWith<$Res> {
  __$$ProblemImplCopyWithImpl(
      _$ProblemImpl _value, $Res Function(_$ProblemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? totalApplications = null,
    Object? skills = null,
    Object? applicantsAvatars = null,
    Object? company = null,
    Object? status = null,
    Object? category = null,
  }) {
    return _then(_$ProblemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalApplications: null == totalApplications
          ? _value.totalApplications
          : totalApplications // ignore: cast_nullable_to_non_nullable
              as int,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      applicantsAvatars: null == applicantsAvatars
          ? _value._applicantsAvatars
          : applicantsAvatars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OpportunityStatus,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProblemImpl extends Problem {
  const _$ProblemImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.totalApplications,
      required final List<String> skills,
      required final List<String> applicantsAvatars,
      required this.company,
      this.status = OpportunityStatus.open,
      required this.category,
      final String? $type})
      : _skills = skills,
        _applicantsAvatars = applicantsAvatars,
        $type = $type ?? 'problem',
        super._();

  factory _$ProblemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int totalApplications;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  final List<String> _applicantsAvatars;
  @override
  List<String> get applicantsAvatars {
    if (_applicantsAvatars is EqualUnmodifiableListView)
      return _applicantsAvatars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicantsAvatars);
  }

  @override
  final Company company;
  @override
  @JsonKey()
  final OpportunityStatus status;
  @override
  final String category;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Opportunity.problem(id: $id, title: $title, description: $description, totalApplications: $totalApplications, skills: $skills, applicantsAvatars: $applicantsAvatars, company: $company, status: $status, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalApplications, totalApplications) ||
                other.totalApplications == totalApplications) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._applicantsAvatars, _applicantsAvatars) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.status, status) || other.status == status) &&
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
      totalApplications,
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_applicantsAvatars),
      company,
      status,
      category);

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemImplCopyWith<_$ProblemImpl> get copyWith =>
      __$$ProblemImplCopyWithImpl<_$ProblemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String title,
            String description,
            List<String> skills,
            Company company,
            OpportunityStatus status,
            String duration,
            List<String> applicantsAvatars,
            int totalApplications,
            String category)
        internship,
    required TResult Function(
            int id,
            String title,
            String description,
            int totalApplications,
            List<String> skills,
            List<String> applicantsAvatars,
            Company company,
            OpportunityStatus status,
            String category)
        problem,
  }) {
    return problem(id, title, description, totalApplications, skills,
        applicantsAvatars, company, status, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String title,
            String description,
            List<String> skills,
            Company company,
            OpportunityStatus status,
            String duration,
            List<String> applicantsAvatars,
            int totalApplications,
            String category)?
        internship,
    TResult? Function(
            int id,
            String title,
            String description,
            int totalApplications,
            List<String> skills,
            List<String> applicantsAvatars,
            Company company,
            OpportunityStatus status,
            String category)?
        problem,
  }) {
    return problem?.call(id, title, description, totalApplications, skills,
        applicantsAvatars, company, status, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String title,
            String description,
            List<String> skills,
            Company company,
            OpportunityStatus status,
            String duration,
            List<String> applicantsAvatars,
            int totalApplications,
            String category)?
        internship,
    TResult Function(
            int id,
            String title,
            String description,
            int totalApplications,
            List<String> skills,
            List<String> applicantsAvatars,
            Company company,
            OpportunityStatus status,
            String category)?
        problem,
    required TResult orElse(),
  }) {
    if (problem != null) {
      return problem(id, title, description, totalApplications, skills,
          applicantsAvatars, company, status, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Internship value) internship,
    required TResult Function(Problem value) problem,
  }) {
    return problem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Internship value)? internship,
    TResult? Function(Problem value)? problem,
  }) {
    return problem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Internship value)? internship,
    TResult Function(Problem value)? problem,
    required TResult orElse(),
  }) {
    if (problem != null) {
      return problem(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProblemImplToJson(
      this,
    );
  }
}

abstract class Problem extends Opportunity {
  const factory Problem(
      {required final int id,
      required final String title,
      required final String description,
      required final int totalApplications,
      required final List<String> skills,
      required final List<String> applicantsAvatars,
      required final Company company,
      final OpportunityStatus status,
      required final String category}) = _$ProblemImpl;
  const Problem._() : super._();

  factory Problem.fromJson(Map<String, dynamic> json) = _$ProblemImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  int get totalApplications;
  @override
  List<String> get skills;
  @override
  List<String> get applicantsAvatars;
  @override
  Company get company;
  @override
  OpportunityStatus get status;
  @override
  String get category;

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProblemImplCopyWith<_$ProblemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
