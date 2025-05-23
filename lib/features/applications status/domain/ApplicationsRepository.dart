import 'dart:io';

import 'package:app/core/failure/failure.dart';
import 'package:app/features/applications%20status/data/remote/remote_data_source.dart';
import 'package:app/features/applications%20status/domain/entities/application.dart';
import 'package:dartz/dartz.dart';

class Applicationsrepository {
  final RemoteDataSource remoteDataSource;

  Applicationsrepository(this.remoteDataSource);
  Future<Either<Failure,List<Application>>>getApplications()async{
try  {     

    final res=await remoteDataSource.getCurrentApplications();
    return res.fold((l)=>Left(l), (r){
final map= r.map((e) => e.toJson()).toList();
        print('repo');
        print(map);
        return Right( 
     r.map((e){
      return Application.fromModel(e);}).toList()
    );});

    
  }catch(e){

    return Left(Failure('Unknown Error'));
    }  }
  Future<Either<Failure,Unit>>submitApplication(Application application,File? attachement, int? teamId)async{
    try {
         return await remoteDataSource.submitApplication(application.toModel(),attachement ,teamId) ;
        } catch (e) {
          
      return Left(Failure('Unknown Error'));
        }

  }
  //TODO:go back to this once team feature is impl
  Future<Either<Failure,Unit>>submitTeamApplication(Application application,dynamic team)async{
    return Right(unit);
  }
  Future<Either<Failure,Unit>>deleteApplication(int id)async{
    return await remoteDataSource.deleteApplication(id);
  }
}
