// ignore_for_file: deprecated_member_use

import 'package:app/features/Search/application/pages/search_page.dart';
import 'package:app/features/applications%20status/application/bloc/applications_bloc.dart';
import 'package:app/features/applications%20status/application/pages/TrackApplicationsPage.dart';
import 'package:app/features/chat/application/pages/chats_page.dart';
import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/application/pages/opporutnities_page.dart';
import 'package:app/features/opportunities/application/widgets/app_name.dart';
import 'package:app/features/teams/application/widgets/teams_wraper.dart';
import 'package:app/utils/bloc/theme_provider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class Layout extends StatefulWidget {
  final int initPage;

  const Layout({super.key, required this.initPage});
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final GetIt locator = GetIt.instance;
  static late List<Widget> pages;
  late int index;
  late bool isDark;
  late int numberOfUndreadNotif;
  late int teamIndex;
  @override
  void initState() {
    super.initState();
    teamIndex = 0;
    pages = [
      OpporutnitiesPage(),
      SearchPage(),
      TeamsPageWraper(initialindex: teamIndex),
      ChatsPage(),
    ];

    index = widget.initPage;
    context.read<notificationsBloc>().add(notificationsFetched());
    isDark = BlocProvider.of<ThemeProviderBloc>(context).state is DarkTheme;

    final notificationState = context.read<notificationsBloc>().state;
    if (notificationState is notificationsLoaded) {
      numberOfUndreadNotif = notificationState.notifications
          .where((element) => !element.isRead)
          .length;
    }
    numberOfUndreadNotif = 5;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pages[2] = TeamsPageWraper(
      key: ValueKey(DateTime.now().millisecondsSinceEpoch),
      initialindex: teamIndex,
    );
    return FSheets(
      child: BlocListener<ThemeProviderBloc, ThemeProviderState>(
        listener: (context, state) {
          if (state is DarkTheme) {
            isDark = true;
            setState(() {});
          } else {
            isDark = false;
            setState(() {});
          }
        },
        bloc: BlocProvider.of<ThemeProviderBloc>(context),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: AppLogo(),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    if (index == 2) {
                      setState(() {
                        
                        teamIndex = 0;
                      });
                    } else {
                      context
                          .pushReplacement('/protected/layout/0/opportunities');
                    }
                    //showFPersistentSheet(
                    //  context: context,
                    //  side: FLayout.rtl,
                    //  builder: (ctx, state) {
                    //    return NotificationModal();
                    //  },
                    //);
                  },
                  icon: SvgPicture.asset(
                    !isDark
                        ? 'assets/icons/notification.svg'
                        : 'assets/icons/notification_dark.svg',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (index == 2) {
                    setState(() {
                      teamIndex = 2;
                    });
                  } else {
                    context.pushReplacement('/protected/profile');
                  }
                },
                icon: index == 2
                    ? SvgPicture.asset('assets/icons/teams_app_bar.svg',
                        color: Theme.of(context).secondaryHeaderColor)
                    : SvgPicture.asset(
                        !isDark
                            ? 'assets/icons/profile.svg'
                            : 'assets/icons/profile_dark.svg',
                      ),
              ),
            ],
            leadingWidth: 250.w,
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedItemColor: Theme.of(context).secondaryHeaderColor,
              unselectedLabelStyle:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              selectedItemColor: Theme.of(context).primaryColor,
              currentIndex: index,
              onTap: (value) {
                if (index == value && value == 0) {
                  //TODO:maybe add this
                  //context.read<OpportunitiesBloc>().add(refreshOpportunitiesEvent());
                }

                setState(() {
                  index = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    !isDark
                        ? 'assets/icons/opportunityInactive.svg'
                        : 'assets/icons/opportunity_dark.svg',
                  ),
                  activeIcon: SvgPicture.asset('assets/icons/opportunity.svg'),
                  label: "Internship",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset('assets/icons/search.svg'),
                  icon: SvgPicture.asset(
                    !isDark
                        ? 'assets/icons/searchInactive.svg'
                        : 'assets/icons/search_dark.svg',
                  ),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    !isDark
                        ? 'assets/icons/teamsInactive.svg'
                        : 'assets/icons/teams_dark.svg',
                  ),
                  label: "Teams",
                  activeIcon: SvgPicture.asset('assets/icons/teams.svg'),
                ),
                BottomNavigationBarItem(
                    label: "Chat",
                    icon: Icon(
                      Icons.messenger_outline,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    activeIcon: Icon(Icons.messenger_outline,
                        color: Theme.of(context).primaryColor)),
              ],
            ),
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider<ApplicationBloc>(
                create: (ctx) => locator.get<ApplicationBloc>(),
                child: Trackapplicationspage(),
              ),
              BlocProvider<OpportunitiesBloc>(
                  create: (ctx) => locator.get<OpportunitiesBloc>()),
              BlocProvider<OpportunitiesSavedBloc>(
                  create: (ctx) => locator.get<OpportunitiesSavedBloc>())
            ],
            child: IndexedStack(
              index: index,
              children: pages,
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationModal extends StatelessWidget {
  const NotificationModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: 700.w,
      color: Theme.of(context).primaryColor.withOpacity(1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.separated(
            separatorBuilder: (ctx, idx) => Divider(),
            shrinkWrap: true,
            itemBuilder: (ctx, idx) {
              return SizedBox(
                width: 700.w,
                child: FCard(
                  title: Text('Hello $idx'),
                ),
              );
            },
            itemCount: 10,
          )
        ],
      ),
    );
  }
}
