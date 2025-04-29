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
  final List<Invitation> invitations;
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

final class TeamsSearchForMembersSuccess extends TeamsSuccess {
  final List<User> members;
  final bool hasmore;
  TeamsSearchForMembersSuccess({
    required this.hasmore,
    required this.members,
    required String message,
    re
  }) : super(message: message);
}

final class TeamsSearchForMembersError extends TeamsState {
  final String message;
  TeamsSearchForMembersError({
    required this.message,
  });
}

final class TeamsSearchForMembersLoading extends TeamsState {}

final class TeamsCreateSuccess extends TeamsState {}

final class TeamsCreateError extends TeamsState {
  final String message;
  TeamsCreateError({
    required this.message,
  });
}

final class TeamsSuccess extends TeamsState {
  final String message;

  TeamsSuccess({
    required this.message,
  });
}

final class TeamsDeleteSuccess extends TeamsSuccess {
  final String message;

  TeamsDeleteSuccess({
    required this.message,
  }) : super(message: message);
}

final class TeamsUpdateSuccess extends TeamsSuccess {
  final Team team;
  final String message;

  TeamsUpdateSuccess({
    required this.message,
    required this.team,
  }) : super(message: message);
}

final class TeamsLeaveSuccess extends TeamsSuccess {
  final String message;

  TeamsLeaveSuccess({
    required this.message,
  }) : super(message: message);
}

final class TeamsKickMemberSuccess extends TeamsSuccess {
  final String message;
  final Team team;
  TeamsKickMemberSuccess({
    required this.team,
    required this.message,
  }) : super(message: message);
}

final class TeamsMyInvitationsLoaded extends TeamsState {
  final List<Invitation> invitations;
  TeamsMyInvitationsLoaded({
    required this.invitations,
  });
}
