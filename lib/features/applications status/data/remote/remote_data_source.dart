import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/applications%20status/constants/mockData.dart';
import 'package:app/features/applications%20status/data/models/application_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final dio=DioServices.dio;
  Future <Either<Failure,Unit>>deleteApplication(String id) async {
    // some code to get data from remote
    try {
      await Future.delayed(Duration(seconds: 2));

    return Right(unit);
        } catch (e) {
         return Left(Failure(e.toString()));  
        }
  }
  Future<Either<Failure,List<ApplicationModel>>> getCurrentApplications() async {
    // some code to get data from remote
    try {
          
         await Future.delayed(Duration(seconds: 2)); 
    return Right(ApplicationStatics.applications.map((e) => ApplicationModel.fromJson(e)).toList());
        } catch (e) {
         return Left(Failure(e.toString()));  
        }
  }
  Future<Either<Failure,Unit>>submitApplication(ApplicationModel application) async {
    // some code to get data from remote
    try {
      final res=await dio.post('app/application/${application.id}/',data: application.toJson());
      if (res.statusCode==200){
      return Right(unit);
      }
      return Left(Failure('Unknown Error'));
    } on DioException catch (e) {
      if (e.response?.statusCode==400){
        return Left(Failure('Bad Request'));}
      else if (e.response?.statusCode==401){
        return Left(Failure('Unauthorized'));
        }
    else if (e.response?.statusCode==403){
      return Left(Failure('Forbidden'));}
      else if (e.response?.statusCode==404){
        return Left(Failure(' Opportunity Not Found'));}
      else if (e.response?.statusCode==500){
        return Left(Failure('Internal Server Error'));}
      else {
        return Left(Failure('Unknown Error'));
    }
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
