import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/data/source/remote_data_source.dart';
import 'package:app/features/opportunities/domain/opportunity_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;
void setUpLocator() {
  //opportunities
  locator.registerLazySingleton<OpportunityRemoteSource>(()=>OpportunityRemoteSource());
  locator.registerLazySingleton<OpportunityRepository>(()=>OpportunityRepository(remoteSource: locator<OpportunityRemoteSource>()));
  locator.registerFactory<OpportunitiesBloc>(()=>OpportunitiesBloc(locator<OpportunityRepository>()));
  locator.registerFactory(() => OpportunitiesSavedBloc(locator<OpportunityRepository>()));
  
}
