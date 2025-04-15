import 'package:app/core/failure/failure.dart';
import 'package:app/features/applications%20status/data/remote/remote_data_source.dart';
import 'package:app/features/applications%20status/domain/entities/application.dart';
import 'package:dartz/dartz.dart';

class Applicationsrepository {
  final RemoteDataSource remoteDataSource;

  Applicationsrepository(this.remoteDataSource);
  Future<Either<Failure,List<Application>>>getApplications()async{
    
    final res=await remoteDataSource.getCurrentApplications();
    return res.fold((l)=>Left(l), (r)=>Right(r.map((e)=>Application.fromModel(e)).toList()));

  }
  Future<Either<Failure,Unit>>submitApplication(Application application)async{
    try {
         return await remoteDataSource.submitApplication(application.toModel()) ;
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
