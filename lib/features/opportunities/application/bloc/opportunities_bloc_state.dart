part of 'opportunities_bloc_bloc.dart';

abstract class OpportunitiesBlocState {}

 class OpportunitiesBlocInitial extends OpportunitiesBlocState {
  @override
  List<Object?> get props =>[];
}
class OpportuntitiesLoadInProgress extends OpportunitiesBlocState {
  @override
  List<Object?> get props => [];
}
class OpportuntitiesLoadSuccess extends OpportunitiesBlocState {
  final List<Opportunity> opportunities;
  OpportuntitiesLoadSuccess(this.opportunities);

  @override
  List<Object?> get props => [opportunities];}
class OpportuntitiesLoadFailure extends OpportunitiesBlocState {
  final String message;
  OpportuntitiesLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
