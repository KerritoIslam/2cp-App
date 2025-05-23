import 'dart:io';

import 'package:app/features/applications%20status/domain/ApplicationsRepository.dart';
import 'package:app/features/applications%20status/domain/entities/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

part 'applications_event.dart';
part 'applications_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationsState> {
  final Applicationsrepository repository;
  final List<Application> applications = [];

  ApplicationBloc(this.repository) : super(ApplicationInitial()) {
    on<refreshApplicationsEvent>((event, emit) async {
      emit(ApplictationsLoading());
      try {
        final res = await repository.getApplications();
        return res.fold((l) => emit(ApplicationsError(l.message)), (r) {
          applications.clear();
          applications.addAll(r);
          emit(ApplicationsLoaded(applications));
        });
      } catch (e, stk) {
        print(stk);
        emit(ApplicationsError(e.toString()));
      }
    });
    on<fetchApplicationsEvent>((event, emit) async {
      emit(ApplictationsLoading());
      try {
        final res = await repository.getApplications();
        return res.fold((l) => emit(ApplicationsError(l.message)), (r) {
          print('Here');
          applications.addAll(r);
          emit(ApplicationsLoaded(applications));
        });
      } catch (e, stk) {
        print(stk);
        emit(ApplicationsError(stk.toString()));
      }
    });
    on<deleteApplicationEvent>((event, emit) async {
      // final res = await repository.deleteApplication(event.id);
      // return res.fold((l) => emit(ApplicationsError(l.message)), (r) {
      //           });
      emit(ApplictationsLoading());
      final res = await repository.deleteApplication(event.id);
      return res.fold((l) {
        applications.clear();
        toastification.show(
          title: Text(l.message),
          type: ToastificationType.error,
        );
        return emit(ApplicationsError(l.message));
      }, (r) {
        toastification.show(
          title: Text('Application Deleted'),
          type: ToastificationType.success,
        );
        applications.removeWhere((element) => element.id == event.id);
        return emit(ApplicationsLoaded([...applications]));
      });
    });
    on<submitApplicationEvent>((event, emit) async {
      emit(ApplictationsLoading());
      try {
        print('Submitting');
        final res = await repository.submitApplication(
            event.application, event.file, event.teamId);
        return res.fold((l) {
          toastification.show(
            title: Text(l.message),
            type: ToastificationType.error,
          );
          return emit(ApplicationsError(l.message));
        }, (r) {
          toastification.show(
            title: Text('Application Submitted'),
            type: ToastificationType.success,
          );
          emit(ApplicationsLoaded(applications));
        });

        //TODO do something here
      } catch (e) {
        emit(ApplicationsError(e.toString()));
      }
    });
  }
}
