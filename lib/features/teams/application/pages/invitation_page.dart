import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:app/features/teams/application/widgets/invitation_card.dart';
import 'package:app/shared/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InvitationsPage extends StatefulWidget {
  final VoidCallback? onfabpressed;
  const InvitationsPage({super.key, required this.onfabpressed});

  @override
  State<InvitationsPage> createState() => _InvitationsPageState();
}

class _InvitationsPageState extends State<InvitationsPage> {
  @override
  void initState() {
    context
        .read<TeamsBloc>()
        .add(TeamsLoadInvitationsEvent(limit: 10, page: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return LoadingPage();
    return BlocConsumer<TeamsBloc, TeamsState>(
      listener: (context, state) => print('${state.toString()}'),
      builder: (context, state) {
        if (state is TeamsLoading || state is TeamsInitial) {
          return const LoadingPage();
        } else if (state is TeamsError) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.red,
                  ),
            ),
          );
        } else if (state is TeamsInvitationsLoaded) {
          return Scaffold(
            body: RefreshIndicator(
              color: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              onRefresh: () async {
                context.read<TeamsBloc>().add(
                      TeamsLoadInvitationsEvent(
                        limit: 10,
                        page: 1,
                      ),
                    );
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Your ',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                        children: [
                          TextSpan(
                            text: "Invitations",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/invitations.svg',
                      height: 377,
                      width: 356,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "invitations",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (state.invitations.isEmpty)
                      Center(
                        child: Text(
                          'No invitations found',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).dividerColor,
                                  ),
                        ),
                      ),
                    ...state.invitations.map((invitation) => InvitationCard(
                          invitation: invitation,
                        )),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => widget.onfabpressed?.call(),
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
