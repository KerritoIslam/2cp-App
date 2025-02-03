import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/data/source/remote_data_source.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:dartz/dartz.dart';

class OpportunityRepository{
  final OpportunityRemoteSource remoteSource;

  OpportunityRepository({required this.remoteSource});
 Future<Either<Failure,Opportunity>> getOpportunity(String id)async{
    try{
      final result=await remoteSource.getOpportunityById(id);
      return result.fold((failure)=>left(failure), (opp)=>right(opp.toEntity()));
    }on Failure catch(e){
      return Left(e);
    }
  }
  Future<Either<Failure,List<Opportunity>>>getOpportunitiesPagination(int page ,int limit)async{
    try{
      final result=await remoteSource.getOpportunitiesPagination(page, limit);
      return result.fold((failure)=>left(failure), (oppList)=>right(oppList.map((e) => e.toEntity()).toList()));
    }on Failure catch(e){
      return Left(e);
    } 
  }

  Future<Either<Failure,Company>>getCompany(String id)async{

   try {
       final result=await remoteSource.getCompanyById(id);
      return result.fold((failure)=>left(failure), (company)=>right(company.toEntity()));
      } catch (e) {
       return left(Failure(e.toString())); 
      }
  } 
  Future<Either<Failure,Opportunity>>saveOpportunity(String id)async{
    try{
      final result=await remoteSource.saveOpportunity(id);
      return result.fold((failure)=>left(failure), (opp)=>right(opp.toEntity()));
    }on Failure catch(e){
      return Left(e);
    }
  }
  Future<Either<Failure,Unit>>removeSavedOpportunity(String id)async{
    try{
      final result=await remoteSource.removeSavedOpportunity(id);
      return result.fold((failure)=>left(failure), (unit)=>right(unit));
    }on Failure catch(e){
      return Left(e);
    }
  }
  Future<Either<Failure,List<Opportunity>>>getSavedOpportunities()async{
    try{
      final result=await remoteSource.getSavedOpportunities();
      return result.fold((failure)=>left(failure), (oppList)=>right(oppList.map((e) => e.toEntity()).toList()));
    }on Failure catch(e){
      return Left(e);
    }
  }
  
}
