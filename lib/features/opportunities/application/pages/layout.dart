import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/application/pages/opporutnities_page.dart';
import 'package:app/features/opportunities/application/widgets/app_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class Layout extends StatefulWidget {
  final int initPage;

  const Layout({super.key, this.initPage = 0,});
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final GetIt locator=GetIt.instance;
  static const List<Widget> pages = [
    OpporutnitiesPage(),
    Center(child: Center(child: Text("Hello You"))),
    Center(child: Center(child: Text("Hello You"))),
  ];
  late int index;
  @override
  void initState() {
    super.initState();

    index = widget.initPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: AppLogo(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/notification.svg')),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/profile.svg")),
        ],
        leadingWidth: 250.w,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: BottomNavigationBar(
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
                  icon:
                      SvgPicture.asset('assets/icons/opportunityInactive.svg'),
                  activeIcon: SvgPicture.asset('assets/icons/opportunity.svg'),
                  label: "Internship"),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: "Search",
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  )),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/teamsInactive.svg'),
                  label: "Teams",
                  activeIcon: SvgPicture.asset('assets/icons/teams.svg')),
            ]),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<OpportunitiesBloc>(create: (ctx)=>locator.get<OpportunitiesBloc>())
        ],
        child: IndexedStack(index:index,children: pages,),
      ),
    );
  }
}
