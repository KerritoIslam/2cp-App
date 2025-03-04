import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/application/widgets/opportunity_card.dart';
import 'package:app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SavedopportuntitiesPage extends StatefulWidget {
  const SavedopportuntitiesPage({super.key});

  @override
  State<SavedopportuntitiesPage> createState() => _SavedopportuntitiesPageState();
}

class _SavedopportuntitiesPageState extends State<SavedopportuntitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      title:RichText(
textAlign: TextAlign.center,
          text: TextSpan(text: "Saved \n",
  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).secondaryHeaderColor),
          children: [
          TextSpan(text:"Opportunities",style: TextStyle(color: Theme.of(context).primaryColor))
        ]),) ,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Theme.of(context).secondaryHeaderColor,),
        onPressed: () {
          context.pop(context);
        },
      ),),
      body: BlocProvider(
        create: (ctx)=>locator.get<OpportunitiesSavedBloc>()..add(LoadSavedOpportunitiesEvent()),
        child: BlocBuilder<OpportunitiesSavedBloc,OpportunitiesSavedState>(builder: (ctx,state){
        if (state is OpportunitySavedInProgress) {
          return Center(
            child: CircularProgressIndicator()
          );}
        
          if (state is SavedOpportunitiesLoadSuccess){
            return ListView.separated(itemCount: state.savedOpportunities.length,itemBuilder:(ctx,idx)=>opportunityCard(opportunity:state.savedOpportunities[idx],saved: true, ),separatorBuilder: (ctx,idx)=>SizedBox(height: 10.h,),);
          }
           if (state is OpportunitySavedSucces ){
            return ListView.separated(itemCount: state.savedOpportunities.length,itemBuilder:(ctx,idx)=>opportunityCard(opportunity:state.savedOpportunities[idx],saved: true, ),separatorBuilder: (ctx,idx)=>SizedBox(height: 10.h,),);
          }

          return Center(
            child: Text('No saved opportunities yet',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500
            ),),
          );
        }
        
        ),
      ),
    );
  }
}
