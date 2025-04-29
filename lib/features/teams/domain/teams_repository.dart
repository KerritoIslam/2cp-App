import 'package:app/core/failure/failure.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/data/sources/teams_rest_remote.dart';
import 'package:app/features/teams/domain/entities/invitation.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:dartz/dartz.dart';

class TeamsRepository {
  final TeamsRestRemote remoteSource;
  TeamsRepository(this.remoteSource);

  Future<Either<Failure, List<Team>>> fetchTeams(int page, int limit) async {
    try {
      final result = await remoteSource.fetchTeams(page, limit);
      return result.fold(
        (failure) => left(failure),
        (teams) {
          final teamEntities =
              teams.map((teamModel) => Team.fromModel(teamModel)).toList();
          return right(teamEntities);
        },
      );
    } catch (e) {
      return left(Failure('Failed to convert teams: $e'));
    }
  }

  Future<Either<Failure, Unit>> creatTeam(
      String name, List<String> emails) async {
    try {
      final result = await remoteSource.createTeam(name, emails);
      return result.fold(
        (failure) => left(failure),
        (unit) => right(unit),
      );
    } catch (e) {
      return left(Failure('Failed to create team: $e'));
    }
  }

  Future<Either<Failure, Team>> updateTeam(Team team) async {
    final result = await remoteSource.updateTeam(team.toModel());
    try {
      return result.fold(
        (failure) => left(failure),
        (teamModel) => right(Team.fromModel(teamModel)),
      );
    } catch (e) {
      return left(Failure('Failed to convert team: $e'));
    }
  }

  Future<Either<Failure, Unit>> deleteTeam(int teamId) async {
    try {
      final result = await remoteSource.deleteTeam(teamId);
      return result.fold(
        (failure) => left(failure),
        (unit) => right(unit),
      );
    } catch (e) {
      return left(Failure('Failed to delete team: $e'));
    }
  }

  Future<Either<Failure, List<Invitation>>> fetchInvitations(
      int page, int limit) async {
    try {
      final result = await remoteSource.fetchInvitations(page, limit);
      return result.fold(
        (failure) => left(failure),
        (invitations) {
          final invitationEntities = invitations
              .map((invitationModel) => Invitation.fromModel(invitationModel))
              .toList();
          return right(invitationEntities);
        },
      );
    } catch (e) {
      return left(Failure('Failed to convert invitations: $e'));
    }
  }

  Future<Either<Failure, Unit>> rejectInvitation(int inviteId) async {
    try {
      final result = await remoteSource.rejectInvitation(inviteId);
      return result.fold(
        (failure) => left(failure),
        (unit) => right(unit),
      );
    } catch (e) {
      return left(Failure('Failed to reject invitation: $e'));
    }
  }

  Future<Either<Failure, Unit>> acceptInvitation(int inviteId) async {
    try {
      final result = await remoteSource.acceptInvitation(inviteId);
      return result.fold(
        (failure) => left(failure),
        (unit) => right(unit),
      );
    } catch (e) {
      return left(Failure('Failed to accept invitation: $e'));
    }
  }

  Future<Either<Failure, Unit>> leaveTeam(int teamId) async {
    try {
      final result = await remoteSource.leaveTeam(teamId);
      return result.fold(
        (failure) => left(failure),
        (unit) => right(unit),
      );
    } catch (e) {
      return left(Failure('Failed to leave team: $e'));
    }
  }

  Future<Either<Failure, List<User>>> searchForMembers(
      String query, int page, int limit) async {
    try {
      final result = await remoteSource.searchForMembers(query, page, limit);
      return result.fold((failure) => left(failure), (members) {
        final memberEntities =
            members.map((memberModel) => User.fromModel(memberModel)).toList();
        return right(memberEntities);
      });
    } catch (e) {
      return left(Failure('Failed to convert members: $e'));
    }
  }

  Future<Either<Failure, Team>> kickMember(int teamId, int userId) async {
    try {
      final result = await remoteSource.kickMember(teamId, userId);
      return result.fold(
        (failure) => left(failure),
        (unit) => right(Team.fromModel(unit)),
      );
    } catch (e) {
      return left(Failure('Failed to kick member: $e'));
    }
  }

  Future<Either<Failure, Unit>> inviteMember(
      int teamId, List<String> emails) async {
    try {
      final result = await remoteSource.inviteMember(teamId, emails);
      return result.fold(
        (failure) => left(failure),
        (unit) => right(unit),
      );
    } catch (e) {
      return left(Failure('Failed to add member: $e'));
    }
  }

  Future<Either<Failure, List<Invitation>>> fetchMyInvitations(
      int page, int limit) async {
    try {
      final result = await remoteSource.fetchMyInvitations(page, limit);
      return result.fold(
        (failure) => left(failure),
        (invitations) {
          final invitationEntities = invitations
              .map((invitationModel) => Invitation.fromModel(invitationModel))
              .toList();
          return right(invitationEntities);
        },
      );
    } catch (e) {
      return left(Failure('Failed to convert invitations: $e'));
    }
  }

  Future<Either<Failure, Unit>> deleteInvitation(int inviteId) async {
    try {
      final result = await remoteSource.deleteInvitation(inviteId);
      return result.fold(
        (failure) => left(failure),
        (unit) => right(unit),
      );
    } catch (e) {
      return left(Failure('Failed to delete invitation: $e'));
    }
  }
}
