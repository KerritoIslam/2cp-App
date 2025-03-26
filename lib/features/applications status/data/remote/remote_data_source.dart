import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/applications%20status/constants/mockData.dart';
import 'package:app/features/applications%20status/data/models/application_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final dio = DioServices.dio;
  Future<Either<Failure, Unit>> deleteApplication(String id) async {
    // some code to get data from remote
    try {
      await Future.delayed(Duration(seconds: 2));

      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, List<ApplicationModel>>>
      getCurrentApplications() async {
    // some code to get data from remote
    try {
      final FormData formData = FormData();
      await Future.delayed(Duration(seconds: 2));
      ApplicationStatics.applications.forEach((e) {
        print(e['status']);
      });
      return Right(ApplicationStatics.applications
          .map((e) => ApplicationModel.fromJson(e))
          .toList());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Unit>> submitApplication(
      ApplicationModel application) async {
    // some code to get data from remote
    try {
      //NOTE:this is how to upload file use it later
//final MultipartFile file =await MultipartFile.fromFile("home/ahmed/Downloads/1.jpg",filename: "Upload1.jpg");
//      final map={
//       ...application.toJson(),
//      "file": file
//
//    };
//      dio.post('/apply',data: FormData.fromMap(map));

      Future.delayed(Duration(seconds: 2));
      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //TODO:check if user Can update the application
  Future<Either<Failure, Unit>> updateApplication(
      ApplicationModel application) async {
    // some code to get data from remote
    try {
      await Future.delayed(Duration(seconds: 2));
      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
