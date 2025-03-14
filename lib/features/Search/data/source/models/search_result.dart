import 'package:app/features/Search/domain/entities/SearchResultEntitiy.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:app/features/opportunities/data/models/opportunity_model.dart';

class SearchResultModel {
  final List<OpportunityModel> opportunity;
  final List<CompanyModel> company;

  SearchResultModel({required this.opportunity, required this.company});
  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      opportunity: List<OpportunityModel>.from(
          json['opportunity'].map((x) => OpportunityModel.fromJson(x))),
      company: List<CompanyModel>.from(
          json['company'].map((x) => CompanyModel.fromJson(x))),
    );
  }
  SearchResult toEntity(){
    return SearchResult(opportunities: opportunity.map((e) => e.toEntity()).toList(), companies: company.map((e) => e.toEntity()).toList());
  }
}
