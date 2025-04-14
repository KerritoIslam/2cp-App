import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/opportunity_model.dart'; // Fixed import path
import 'opportunity_constants.dart'; // Shared enums

part 'opportunity.freezed.dart';
part 'opportunity.g.dart';

@freezed
sealed class Opportunity with _$Opportunity {
  const Opportunity._();

  @FreezedUnionValue('internship')
  const factory Opportunity.internship({
    required int id,
    required String title,
    required String description,
    required List<String> skills,
    required Company company,
    @Default(OpportunityStatus.open) OpportunityStatus status,
    required String duration,
    required List<String> applicantsAvatars,
    required int totalApplications,
    required String category,
  }) = Internship;


  @FreezedUnionValue('problem')
  const factory Opportunity.problem({
    required int id,
    required String title,
    required String description,
    required int totalApplications,
    required List<String> skills,
    required List<String> applicantsAvatars,

    required Company company,
    @Default(OpportunityStatus.open) OpportunityStatus status,
    required String category,
  }) = Problem;

  factory Opportunity.fromJson(Map<String, dynamic> json) =>
      _$OpportunityFromJson(json);

  OpportunityModel toModel() {
    return map(
      internship: (entity) => OpportunityModel.internship(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        skills: entity.skills,
        company: entity.company.toModel(),
        status: entity.status,
        duration: entity.duration,
        category: CategoryMixin.nameToCodeMap[entity.category] ??
            OpportunityCategory.None,
      ),
      problem: (entity) => OpportunityModel.problem(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        skills: entity.skills,
        company: entity.company.toModel(),
        status: entity.status,
        category: CategoryMixin.nameToCodeMap[entity.category] ??
            OpportunityCategory.None,
      ),
    );
  }
}

