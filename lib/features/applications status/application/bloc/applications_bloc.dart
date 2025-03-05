
import 'package:app/features/applications%20status/domain/ApplicationsRepository.dart';
import 'package:app/features/applications%20status/domain/entities/application.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'applications_event.dart';
part 'applications_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationsState> {
  final Applicationsrepository repository;
  
  ApplicationBloc(this.repository) : super(ApplicationInitial()) {
    on<fetchApplicationsEvent>((event, emit) async {
      emit(ApplictationsLoading());
      try {
        final res= await repository.getApplications();
       return res.fold((l)=>emit(ApplicationsError(l.message)), (r)=>emit(ApplicationsLoaded(r)));

      } catch (e) {
        emit(ApplicationsError(e.toString()));
      }
    });
    on<submitApplicationEvent>((event, emit) async {
      emit(ApplictationsLoading());
      try {
        final res= await repository.submitApplication(event.application);

        //TODO do something here
      } catch (e) {
        emit(ApplicationsError(e.toString()));
      }
    });
  }
}
