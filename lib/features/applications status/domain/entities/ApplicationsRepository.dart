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
    return res.fold((l)=>Left(l), (r)=>Right(r.map((e)=>Application.fromModel(e)).toList()));

  }catch(e){
      return Left( Failure("Unknown Error Please Try Again") );
    }  }

}
