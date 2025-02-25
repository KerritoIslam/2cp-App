import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/notifications/application/widgets/notifcation_tile.dart';
import 'package:app/features/notifications/domain/entitities/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/widgets/divider.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              'Notifications',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          BlocBuilder<notificationsBloc, notificationsState>(
            
            builder: (context, state) {
             Widget listBuilder(List<ENotification> notifications){
return SliverList.separated(
                         itemCount: notifications.length,
            itemBuilder: (ctx, idx) => NotifcationTile(notification: notifications[idx]),  
                  separatorBuilder: (ctx, idx) => FDivider(
            ),
          ); 
              } 
              
            if (state is notificationsLoaded){
            return listBuilder(state.notifications);}
              if (state is notficationsLoading ){
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
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
    );
  }
}
