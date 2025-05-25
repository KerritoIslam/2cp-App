import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRemoteDataSource {
  final Dio _dio = DioServices.dio;
  Future<Either<Failure, Company>> getProfile(int id) async {
    try {
      final response = await _dio.get('Auth/user/$id/');
      print(response.data);
      if (response.statusCode == 200) {
        return right(Company.fromJson(response.data));
      } else {
        return left(Failure(response.statusMessage ?? 'Unknown error'));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, List<Opportunity>>> getOpportunities(
      int id, int page, int limit) async {
    try {
      final response =
          await _dio.get('post/opportunity/company/$id', queryParameters: {
        'page': page,
        'limit': limit,
      });
      if (response.statusCode == 200) {
        return right((response.data['results'] as List)
            .map((e) => Opportunity.fromJson(e))
            .toList());
      } else {
        return left(Failure(response.statusMessage ?? 'Unknown error'));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return right([]);
      }
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
