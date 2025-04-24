import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/teams/domain/entities/invitation.dart';
import 'package:app/features/teams/domain/entities/team.dart';
import 'package:app/features/teams/domain/teams_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:stream_transform/stream_transform.dart';

part 'teams_event.dart';
part 'teams_state.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  EventTransformer<Event> debounce<Event>(Duration duration) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }

  final TeamsRepository teamsRepository;
  TeamsBloc(this.teamsRepository) : super(TeamsInitial()) {
    on<TeamsLoadEvent>((event, emit) async {
      emit(TeamsLoading());
      final result = await teamsRepository.fetchTeams(event.page, event.limit);
      result.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (teams) => emit(TeamsLoaded(teams: teams)),
      );
    });
    on<TeamsLoadInvitationsEvent>((event, emit) async {
      emit(TeamsLoading());
      final result =
          await teamsRepository.fetchInvitations(event.page, event.limit);
      result.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (invitations) => emit(TeamsInvitationsLoaded(invitations: invitations)),
      );
    });
    on<TeamsCreateEvent>((event, emit) async {
      emit(TeamsLoading());
      final result = await teamsRepository.creatTeam(event.name, event.emails);
      result.fold(
        (failure) => emit(TeamsCreateError(message: failure.message)),
        (unit) {
          emit(TeamsCreateSuccess());
        },
      );
    });
    on<TeamsUpdateEvent>((event, emit) async {
      emit(TeamsLoading());
      final result = await teamsRepository.updateTeam(event.team);
      result.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (team) {
          emit(TeamsUpdateSuccess(
              team: team, message: 'Team updated successfully'));
        },
      );
    });
    on<TeamsDeleteEvent>((event, emit) async {
      emit(TeamsLoading());
      final res = await teamsRepository.deleteTeam(event.id);

      res.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (unit) {
          emit(TeamsDeleteSuccess(message: 'Team deleted successfully'));
        },
      );
    });
    on<TeamsAcceptInvitationEvent>((event, emit) async {
      final result = await teamsRepository.acceptInvitation(event.inviteId);
      if (state is TeamsInvitationsLoaded) {
        emit(TeamsInvitationsLoaded(
          invitations: (state as TeamsInvitationsLoaded)
              .invitations
              .where((invitation) => invitation.id != event.inviteId)
              .toList(),
        ));
      }
      result.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (unit) {},
      );
    });
    on<TeamsRejectInvitationEvent>(
      (event, emit) async {
        if (state is TeamsInvitationsLoaded) {
          emit(TeamsInvitationsLoaded(
            invitations: (state as TeamsInvitationsLoaded)
                .invitations
                .where((invitation) => invitation.id != event.inviteId)
                .toList(),
          ));
        }
        final result = await teamsRepository.rejectInvitation(event.inviteId);
        result.fold(
          (failure) => emit(TeamsError(message: failure.message)),
          (unit) {},
        );
      },
    );
    on<TeamsLeaveEvent>((event, emit) {
      emit(TeamsLoading());
      teamsRepository.leaveTeam(event.id).then((result) {
        result.fold(
          (failure) => emit(TeamsError(message: failure.message)),
          (unit) {
            emit(TeamsLeaveSuccess(message: 'You left the team'));
          },
        );
      });
    });
    on<TeamsinviteEvent>((event, emit) {
      emit(TeamsLoading());
      teamsRepository.inviteMember(event.id, event.email).then((result) {
        result.fold(
          (failure) => emit(TeamsError(message: failure.message)),
          (unit) {
            emit(TeamsSuccess(message: 'Invitations sent successfully'));
          },
        );
      });
    });
    on<TeamsSearchForMembersEvent>((event, emit) async {
      emit(TeamsSearchForMembersLoading());
      final result = await teamsRepository.searchForMembers(event.query);
      result.fold(
        (failure) => emit(TeamsSearchForMembersError(message: failure.message)),
        (members) =>
            emit(TeamsSearchForMembersSuccess(members: members, message: '')),
      );
    }, transformer: debounce(const Duration(milliseconds: 300)));
    on<TeamsKickMemberEvent>((event, emit) async {
      emit(TeamsLoading());
      final result =
          await teamsRepository.kickMember(event.teamId, event.userId);
      result.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (team) {
          emit(TeamsKickMemberSuccess(
              message: 'Member kicked successfully', team: team));
        },
      );
    });
  }
}
