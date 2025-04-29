import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/chat/domain/models/chat_message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChatRemoteDataSource {
  final Dio _dio = DioServices.dio;

  Future<Either<Failure, List<ChatMessageModel>>> getChatMessages(
    String roomName, {
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _dio.get('chat/messages', queryParameters: {
        'page': page,
        'limit': limit,
        'room_name': roomName,
      });
      final List<dynamic> data = response.data['results']['messages'];
      return right(
          data.map((json) => ChatMessageModel.fromJson(json)).toList());
    } on DioException catch (e) {
      return left(Failure(e.message ?? 'Failed to fetch chat messages'));
    } catch (e) {
      return left(Failure('Failed to fetch chat messages $e'));
    }
  }
}
