import 'package:app/core/failure/failure.dart';
import 'package:app/features/applications%20status/constants/mockData.dart';
import 'package:app/features/applications%20status/data/models/application_model.dart';
import 'package:dartz/dartz.dart';

class RemoteDataSource {
  Future<Either<Failure,List<ApplicationModel>>> getCurrentApplications() async {
    // some code to get data from remote
    try {
         await Future.delayed(Duration(seconds: 2)); 
    return Right(ApplicationStatics.applications.map((e) => ApplicationModel.fromJson(e)).toList());
        } catch (e) {
         return Left(Failure(e.toString()));  
        }
  }
  Future<Either<Failure,ApplicationModel>>submitApplication(ApplicationModel application) async {
    // some code to get data from remote
    try {
          
      Future.delayed(Duration(seconds: 2));
    return Right(application);
        } catch (e) {
         return Left(Failure(e.toString()));  
        }
  }
  Future <Either<Failure,Unit>>deleteApplication(String id) async {
    // some code to get data from remote
    try {
      await Future.delayed(Duration(seconds: 2));

    return Right(unit);
        } catch (e) {
         return Left(Failure(e.toString()));  
        }
  }
  //TODO:check if user Can update the application
  Future <Either<Failure,Unit>>updateApplication(ApplicationModel application) async {
    // some code to get data from remote
    try {
      await Future.delayed(Duration(seconds: 2));
    return Right(unit);
        } catch (e) {
         return Left(Failure(e.toString()));  
        }
  }

}
