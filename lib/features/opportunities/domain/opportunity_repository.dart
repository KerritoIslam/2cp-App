import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:dartz/dartz.dart';

class OpportunityRepository{
 Future<Either<Failure,Opportunity>> getOpportunity(String id){

  }
  Future<Either<Failure,List<Opportunity>>>getOpportunitiesPagination(int page ,int limit){

  }

  Future<Either<Failure,Company>>getCompany(String id){

  }



  
  
}
