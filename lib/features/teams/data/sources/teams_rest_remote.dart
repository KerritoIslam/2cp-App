import 'package:app/core/dioservices/dio.dart';
import 'package:app/features/teams/data/models/team_model.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:dio/dio.dart';

class TeamsRestRemote {
  // This class is responsible for making API calls to the remote server
  // to fetch and manage team data. It uses the Dio package for HTTP requests.

  final Dio dio = DioServices.dio;

  TeamsRestRemote();

  Future<List<TeamModel>> fetchTeams(int page , int limit) async {
    try {
      final response = await dio.get('/post/team', queryParameters: {
        'page': page,
        'limit': limit,
      });
      return (response.data as List)
          .map((teamData) => TeamModel.fromJson(teamData))
          .toList();
    } catch (e) {
      throw Exception('Failed to load teams: $e');
    }
  }

  Future<void> createTeam(Team team) async {
    try {
      await dio.post('/teams', data: team.toJson());
    } catch (e) {
      throw Exception('Failed to create team: $e');
    }
  }
}
