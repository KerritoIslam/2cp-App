import 'package:app/features/teams/domain/Teams_repository.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'teams_event.dart';
part 'teams_state.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  final TeamsRepository teamsRepository;
  TeamsBloc(this.teamsRepository) : super(TeamsInitial()) {
    on<TeamsLoadEvent>((event, emit) {});
    on<TeamsLoadInvitationsEvent>((event, emit) {});
    on<TeamsCreateEvent>((event, emit) {});
    on<TeamsUpdateEvent>((event, emit) {});
    on<TeamsDeleteEvent>((event, emit) {});
    on<TeamsAcceptInvitationEvent>((event, emit) {});
    on<TeamsRejectInvitationEvent>((event, emit) {});
    on<TeamsLeaveEvent>((event, emit) {});
    on<TeamsinviteEvent>((event, emit) {});
  }
}
