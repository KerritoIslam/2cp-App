import 'package:app/features/teams/application/pages/my_invitations.dart';
import 'package:app/features/teams/application/pages/my_teams_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackinPage extends StatefulWidget {
  final VoidCallback? onfabpressed;
  const TrackinPage({super.key, this.onfabpressed});

  @override
  State<TrackinPage> createState() => _TrackinPageState();
}

class _TrackinPageState extends State<TrackinPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        dividerColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        indicatorColor: Theme.of(context).primaryColor,
        labelStyle: Theme.of(context).textTheme.titleSmall,
        unselectedLabelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).dividerColor,
            ),
        controller: _tabController,
        tabs: const [
          Tab(text: 'teams'),
          Tab(text: 'invitations'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyTeamsPage(
            
          ),
          
        MyInvitations()
        ],
      ),
      floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    widget.onfabpressed!();
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
    );
  }
}
