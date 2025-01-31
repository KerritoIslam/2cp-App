part of 'opportunities_bloc_bloc.dart';

abstract class OpportunitiesBlocEvent {}
class LoadOpportunitiesEvent extends OpportunitiesBlocEvent {}
class CheckIfNeedMoreDataEvent extends OpportunitiesBlocEvent {
  final int index;
  CheckIfNeedMoreDataEvent(this.index);
}
