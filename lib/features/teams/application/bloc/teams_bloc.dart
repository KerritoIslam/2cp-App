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
  int _limit = 10;
  String _currentQuery = '';
  int _currentPage = 1;
  bool _hasMore = true;
  List<User> _allResults = [];
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
    on<TeamsLeaveEvent>((event, emit) async {
      emit(TeamsLoading());

      final result = await teamsRepository.leaveTeam(event.id);
      result.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (unit) {
          emit(TeamsLeaveSuccess(message: 'You left the team'));
        },
      );
    });

    on<TeamsinviteEvent>((event, emit) async {
      print(event.toString());
      emit(TeamsLoading());
      final result = await teamsRepository.inviteMember(event.id, event.emails);
      result.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (unit) {
          emit(TeamsSuccess(message: 'Invitations sent successfully'));
        },
      );
    });
    on<TeamsSearchForMembersEvent>((event, emit) async {
      emit(TeamsSearchForMembersLoading());
      _hasMore = false;
      _limit = 2;
      _currentPage = 1;
      _currentQuery = event.query;
      if (_currentQuery.isEmpty) {
        emit(TeamsSearchForMembersSuccess(
          members: [],
          hasmore: false,
          message: 'No results found',
        ));
        return;
      }
      final result = await teamsRepository.searchForMembers(
          event.query, _currentPage, _limit);

      result.fold(
        (failure) => emit(TeamsSearchForMembersError(message: failure.message)),
        (res) {
          _allResults = res;
          _hasMore = res.length == _limit;

          emit(TeamsSearchForMembersSuccess(
            members: res,
            hasmore: _hasMore,
            message: '',
          ));
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 300)));
    on<TeamsSearchForMoreMembersEvent>((event, emit) async {
      if (!_hasMore || state is TeamsSearchForMembersLoading) return;
      _currentPage++;
      try {
        print('Loading more members...');
        print(_currentPage);
        print(_currentQuery);
        print(_limit);
        print(_hasMore);
        print(_allResults.length);
        final newResult = await teamsRepository.searchForMembers(
            _currentQuery, _currentPage, _limit);
        newResult.fold(
            (failure) =>
                emit(TeamsSearchForMembersError(message: failure.message)),
            (res) {
          _allResults.addAll(res);
          print(_allResults.length);
          _hasMore = res.length == _limit;
          emit(TeamsSearchForMembersSuccess(
            members: _allResults,
            hasmore: _hasMore,
            message: '',
          ));
        });
      } catch (e) {
        emit(TeamsSearchForMembersError(message: e.toString()));
      }
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
    on<TeamsLoadMyInvitationsEvent>((event, emit) async {
      emit(TeamsLoading());
      final result =
          await teamsRepository.fetchMyInvitations(event.page, event.limit);
      result.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (invitations) =>
            emit(TeamsMyInvitationsLoaded(invitations: invitations)),
      );
    });
    on<TeamsDeleteInvitationEvent>((event, emit) async {
      emit(TeamsLoading());
      final result = await teamsRepository.deleteInvitation(event.id);
      result.fold(
        (failure) => emit(TeamsError(message: failure.message)),
        (unit) {
          emit(TeamsSuccess(message: 'Invitation deleted successfully'));
        },
      );
    });
  }
}
