import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:equatable/equatable.dart';

class SearchResult extends Equatable{

  final List<Opportunity> opportunities;
  final List<Company> companies;

  const SearchResult({required this.opportunities, required this.companies});

  @override
  List<Object?> get props => [opportunities, companies];

}

