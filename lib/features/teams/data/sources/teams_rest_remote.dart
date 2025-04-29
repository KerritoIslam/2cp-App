import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/authentication/data/models/user_model.dart';
import 'package:app/features/teams/data/models/invitation_model.dart';
import 'package:app/features/teams/data/models/team_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TeamsRestRemote {
  // This class is responsible for making API calls to the remote server
  // to fetch and manage team data. It uses the Dio package for HTTP requests.

  final Dio dio = DioServices.dio;

  TeamsRestRemote();

  Future<Either<Failure, List<TeamModel>>> fetchTeams(
      int page, int limit) async {
    try {
      final response = await dio.get('post/team/', queryParameters: {
        'page': page,
        'limit': limit,
      });
      if (response.statusCode == 200) {
        final teams = (response.data['results'] as List)
            .map((team) => TeamModel.fromJson(team))
            .toList();

        return right(teams);
      } else {
        return left(Failure('Failed to load teams: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to load teams : ${e.message}'));
    } catch (e) {
      throw Exception('Failed to load teams: $e');
    }
  }

  Future<Either<Failure, List<InvitationModel>>> fetchInvitations(
      int page, int limit) async {
    try {
      final response = await dio.get('post/team/receiver/', queryParameters: {
        'page': page,
        'limit': limit,
      });
      if (response.statusCode == 200) {
        final invitations = (response.data['results'] as List)
            .map((invitation) => InvitationModel.fromJson(invitation))
            .toList();
        return right(invitations);
      } else {
        return left(
            Failure('Failed to load invitations: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to load invitations: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to load invitations: $e');
    }
  }

  Future<Either<Failure, Unit>> acceptInvitation(int inviteId) async {
    try {
      final response = await dio.post('post/team/receiver/', data: {
        'invite_id': inviteId,
      });
      if (response.statusCode == 200 || response.statusCode == 404) {
        return right(unit);
      } else {
        return left(
            Failure('Failed to accept invitation: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to accept invitation: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to accept invitation: $e');
    }
  }

  Future<Either<Failure, Unit>> rejectInvitation(int inviteId) async {
    try {
      final response = await dio.delete('post/team/receiver/', data: {
        'invite_id': inviteId,
      });
      if (response.statusCode == 200 || response.statusCode == 404) {
        return right(unit);
      } else {
        return left(
            Failure('Failed to reject invitation: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to reject invitation: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to reject invitation: $e');
    }
  }

  Future<Either<Failure, Unit>> createTeam(
      String name, List<String> emails) async {
    try {
      final response = await dio.post('post/team/', data: {
        'name': name,
        'emails': emails,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(unit);
      } else {
        return left(Failure('Failed to create team: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to create team: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to create team: $e');
    }
  }

  Future<Either<Failure, List<UserModel>>> searchForMembers(
      String? query, int page, int limit) async {
    try {
      final response = await dio.get('post/user/search', queryParameters: {
        'username': query,
        'page': page,
        'limit': limit,
        'type': 'Student',
      });

      if (response.statusCode == 200) {
        final members = (response.data['results'] as List)
            .map((member) => UserModel.fromJson(member))
            .toList();

        return right(members);
      } else if (response.statusCode == 404) {
        return right([]);
      } else {
        return left(Failure('Failed to load members: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return right([]);
      }
      return left(Failure('Failed to load members: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to load members: $e');
    }
  }

  Future<Either<Failure, Unit>> deleteTeam(int teamId) async {
    try {
      final response = await dio.delete('post/team/', data: {
        'id': teamId,
      });
      if (response.statusCode == 200 ||
          response.statusCode == 404 ||
          response.statusCode == 204) {
        return right(unit);
      } else {
        return left(Failure('Failed to delete team: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to delete team: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to delete team: $e');
    }
  }

  Future<Either<Failure, Unit>> inviteMember(
      int teamId, List<String> emails) async {
    try {
      final response = await dio.post('post/team/inviter/', data: {
        'team_id': teamId,
        'invited_emails': emails,
      });
      if (response.statusCode == 200) {
        return right(unit);
      } else {
        return left(Failure('Failed to invite member: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to invite member: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to invite member: $e');
    }
  }

  Future<Either<Failure, Unit>> leaveTeam(int teamId) async {
    try {
      final response = await dio.delete('post/team/managing/', data: {
        'team_id': teamId,
      });
      if (response.statusCode == 200 ||
          response.statusCode == 404 ||
          response.statusCode == 204) {
        return right(unit);
      } else {
        return left(Failure('Failed to leave team: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to leave team: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to leave team: $e');
    }
  }

  Future<Either<Failure, TeamModel>> kickMember(int teamId, int userId) async {
    try {
      final response = await dio.put('post/team/managing/', data: {
        'team_id': teamId,
        'user_id': userId,
      });
      if (response.statusCode == 200 || response.statusCode == 404) {
        return right(TeamModel.fromJson(response.data));
      } else {
        return left(Failure('Failed to remove member: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to remove member: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to remove member: $e');
    }
  }

  Future<Either<Failure, TeamModel>> updateTeam(TeamModel team) async {
    try {
      final response = await dio
          .put('post/team/', data: {"team_id": team.id, "team": team.toJson()});
      if (response.statusCode == 200 || response.statusCode == 404) {
        return right(TeamModel.fromJson(response.data));
      } else {
        return left(Failure('Failed to update team: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to update team: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to update team: $e');
    }
  }

  Future<Either<Failure, List<InvitationModel>>> fetchMyInvitations(
      int page, int limit) async {
    try {
      final response = await dio.get('post/team/inviter/', queryParameters: {
        'page': page,
        'limit': limit,
      });
      if (response.statusCode == 200) {
        final invitations = (response.data['results'] as List)
            .map((invitation) => InvitationModel.fromJson(invitation))
            .toList();
        return right(invitations);
      } else {
        return left(
            Failure('Failed to load invitations: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to load invitations: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to load invitations: $e');
    }
  }

  Future<Either<Failure, Unit>> deleteInvitation(int inviteId) async {
    try {
      final response = await dio.delete('post/team/inviter/', data: {
        'invite_id': inviteId,
      });
      if (response.statusCode == 200 ||
          response.statusCode == 404 ||
          response.statusCode == 204) {
        return right(unit);
      } else {
        return left(
            Failure('Failed to delete invitation: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return left(Failure('Failed to delete invitation: ${e.message}'));
    } catch (e) {
      throw Exception('Failed to delete invitation: $e');
    }
  }
}
