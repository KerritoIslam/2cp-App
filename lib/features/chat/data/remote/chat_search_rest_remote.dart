import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/chat/domain/models/chat_model.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChatSearchRemote {
  final Dio dio = DioServices.dio;

  ChatSearchRemote();

  Future<Either<Failure, List<CompanyModel>>> searchCompanies(
      String? query, int page, int limit) async {
    try {
      final response = await dio.get('post/user/search', queryParameters: {
        'username': query,
        'page': page,
        'limit': limit,
        'type': 'Company'
      });

      if (response.statusCode == 200) {
        final companies = (response.data['results'] as List)
            .map((company) => CompanyModel.fromJson(company))
            .toList();

        return right(companies);
      } else if (response.statusCode == 404) {
        return right([]);
      } else {
        return left(
            Failure('Failed to load companies: ${response.statusCode}'));
      }
    } catch (e) {
      return left(Failure('Failed to load companies: $e'));
    }
  }

  Future<Either<Failure, ChatModel>> createChat(int userId) async {
    try {
      final response = await dio.post('chat/', queryParameters: {
        'user_id': userId,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(ChatModel.fromJson(response.data['chat']));
      } else {
        return left(Failure('Failed to create chat: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to create chat: ${e.response?.data}'));
    } catch (e) {
      return left(Failure('Failed to create chat: $e'));
    }
  }
}
