import 'dart:convert';
import 'dart:io';

import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/applications%20status/data/models/application_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class beResponse{
 final List<Map<String,dynamic>> application;



  beResponse({required this.application});
  factory beResponse.fromJson(Map<String,dynamic> json){
    return beResponse(
      application: List<Map<String,dynamic>>.from(json['application'])
    );
  }
}
class RemoteDataSource {

  final dio=DioServices.dio;

List<Map<String, dynamic>> stupidParser(Map<String, dynamic> json) {
  final Map<String, dynamic> data =json;
  
  final List<Map<String, dynamic>> posts = List<Map<String, dynamic>>.from(data['post']);
  final List<Map<String, dynamic>> applications = List<Map<String, dynamic>>.from(data['application']);
  
  return applications.asMap().entries.map((entry) {
    final int index = entry.key;
    final Map<String, dynamic> app = Map<String, dynamic>.from(entry.value);
    // Match post by index; use null if no post exists at this index
    final Map<String, dynamic>? matchingPost = index < posts.length ? posts[index] : null;
    app['post'] = matchingPost;
    return app;
  }).toList();
} Future <Either<Failure,Unit>>deleteApplication(int id) async {
    // some code to get data from remote
    try {
      final res=await dio.delete('app/applications/$id/');
      if (res.statusCode==200){
      return Right(unit);
      }
      return Left(Failure('Unknown Error'));

        }on DioException catch (e) {
      if (e.response?.statusCode==400){
        return Left(Failure('Bad Request'));}
      else if (e.response?.statusCode==401){
        return Left(Failure('Unauthorized'));
        }
      else if (e.response?.statusCode==403){
        return Left(Failure('Forbidden'));}
      else if (e.response?.statusCode==404){
        return Left(Failure(' Application Not Found'));}
      else if (e.response?.statusCode==500){
        return Left(Failure('Internal Server Error'));}
      else {
        return Left(Failure('Unknown Error')); 
      }

    }catch (e) {
         return Left(Failure(e.toString()));  
        }
  }
  Future<Either<Failure,List<ApplicationModel>>> getCurrentApplications() async {
    // some code to get data from remote
    try {
          
      final res=await dio.get<Map<String,dynamic>>('app/application');
      final data=beResponse.fromJson(res.data!).application;
      if (res.statusCode==200){
      final List<ApplicationModel> map=data.map((e) => ApplicationModel.fromJson(e)).toList();
      print(map);
      return Right(map);
      }
      return Left(Failure('Unknown Error'));

      } catch (e,stk) {
      print(stk.toString());

         return Left(Failure(e.toString()));  
        }
  }
  Future<Either<Failure,Unit>>submitApplication(ApplicationModel application,File? attachement) async {
    // some code to get data from remote
    try {
      final applicatinoToJson=application.toJson();
      final body=FormData.fromMap(applicatinoToJson);
      if (attachement!=null){
String fileName = attachement.path.split('/').last;
      body.files.add(MapEntry('attechment', MultipartFile.fromFileSync(attachement.path,filename: fileName)));

      }
          final res=await dio.post('app/application/${application.post.id}/',data: body);
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
