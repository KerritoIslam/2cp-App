

part of 'opportunities_bloc_bloc.dart';

abstract class OpportunitiesBlocState extends Equatable {
  const OpportunitiesBlocState();

  @override
  List<Object?> get props => [];
}
abstract class OpportunitiesSavedState extends Equatable {
  const OpportunitiesSavedState();

  @override
  List<Object?> get props => [];
}
class OpportunitiesSavedInitial extends OpportunitiesSavedState {
  const OpportunitiesSavedInitial();

  @override
  List<Object?> get props => [];
}
class OpportunitiesBlocInitial extends OpportunitiesBlocState {
  const OpportunitiesBlocInitial();

  @override
  List<Object?> get props => [];
}

class OpportuntitiesLoadInProgress extends OpportunitiesBlocState {
  const OpportuntitiesLoadInProgress({required this.opportunities});
  final List<Opportunity> opportunities;

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
class OpportunitySavedInProgress extends OpportunitiesSavedState {
  const OpportunitySavedInProgress();

  @override
  List<Object?> get props => [];
}
class OpportunitySavedSucces extends OpportunitiesSavedState {
  final List<Opportunity> savedOpportunities;
  const OpportunitySavedSucces(this.savedOpportunities,);

  @override
  List<Object?> get props => [savedOpportunities];
}
class OpportunitySavedFailure extends OpportunitiesSavedState {
  final String message;
  const OpportunitySavedFailure(this.message);

  @override
  List<Object?> get props => [message];
}
class SavedOpportunitiesLoadSuccess extends OpportunitiesSavedState {
  final List<Opportunity> savedOpportunities;
  const SavedOpportunitiesLoadSuccess(this.savedOpportunities,);

  @override
  List<Object?> get props => [savedOpportunities];
}
