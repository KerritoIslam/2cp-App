import 'package:app/features/Search/domain/entities/SearchResultEntitiy.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:app/features/opportunities/data/models/opportunity_model.dart';

class SearchResultModel {
  final List<OpportunityModel> opportunities;
  final List<CompanyModel> companies;

  SearchResultModel({required this.opportunities, required this.companies});
  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      opportunities: List<OpportunityModel>.from(
          json['opportunities'].map((x) => OpportunityModel.fromJson(x))),
      companies: List<CompanyModel>.from(
          json['companies'].map((x) => CompanyModel.fromJson(x))),
    );
  }
  SearchResult toEntity(){
    return SearchResult(opportunities: opportunities.map((e) => e.toEntity()).toList(), companies: companies.map((e) => e.toEntity()).toList());
  }
}
