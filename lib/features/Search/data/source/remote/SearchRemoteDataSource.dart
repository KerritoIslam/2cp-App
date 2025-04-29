// ignore_for_file: non_constant_identifier_names

import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/Search/data/source/models/search_result.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Searchremotedatasource {
  final dio = DioServices.dio;

  Future<Either<Failure, SearchResultModel>> Search(String query) async {
    try {
      // Mock companies
      //print('searching for $query');

      // Mock opportunities

      //Warning: The following line is just for testing purposes and should be removed in production.
      await Future.delayed(Duration(milliseconds: 500));
      if (query.isEmpty) {
        return Right(SearchResultModel(
          opportunity: [],
          company: [],
        ));
      }
      final res = await dio.get('app/search/', queryParameters: {'q': query});

      print(res.data);

      if (res.statusCode == 200) {
        return Right(SearchResultModel.fromJson(res.data));
      }
      return Left(Failure('Try again'));
      //return Right(SearchResultModel(
      //  opportunities: mockOpportunities,
      //  companies: mockCompanies,
      //));
    } on DioException {
      return Left(Failure('Try again'));
    } catch (e) {
      print("error is $e");
      return Left(Failure('Unkonw error'));
    }
  }
}
