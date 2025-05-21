part of 'applications_bloc.dart';

abstract class ApplicationEvent {}

class fetchApplicationsEvent extends ApplicationEvent {}

class submitApplicationEvent extends ApplicationEvent {
  final Application application;
  final File? file;
  final int? teamId;

  submitApplicationEvent(this.application, this.file, {this.teamId});
}

class submitTeamApplicationEvent extends ApplicationEvent {}

class deleteApplicationEvent extends ApplicationEvent {
  final int id;
  deleteApplicationEvent(this.id);
}
class refreshApplicationsEvent extends ApplicationEvent {
  refreshApplicationsEvent();
}
