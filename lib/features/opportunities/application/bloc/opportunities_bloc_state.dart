

part of 'opportunities_bloc_bloc.dart';

abstract class OpportunitiesBlocState extends Equatable {
  const OpportunitiesBlocState();

  @override
  List<Object?> get props => [];
}

class OpportunitiesBlocInitial extends OpportunitiesBlocState {
  const OpportunitiesBlocInitial();

  @override
  List<Object?> get props => [];
}

class OpportuntitiesLoadInProgress extends OpportunitiesBlocState {
  const OpportuntitiesLoadInProgress();

  @override
  List<Object?> get props => [];
}

class OpportuntitiesLoadSuccess extends OpportunitiesBlocState {
  final List<Opportunity> opportunities;
  const OpportuntitiesLoadSuccess(this.opportunities);

  @override
  List<Object?> get props => [opportunities];
}

class OpportuntitiesLoadFailure extends OpportunitiesBlocState {
  final String message;
  const OpportuntitiesLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
class OpportunitySavedSucces extends OpportunitiesBlocState {
  final List<Opportunity> savedOpportunities;
  final List<Opportunity> opportunities;
  const OpportunitySavedSucces(this.savedOpportunities,this.opportunities);

  @override
  List<Object?> get props => [savedOpportunities,opportunities];
}
class OpportunitySavedFailure extends OpportunitiesBlocState{
  final String message;
  const OpportunitySavedFailure(this.message);

  @override
  List<Object?> get props => [message];
}
