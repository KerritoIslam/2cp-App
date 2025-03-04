import 'package:app/features/applications%20status/constants/status.dart';
import 'package:app/features/applications%20status/data/models/application_model.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:equatable/equatable.dart';

class Application extends Equatable {
 final String id;
 final  String proposal;
  final ApplicationStatus status;
  final Company company;
  final Opportunity opportunity;
  const Application( {required this.id, required this.proposal,required this.status,required this.company,required this.opportunity,});
  @override
  List<Object?> get props => [];

  factory Application.fromModel(ApplicationModel model){
    return Application(id: model.id, proposal: model.proposal, status: model.status, company: model.company.toEntity(), opportunity: model.post.toEntity());
  }
  ApplicationModel toModel(){
 return ApplicationModel(id: id, proposal: proposal, post: opportunity.toModel(), company: company.toModel(), sumbittedAt:DateTime.now(), type:"NONE") ;
  }
}
