// ignore_for_file: deprecated_member_use

import 'package:app/features/Search/application/pages/search_page.dart';
import 'package:app/features/chat/application/pages/chats_page.dart';
import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/application/pages/opporutnities_page.dart';
import 'package:app/features/opportunities/application/widgets/app_name.dart';
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

  const Layout({super.key, this.initPage = 0});
  @override
  State<Layout> createState() => _LayoutState();
}
class _LayoutState extends State<Layout> {
  final GetIt locator = GetIt.instance;
  static const List<Widget> pages = [
    OpporutnitiesPage(),
    SearchPage(),
    Center(child: Text("Hello You")),
    ChatsPage(),
  ];
  late int index;
  late bool isDark;

  @override
  void initState() {
    super.initState();
    context.read<notificationsBloc>().add(notificationsFetched());
    isDark = BlocProvider.of<ThemeProviderBloc>(context).state is DarkTheme;

    index = widget.initPage;
  }

  @override
  Widget build(BuildContext context) {
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
                        context.push('/protected/layout/notifications');                                        //showFPersistentSheet(
                    //  context: context,
                    //  side: FLayout.rtl,
                    //  builder: (ctx, state) {
                    //    return NotificationModal();
                    //  },
                    //);
                  },
                  icon: SvgPicture.asset(
                    !isDark ? 'assets/icons/notification.svg' : 'assets/icons/notification_dark.svg',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.push('/protected/options');
                },
                icon: SvgPicture.asset(
                  !isDark ? 'assets/icons/profile.svg' : 'assets/icons/profile_dark.svg',
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
              onTap: (value) => setState(() {
                    index = value;
                  }),
              items: [
                BottomNavigationBarItem(
                  icon:SvgPicture.asset(
                    !isDark ? 'assets/icons/opportunityInactive.svg' : 'assets/icons/opportunity_dark.svg',
                  ),
                  activeIcon: SvgPicture.asset('assets/icons/opportunity.svg'),
                  label: "Internship",
                ),
                BottomNavigationBarItem(
                  activeIcon:SvgPicture.asset('assets/icons/search.svg'),
                  icon:SvgPicture.asset(
                    !isDark ? 'assets/icons/searchInactive.svg' : 'assets/icons/search_dark.svg',
                  ),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon:SvgPicture.asset(
                    !isDark ? 'assets/icons/teamsInactive.svg' : 'assets/icons/teams_dark.svg',
                  ),
                  label: "Teams",
                  activeIcon: SvgPicture.asset('assets/icons/teams.svg'),
                ),
                BottomNavigationBarItem(
                  label: "Chat",
                  icon: Icon(Icons.messenger_outline,color: Theme.of(context).secondaryHeaderColor,

                  ),
                  activeIcon:Icon(Icons.messenger_outline,color: Theme.of(context).primaryColor

                )),
              ],
            ),
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider<OpportunitiesBloc>(create: (ctx) => locator.get<OpportunitiesBloc>()),
              BlocProvider<OpportunitiesSavedBloc>(create: (ctx) => locator.get<OpportunitiesSavedBloc>())
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
      height:MediaQuery.sizeOf(context).height,
      width: 700.w,      color:Theme.of(context).primaryColor.withOpacity(1) ,
      child: Column(
        mainAxisSize: MainAxisSize.min,
      children: [
          ListView.separated(
            separatorBuilder: (ctx,idx)=>Divider(),
          shrinkWrap: true,
            itemBuilder: (ctx,idx){

          
            return SizedBox
              (
                  width: 700.w,
                
              child: FCard(
                  title: Text('Hello $idx'),),
            );
          },itemCount: 10,)
        ],
      ),
    );
  }
}
