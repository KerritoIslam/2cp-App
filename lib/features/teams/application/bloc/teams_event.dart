part of 'teams_bloc.dart';

@immutable
sealed class TeamsEvent {}

final class TeamsLoadEvent extends TeamsEvent {
  final int limit;
  final int page;
  TeamsLoadEvent({
    required this.limit,
    required this.page,
  });
}

final class TeamsLoadInvitationsEvent extends TeamsEvent {
  final int limit;
  final int page;
  TeamsLoadInvitationsEvent({
    required this.limit,
    required this.page,
  });
}

final class TeamsCreateEvent extends TeamsEvent {
  final String name;
  final List<String> emails;
  TeamsCreateEvent({
    required this.name,
    required this.emails,
  });
}

final class TeamsUpdateEvent extends TeamsEvent {
  final Team team;
  TeamsUpdateEvent({
    required this.team,
  });
}

final class TeamsDeleteEvent extends TeamsEvent {
  final int id;

  TeamsDeleteEvent({
    required this.id,
    
  });
}

final class TeamsAcceptInvitationEvent extends TeamsEvent {
  final int inviteId;
  TeamsAcceptInvitationEvent({
    required this.inviteId,
  });
}

final class TeamsRejectInvitationEvent extends TeamsEvent {
  final int inviteId;
  TeamsRejectInvitationEvent({
    required this.inviteId,
  });
}

final class TeamsLeaveEvent extends TeamsEvent {
  final int id;
  TeamsLeaveEvent({
    required this.id,
  });
}

final class TeamsinviteEvent extends TeamsEvent {
  final int id;
  final String email;
  TeamsinviteEvent({
    required this.id,
    required this.email,
  });
}

final class TeamsSearchForMembersEvent extends TeamsEvent {
  final String query;
  TeamsSearchForMembersEvent({
    required this.query,
  });
}
final class TeamsKickMemberEvent extends TeamsEvent {
  final int teamId;
  final int userId;
  TeamsKickMemberEvent({
    required this.teamId,
    required this.userId,
  });
}