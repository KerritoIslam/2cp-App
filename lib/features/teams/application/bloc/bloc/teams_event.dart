part of 'teams_bloc.dart';

@immutable
sealed class TeamsEvent {}
final class TeamsLoadEvent extends TeamsEvent {
  TeamsLoadEvent();
}
final class TeamsLoadInvitationsEvent extends TeamsEvent {
 TeamsLoadInvitationsEvent();
}
final class TeamsCreateEvent extends TeamsEvent {
  final String name;
  final List<String> skills;
  TeamsCreateEvent({
    required this.name,
    required this.skills,
  });
}
final class TeamsUpdateEvent extends TeamsEvent {
  final int id;
  final String name;
  final List<String> skills;
  TeamsUpdateEvent({
    required this.id,
    required this.name,
    required this.skills,
  });
}
final class TeamsDeleteEvent extends TeamsEvent {
  final int id;
  TeamsDeleteEvent({
    required this.id,
  });
}
final class TeamsAcceptInvitationEvent extends TeamsEvent {
  final int id;
  TeamsAcceptInvitationEvent({
    required this.id,
  });
}
final class TeamsRejectInvitationEvent extends TeamsEvent {
  final int id;
  TeamsRejectInvitationEvent({
    required this.id,
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