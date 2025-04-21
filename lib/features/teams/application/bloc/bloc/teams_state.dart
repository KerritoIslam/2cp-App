part of 'teams_bloc.dart';

@immutable
sealed class TeamsState {}

final class TeamsInitial extends TeamsState {}
final class TeamsLoading extends TeamsState {}
final class TeamsLoaded extends TeamsState {
  final List<Team> teams;
  

  TeamsLoaded({
    required this.teams,
    
  });
}
final class TeamsInvitationsLoaded extends TeamsState {
  final List<Team> invitations;
  TeamsInvitationsLoaded({
    required this.invitations,
  });
}
final class TeamsError extends TeamsState {
  final String message;
  TeamsError({
    required this.message,
  });
}