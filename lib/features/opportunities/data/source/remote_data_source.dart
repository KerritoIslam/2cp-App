import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:app/features/opportunities/data/models/opportunity_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

//Note that this will be removed once the backend is ready
class OpportunityRemoteSource {
//TODO do Error Handling based on the response status code
  final dio = DioServices.dio;
  Future<Either<Failure, List<OpportunityModel>>> getOpportunitiesPagination(
      int page, int limit) async {
    try {
      
      final res =
          await dio.get<List<dynamic>>('post/opportunity/', queryParameters: {
        'page': page,
        'limit': limit,
      });
      print(res);
      print(res.data);
      if (res.statusCode == 200) {
        return Right(
            res.data!.map((e) => OpportunityModel.fromJson(e)).toList());
      }
      return Left(Failure("Error: ${res.statusCode}"));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(Failure("Unauthorized"));
      } else if (e.response?.statusCode == 404) {
        return Left(Failure("Not Found"));
      } else if (e.response?.statusCode == 500) {
        return Left(Failure("Server Error"));
      } else {
        print(e);
        return Left(Failure("Unknown Error"));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, OpportunityModel>> getOpportunityById(int id) async {
    try {
      final res=await dio.get('post/opportunity/$id');
      if (res.statusCode == 200) {
        return Right(OpportunityModel.fromJson(res.data));
      }
      return Left(Failure("Error: ${res.statusCode}"));
      
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(Failure("Unauthorized"));
      } else if (e.response?.statusCode == 404) {
        return Left(Failure("Not Found"));
      } else if (e.response?.statusCode == 500) {
        return Left(Failure("Server Error"));
      } else {
        print(e);
        return Left(Failure("Unknown Error"));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, CompanyModel>> getCompanyById(int id) async {
    try {
      final res=await dio.get('post/company/$id');
      if (res.statusCode == 200) {
        return Right(CompanyModel.fromJson(res.data));
      }
      return Left(Failure("Error: ${res.statusCode}"));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(Failure("Unauthorized"));
      } else if (e.response?.statusCode == 404) {
        return Left(Failure("Not Found"));
      } else if (e.response?.statusCode == 500) {
        return Left(Failure("Server Error"));
      } else {
        print(e);
        return Left(Failure("Unknown Error"));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, OpportunityModel>> saveOpportunity(int id) async {
    try {
      final res=await dio.post('Auth/post/$id/');
      if (res.statusCode == 200) {
        return Right(OpportunityModel.fromJson(res.data));
      }
      return Left(Failure("Error: ${res.statusCode}"));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Unit>> removeSavedOpportunity(int id) async {
    try {
      final res=await dio.delete('Auth/post/$id');
      if (res.statusCode == 200) {
        return Right(unit);
      }
      return Left(Failure("Error: ${res.statusCode}"));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, List<OpportunityModel>>>
      getSavedOpportunities() async {
    try {
      final res = await dio.get<List<dynamic>>('Auth/post');
      if (res.statusCode == 200) {
        return Right(
            res.data!.map((e) => OpportunityModel.fromJson(e)).toList());
      }
      return Left(Failure("Error: ${res.statusCode}"));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(Failure("Unauthorized"));
      } else if (e.response?.statusCode == 404) {
        return Left(Failure("Not Found"));
      } else if (e.response?.statusCode == 500) {
        return Left(Failure("Server Error"));
      } else {
        print(e);
        return Left(Failure("Unknown Error"));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
