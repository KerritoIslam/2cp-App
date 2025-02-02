part of 'opportunities_bloc_bloc.dart';

abstract class OpportunitiesBlocEvent {}
abstract class OpportunitiesSavedEvent{}
class LoadOpportunitiesEvent extends OpportunitiesBlocEvent {}
class CheckIfNeedMoreDataEvent extends OpportunitiesBlocEvent {
  final int index;
  CheckIfNeedMoreDataEvent(this.index);
}
class SaveOpportunityEvent extends OpportunitiesSavedEvent{
  final String id;
  SaveOpportunityEvent(this.id);
}
class RemoveSavedOpportunityEvent extends OpportunitiesSavedEvent{
  final String id;
  RemoveSavedOpportunityEvent(this.id); 
}
class LoadSavedOpportunitiesEvent extends OpportunitiesSavedEvent{
  LoadSavedOpportunitiesEvent();
}
