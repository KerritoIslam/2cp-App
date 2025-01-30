// ignore_for_file: constant_identifier_names
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';

class OpportunityModel {
   final String id;
   final String title;
  final String description;
  final List<String> skills;
  final CompanyModel company;
  final OpportunityStatus status;
  final OpportunityType type;   
  String? duration;
  OpportunityCategory category;
  OpportunityModel( {this.duration,required this.type,required this.company,required this.id, required this.title, required this.description, required this.category,required this.skills,this.status=OpportunityStatus.ongoing});
  Opportunity toEntity(){
    switch (type) {
      case OpportunityType.internship:
        return Internship(id: id, title: title, description: description, category:CategoryMixin.choices[category.name]??"None" , status: status, skills:skills, duration: '', company:company.toEntity() );
      case OpportunityType.Problem:
        return Problem(id: id, title: title, description: description, category: CategoryMixin.choices[category.name]??"None" , status: status, skills: skills, company: company.toEntity());
    }
  }
 factory OpportunityModel.fromEntity(Opportunity opportunity){
    return opportunity.toModel();  
  }
}
enum OpportunityStatus{
  pending,
  ended, 
  ongoing
  }
enum OpportunityType{
 internship,
 Problem
}
enum OpportunityCategory{
 EC,
 CS,
 EG,
 AH,
 HL,
 BM,
 LW,
ED,
None
}
class CompanyModel{
 String id;
  String name;
  OpportunityCategory category;
  String imageUrl;
  CompanyModel({required this.id, required this.name,required this.category,required this.imageUrl});
  Company toEntity(){
    return Company(id: id, name: name, category:"Computer" , imageUrl: imageUrl);
  }
  factory CompanyModel.fromEntity(Company company){
    return CompanyModel(id: company.id, name: company.name, category:CategoryMixin.nameToCodeMap[company.category]??OpportunityCategory.None, imageUrl: company.imageUrl);
  }
}
