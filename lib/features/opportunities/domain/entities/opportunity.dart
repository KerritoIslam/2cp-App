import 'package:app/features/opportunities/data/models/opportunity_model.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';

abstract class Opportunity {
  final String title;
  final Company company;
  final String description;
  final String id;
  final OpportunityStatus status;  
  final String category;
  final List<String> skills;
  Opportunity( {required this.company,required this.category,required this.title, required this.description, required this.id, required this.status, required this.skills,});
 OpportunityModel toModel();
  
}

class Internship extends Opportunity{
   final String duration;
  Internship({required super.category,required super.title, required super.description, required super.id, required super.status, required super.skills,required this.duration, required super.company,});

  @override
  OpportunityModel toModel() {
    return OpportunityModel(duration: duration, type: OpportunityType.internship, company: company.toModel(), id: id, title: title, description: description, category:CategoryMixin.nameToCodeMap[category]??OpportunityCategory.CS, skills: skills);
  }
}

class Problem extends Opportunity{
  Problem({required super.title, required super.description, required super.id, required super.status, required super.skills, required super.category, required super.company});

  @override
  OpportunityModel toModel() {
    return OpportunityModel(company: company.toModel(), id: id, title: title, description: description, category:CategoryMixin.nameToCodeMap[category]??OpportunityCategory.CS, skills: skills, type: OpportunityType.Problem);
  }
}
mixin CategoryMixin {
  // Static constants for category codes
  static const String economics = 'EC';
  static const String computerScience = 'CS';
  static const String engineering = 'EN';
  static const String healthcare = 'HL';
  static const String businessManagement = 'BM';
  static const String law = 'LW';
  static const String education = 'ED';
  static const String artsHumanities = 'AH';

  // Static list of choices (code and display name pairs)
  static const Map<String, String> choices = {
    'EC': 'Economics',
    'CS': 'Computer Science & IT',
    'EN': 'Engineering',
    'HL': 'Healthcare',
    'BM': 'Business & Management',
    'LW': 'Law',
    'ED': 'Education',
    'AH': 'Arts & Humanities',
  };
    static const Map<String, OpportunityCategory> nameToCodeMap = {
    'Economics':OpportunityCategory.EC, 
    'Computer Science & IT': OpportunityCategory.CS,
    'Engineering': OpportunityCategory.EG,
    'Healthcare': OpportunityCategory.HL,
    'Business & Management': OpportunityCategory.BM,
    'Law': OpportunityCategory.LW,
    'Education': OpportunityCategory.ED,
    'Arts & Humanities': OpportunityCategory.AH,
  };}


