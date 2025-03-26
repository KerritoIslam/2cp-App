// ignore_for_file: constant_identifier_names

import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/application/widgets/opportunity_card.dart';
import 'package:app/shared/widgets/loadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 enum OppType{
  Internships,
  Problems,
none,
 }

class OpporutnitiesPage extends StatelessWidget {
  const OpporutnitiesPage({super.key});

    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 10.h),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<OpportunitiesBloc>().add(refreshOpportunitiesEvent());
        },
        child: BlocBuilder<OpportunitiesBloc, OpportunitiesBlocState>(
          builder: (context, state) {
            if (state is OpportunitiesBlocInitial) {
              context.read<OpportunitiesBloc>().add(LoadOpportunitiesEvent());
              return Center(child: Loadingindicator());
            }
            return CustomScrollView(
              slivers: [
                // Header Section
                //SliverToBoxAdapter(
                //  child: Column(
                //    crossAxisAlignment: CrossAxisAlignment.start,
                //    children: [
                //      // Your header widgets here
                //      RichText(
                //        text: TextSpan(
                //          text: 'Opportunities ',
                //          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                //                fontWeight: FontWeight.w800,
                //                color: Theme.of(context).primaryColor,
                //              ),
                //          children: [
                //            TextSpan(
                //              text: "For You",
                //              style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
                //            ),
                //          ],
                //        ),
                //      ),
                //      SizedBox(height: 10.h),
                //      SizedBox(
                //        height: 169.h,
                //        child: ListView.separated(
                //          scrollDirection: Axis.horizontal,
                //          itemBuilder: (ctx, idx) => OpportunityType(
                //            name: Types[idx]['name'] as String,
                //            imagePath: Types[idx]['imagePath'] as String,
                //            onTap: Types[idx]['onTap'] as VoidCallback,
                //            isSelected: Types[idx]['name'] == selectedType.name,
                //          ),
                //          separatorBuilder: (ctx, idx) => SizedBox(width: 17.w),
                //          itemCount: Types.length,
                //        ),
                //      ),
                //    ],
                //  ),
                //),
                //
                // Opportunities List
                if (state is OpportuntitiesLoadInProgress || state is OpportuntitiesLoadSuccess) 
  SliverList(
    delegate: SliverChildBuilderDelegate(
      (ctx, idx) {
        // Extract common state pattern to avoid repeated checks
        final opportunities = state is OpportuntitiesLoadSuccess 
            ? (state).opportunities
            : (state as OpportuntitiesLoadInProgress).opportunities;
            
        // Pagination logic - only needed for success state
        if (state is OpportuntitiesLoadSuccess && 
            idx >= opportunities.length - OpportunitiesBloc.nextPageTrigger) {
          context.read<OpportunitiesBloc>().add(CheckIfNeedMoreDataEvent(idx));
        }
        
        // Simplified return since both states render the same card
        return opportunityCard(
          opportunity: opportunities[idx],
        );
      },
      // Simplified childCount calculation
      childCount: state is OpportuntitiesLoadSuccess || state is OpportuntitiesLoadInProgress
          ? (state is OpportuntitiesLoadSuccess 
              ? (state).opportunities.length
              : (state as OpportuntitiesLoadInProgress).opportunities.length)
          : 0,
    ),
  ),
                // Loading Indicator at the End (only if loading)
                if (state is OpportuntitiesLoadInProgress)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Center(child: Loadingindicator()),
                    ),
                  ),

                // Error State
                if (state is OpportuntitiesLoadFailure)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text(state.message),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
