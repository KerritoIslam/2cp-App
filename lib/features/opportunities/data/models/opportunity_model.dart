import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:app/features/opportunities/domain/entities/opportunity_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opportunity_model.freezed.dart';
part 'opportunity_model.g.dart';

@freezed
sealed class OpportunityModel with _$OpportunityModel {
  const OpportunityModel._();

  const factory OpportunityModel.internship({
    required String id,
    required String title,
    required String description,
    required List<String> skills,
    required CompanyModel company,
    @Default(OpportunityStatus.ongoing) OpportunityStatus status,
    required String duration,
    required OpportunityCategory category,
  }) = InternshipModel;

  const factory OpportunityModel.problem({
    required String id,
    required String title,
    required String description,
    required List<String> skills,
    required CompanyModel company,
    @Default(OpportunityStatus.ongoing) OpportunityStatus status,
    required OpportunityCategory category,
  }) = ProblemModel;

  factory OpportunityModel.fromJson(Map<String, dynamic> json) =>
      _$OpportunityModelFromJson(json);
}
