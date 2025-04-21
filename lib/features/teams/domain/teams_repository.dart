import 'package:app/core/failure/failure.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/data/models/team_model.dart';
import 'package:app/features/teams/data/sources/teams_rest_remote.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:dartz/dartz.dart';

class TeamsRepository {
  final TeamsRestRemote remoteSource;
  TeamsRepository(this.remoteSource);

  Future<Either<Failure, List<Team>>> fetchTeams() async {
    return right([]);
  }

  Future<Either<Failure, void>> addTeam(Team team) async {
    return right(null);
  }

  Future<Either<Failure, void>> updateTeam(Team team) async {
    return right(null);
  }

  Future<Either<Failure, void>> deleteTeam(String teamId) async {
    return right(null);
  }

  Future<Either<Failure, List<Team>>> fetchInvitations() async {
    return right([]);
  }

  Future<Either<Failure, void>> rejectInvitation(String teamId) async {
    return right(null);
  }

  Future<Either<Failure, void>> acceptInvitation(String teamId) async {
    return right(null);
  }

  Future<Either<Failure, void>> leaveTeam(String teamId) async {
    return right(null);
  }

  Team modelToEntity(TeamModel model) {
    return Team(
      id: 0,
      name: 'Team Name',
      createdAt: DateTime.now(),
      students: [],
      leader: User(
          id: 0,
          name: 'Sender Name',
          email: '',
          date_joined: '15/10/2023',
          gendre: 'm',
          profilepic: ''),
    );
  }
}
