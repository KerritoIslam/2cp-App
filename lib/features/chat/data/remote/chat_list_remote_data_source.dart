import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/chat/domain/models/chat_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChatListRemoteDataSource {
  final Dio _dio = DioServices.dio;

  Future<Either<Failure, List<ChatModel>>> getChats(
      {required int page, required int limit}) async {
    try {
      ;
      final response = await _dio.get('chat/', queryParameters: {
        'page': page,
        'limit': limit,
      });

      if (response.data["results"]["chats"] == null) {
        return right([]);
      }
      final List<dynamic> data = response.data["results"]["chats"];
      if (data.isEmpty) {
        
        return right([]);
      }
      
      return right(data.map((json) {
        
        return ChatModel.fromJson(json);
      }).toList());
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return right([]);
      }
      return left(Failure(e.message ?? 'Failed to fetch chats'));
    } catch (e, stackTrace) {
      print(stackTrace);
      return left(Failure(e.toString()));
    }
  }

  Future<void> deleteChat(int chatId) async {
    try {
      await _dio.delete('chat/$chatId');
    } catch (e) {
      throw Exception('Failed to delete chat');
    }
  }
}
