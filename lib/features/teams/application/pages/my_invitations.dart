import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:app/features/teams/application/widgets/invitation_status_card.dart';
import 'package:app/features/teams/domain/entities/invitation.dart';
import 'package:app/shared/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class MyInvitations extends StatefulWidget {
  const MyInvitations({super.key});

  @override
  State<MyInvitations> createState() => _MyInvitationsState();
}

class _MyInvitationsState extends State<MyInvitations> {
  late List<Invitation> invitaions = [];
  @override
  void initState() {
    invitaions = [];
    context
        .read<TeamsBloc>()
        .add(TeamsLoadMyInvitationsEvent(limit: 10, page: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamsBloc, TeamsState>(
      listener: (context, state) {
        print(state.toString());
        if (state is TeamsError) {
          toastification.show(
            title: Text(
              state.message,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.red,
                  ),
            ),
            type: ToastificationType.error,
          );
        }
        if (state is TeamsSuccess) {
          toastification.show(
            title: Text(
              state.message,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            type: ToastificationType.success,
          );
          context.read<TeamsBloc>().add(
                TeamsLoadMyInvitationsEvent(
                  limit: 10,
                  page: 1,
                ),
              );
        }
      },
      builder: (context, state) {
        if (state is TeamsLoading || state is TeamsInitial) {
          return LoadingPage();
        } else if (state is TeamsError) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.red,
                  ),
            ),
          );
        } else if (state is TeamsMyInvitationsLoaded) {
          invitaions = state.invitations;
        }
        if (invitaions.isEmpty) {
          return Center(
            child: Text(
              'No invitations found',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).dividerColor,
                  ),
            ),
          );
        }
        return RefreshIndicator(
          color: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          onRefresh: () async {
            context.read<TeamsBloc>().add(
                  TeamsLoadMyInvitationsEvent(
                    limit: 10,
                    page: 1,
                  ),
                );
          },
          child: ListView.builder(
            itemCount: invitaions.length,
            itemBuilder: (context, index) {
              return InvitationStatusCard(invitation: invitaions[index]);
            },
          ),
        );
      },
    );
  }
}
