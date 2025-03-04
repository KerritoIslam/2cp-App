part of 'applications_bloc.dart';

abstract class ApplicationsState {}

 class ApplicationInitial extends ApplicationsState {}
class ApplictationsLoading extends ApplicationsState{}
class ApplicationsLoaded extends ApplicationsState{
  final List<Application> applications;

  ApplicationsLoaded(this.applications);
}
class ApplicationsError extends ApplicationsState{
  final String message;

  ApplicationsError(this.message);
}
