import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/features/opportunities/domain/entities/opportunity_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opportunity_model.freezed.dart';
part 'opportunity_model.g.dart';

@freezed
sealed class OpportunityModel with _$OpportunityModel {
  const OpportunityModel._();
  @FreezedUnionValue('internship')
  const factory OpportunityModel.internship({
    required int id,
    required String title,
    required String description,
    @Default([]) List<String> skills,
    required CompanyModel company,
    @Default(OpportunityStatus.open) OpportunityStatus status,
    @Default("") String duration,
    required OpportunityCategory category,
  }) = InternshipModel;

  @FreezedUnionValue('Problem')
  const factory OpportunityModel.problem({
    required int id,
    required String title,
    required String description,
    @Default([]) List<String> skills,
    required CompanyModel company,
    @Default(OpportunityStatus.open) OpportunityStatus status,
    required OpportunityCategory category,
  }) = ProblemModel;
  @override
  factory OpportunityModel.fromJson(Map<String, dynamic> json) =>
      _$OpportunityModelFromJson(
          {...json, 'runtimeType': json['Type'], });

  Opportunity toEntity() {
    return map(
      internship: (model) => Internship(
        id: model.id,
        title: model.title,
        description: model.description,
        skills: model.skills,
        company: model.company.toEntity(),
        status: model.status,
        duration: model.duration,
        category: model.category.name,
        applicantsAvatars: [],
        totalApplications: 10,
      ),
      problem: (model) => Problem(
        id: model.id,
        title: model.title,
        description: model.description,
        skills: model.skills,
        company: model.company.toEntity(),
        status: model.status,
        category: model.category.name,
        totalApplications: 10,
        applicantsAvatars: [],
      ),
    );
  }
}
