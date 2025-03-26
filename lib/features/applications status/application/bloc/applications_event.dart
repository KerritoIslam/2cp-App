part of 'applications_bloc.dart';

abstract class ApplicationEvent {}

class fetchApplicationsEvent extends ApplicationEvent {}

class submitApplicationEvent extends ApplicationEvent {
  final Application application;

  submitApplicationEvent(this.application);
}

class submitTeamApplicationEvent extends ApplicationEvent {}

class deleteApplicationEvent extends ApplicationEvent {
  final String id;
  deleteApplicationEvent(this.id);
}
