import 'package:app/features/opportunities/application/pages/opporutnities_page.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/features/opportunities/domain/opportunity_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'opportunities_bloc_event.dart';
part 'opportunities_bloc_state.dart';

class OpportunitiesBloc extends Bloc<OpportunitiesBlocEvent, OpportunitiesBlocState> {
  final OpportunityRepository repository;
  //The current Page Number 
  int page=1;
  //Number of posts per Page
  int limit=5;
  //To check if we have reached the last page
  bool hasReachedMax=false;
  //number of pages before loading more data
 static int nextPageTrigger=4;
  List<Opportunity> opportunities=[];
  OpportunitiesBloc(this.repository) : super(OpportunitiesBlocInitial()) {
   on<LoadOpportunitiesEvent>((event, emit) async {
      // To not show the loading indicator on the whole page instead only below the list of already loaded posts
      emit(OpportuntitiesLoadInProgress(opportunities: opportunities));
      final result=await repository.getOpportunitiesPagination(page, limit);
      result.fold((failure){
        emit(OpportuntitiesLoadFailure(failure.message));
      }, (oppList){
       opportunities=List<Opportunity>.from(opportunities)..addAll(oppList); 
          if(oppList.length<limit){
        //Because the lastPage either have less number than the limit or when we fetch the next page it will be empty
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
       
    on<refreshOpportunitiesEvent>((event, emit) async {
      page=1;
      hasReachedMax=false;
      opportunities=[];
      add(LoadOpportunitiesEvent());
    });
  }

}
class OpportunitiesSavedBloc extends Bloc<OpportunitiesSavedEvent,OpportunitiesSavedState>{
  final OpportunityRepository repository;
 List<Opportunity> savedOpportunities=[];
  OpportunitiesSavedBloc(this.repository) : super(OpportunitiesSavedInitial()){
     on<SaveOpportunityEvent>((event, emit) async {
      if (savedOpportunities.any((element) => element.id==event.id)) {
        emit(OpportunitySavedFailure('Already Saved'));
        return;
      }
      final result=await repository.saveOpportunity(event.id);
      result.fold((failure){
        emit(OpportunitySavedFailure(failure.message));
      }, (opp){
        savedOpportunities.add(opp);
        emit(OpportunitySavedSucces(savedOpportunities));
      });
    });
    on<RemoveSavedOpportunityEvent>((event, emit) async {
      final result=await repository.removeSavedOpportunity(event.id);
      result.fold((failure){
        emit(OpportunitySavedFailure(failure.message));
      }, (unit){
        savedOpportunities.removeWhere((element) => element.id==event.id);
        emit(OpportunitySavedSucces(savedOpportunities));
      });
    });

    
  on<LoadSavedOpportunitiesEvent>((event, emit) async {
      emit(OpportunitySavedInProgress());
      final result=await repository.getSavedOpportunities();
      result.fold((failure){
        emit(OpportunitySavedFailure(failure.message));
      }, (oppList){
      savedOpportunities=List<Opportunity>.from(savedOpportunities)..addAll(oppList);
          emit(SavedOpportunitiesLoadSuccess(savedOpportunities));
      });
    });  

  }
}
