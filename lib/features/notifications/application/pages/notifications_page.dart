import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/notifications/application/widgets/notifcation_tile.dart';
import 'package:app/features/notifications/domain/entitities/notification.dart';
import 'package:app/shared/widgets/loadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forui/widgets/divider.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Theme.of(context).secondaryHeaderColor,),
          onPressed: () =>  context.pop()),
        
        title: Text('Notifications',style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).secondaryHeaderColor
        ),),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          context.read<notificationsBloc>().add(notificationsFetched());
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, top: 10.h,bottom: 10.h),
                
              ),
            ),
            BlocBuilder<notificationsBloc, notificationsState>(
              
              builder: (context, state) {
               Widget listBuilder(List<ENotification> notifications){
        return SliverList.separated(
                           itemCount: notifications.length,
              itemBuilder: (ctx, idx) => NotifcationTile(notification: notifications[idx],),  
                    separatorBuilder: (ctx, idx) => FDivider(
              ),
            ); 
                } 
                
              if (state is notificationsLoaded){
              return listBuilder(state.notifications);}
                if (state is notficationsLoading ){
                return SliverToBoxAdapter(
                  child: Center(
                    child:Loadingindicator(), 
                  ),
                );
                }
                if (state is notificationsError){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                                                return listBuilder(state.notifications) ;
                              }
                return SliverToBoxAdapter(
                  child: Text('Unknown State'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
