import 'package:app/features/applications%20status/application/bloc/applications_bloc.dart';
import 'package:app/features/applications%20status/application/widgest/application_card.dart';
import 'package:app/shared/widgets/loadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Trackapplicationspage extends StatefulWidget {
  const Trackapplicationspage({super.key});

  @override
  State<Trackapplicationspage> createState() => _TrackapplicationspageState();
}

class _TrackapplicationspageState extends State<Trackapplicationspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Your \n",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).secondaryHeaderColor),
              children: [
                TextSpan(
                    text: "Applications",
                    style: TextStyle(color: Theme.of(context).primaryColor))
              ]),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onPressed: () {
            context.pop(context);
          },
        ),
      ),
      body: BlocBuilder<ApplicationBloc, ApplicationsState>(
          builder: (ctx, state) {
        if (state is ApplicationInitial) {
          BlocProvider.of<ApplicationBloc>(context)
              .add(fetchApplicationsEvent());
          return Center(
            child: Loadingindicator(),
          );
        } else if (state is ApplictationsLoading) {
          return Center(
            child: Loadingindicator(),
          );
        } else if (state is ApplicationsLoaded) {
          return RefreshIndicator(
            onRefresh: () {
              BlocProvider.of<ApplicationBloc>(context)
                  .add(refreshApplicationsEvent());
              return Future.delayed(Duration(milliseconds: 500));
            },
            child: ListView.builder(
              itemCount: state.applications.length,
              itemBuilder: (ctx, index) {
                final application = state.applications[index];
                return ApplicationCard(application: application);
              },
            ),
          );
        } else if (state is ApplicationsError) {
          return RefreshIndicator(
            onRefresh: () {
              BlocProvider.of<ApplicationBloc>(context)
                  .add(fetchApplicationsEvent());
              return Future.delayed(Duration(milliseconds: 500));
            },
            child: ListView(children: [
              Center(
                child: Text(state.message),
              ),
            ]),
          );
        }
        return Container();
      }),
    );
  }
}
