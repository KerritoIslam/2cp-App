import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:app/features/teams/application/widgets/team_card.dart';
import 'package:app/shared/pages/loading_page.dart';
import 'package:app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class MyTeamsPage extends StatefulWidget {
  const MyTeamsPage({super.key});

  @override
  State<MyTeamsPage> createState() => _MyTeamsPageState();
}

class _MyTeamsPageState extends State<MyTeamsPage> {
  TeamsBloc teamsBloc = locator.get<TeamsBloc>();
  @override
  void initState() {
    teamsBloc.add(TeamsLoadEvent(limit: 10, page: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamsBloc, TeamsState>(
        listener: (context, state) {
          if (state is TeamsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.red,
                      ),
                ),
              ),
            );
          }
          if (state is TeamsSuccess) {
            toastification.show(
              title: Text('${state.message}'),
              type: ToastificationType.success,
            );
          }
        },
        bloc: teamsBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case TeamsLoading:
            case TeamsInitial:
              return LoadingPage();
            case TeamsError:
              return Center(
                child: Text(
                  (state as TeamsError).message,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.red,
                      ),
                ),
              );
            case TeamsLoaded:
              final teams = (state as TeamsLoaded).teams;
              if (teams.isEmpty) {
                return Center(
                  child: Text(
                    'No teams found',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).dividerColor,
                        ),
                  ),
                );
              }
              return Scaffold(
                body: RefreshIndicator(
                  color: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  onRefresh: () async {
                    teamsBloc.add(
                      TeamsLoadEvent(
                        limit: 10,
                        page: 1,
                      ),
                    );
                  },
                  child: ListView.builder(
                    itemCount: teams.length,
                    itemBuilder: (context, index) {
                      return TeamCard(team: teams[index]);
                    },
                  ),
                ),
              );
            default:
              teamsBloc.add(TeamsLoadEvent(limit: 10, page: 1));
              break;
          }
          return const Center(
            child: Text(
              'Something went wrong',
              style: TextStyle(color: Colors.red),
            ),
          );
        });
  }
}
