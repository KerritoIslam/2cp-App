import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/features/opportunities/domain/opportunity_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'opportunities_bloc_event.dart';
part 'opportunities_bloc_state.dart';

class OpportunitiesBlocBloc extends Bloc<OpportunitiesBlocEvent, OpportunitiesBlocState> {
  final OpportunityRepository repository;
  //The current Page Number 
  int page=1;
  //Number of posts per Page
  int limit=15;
  //To check if we have reached the last page
  bool hasReachedMax=false;
  //number of pages before loading more data
  int nextPageTrigger=4;
  List<Opportunity> opportunities=[];
  OpportunitiesBlocBloc(this.repository) : super(OpportunitiesBlocInitial()) {
   on<LoadOpportunitiesEvent>((event, emit) async {
      // To show the loading indicator on the whole page instead only below the list of already loaded posts
      if (opportunities.isEmpty) {
        emit(OpportuntitiesLoadInProgress());
      }
      final result=await repository.getOpportunitiesPagination(page, limit);
      result.fold((failure){
        emit(OpportuntitiesLoadFailure(failure.message));
      }, (oppList){
        opportunities.addAll(oppList);
        if(oppList.length<limit){
          hasReachedMax=true;
        }
        emit(OpportuntitiesLoadSuccess(opportunities));
      });
       }
    );
 on<CheckIfNeedMoreDataEvent>((event, emit) async {
      if(!hasReachedMax){
        page++;
        add(LoadOpportunitiesEvent());
      }
    });
  }
}

