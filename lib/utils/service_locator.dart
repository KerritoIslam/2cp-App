import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/autentication/data/sources/remots/rest_auth_remote.dart';
import 'package:app/features/autentication/domain/auth_repository.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/data/source/remote_data_source.dart';
import 'package:app/features/opportunities/domain/opportunity_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;
void setUpLocator() {
  //auth
   locator.registerLazySingleton<RestAuthRemote>(()=>RestAuthRemote());
  locator.registerLazySingleton<LocalSecureStorage>(()=>
    LocalSecureStorage(FlutterSecureStorage(
      aOptions: const AndroidOptions(
        encryptedSharedPreferences: true
      )
    ))
  );
  locator.registerLazySingleton<AuthRepository>(()=>AuthRepository(restAuthRemote: locator.get<RestAuthRemote>(),localSecureStorage: locator.get<LocalSecureStorage>()));
  locator.registerFactory<AuthBloc>(()=>AuthBloc(locator.get<AuthRepository>()));
  //opportunities
  locator.registerLazySingleton<OpportunityRemoteSource>(()=>OpportunityRemoteSource());
  locator.registerLazySingleton<OpportunityRepository>(()=>OpportunityRepository(remoteSource: locator<OpportunityRemoteSource>()));
  locator.registerFactory<OpportunitiesBloc>(()=>OpportunitiesBloc(locator<OpportunityRepository>()));
  locator.registerFactory(() => OpportunitiesSavedBloc(locator<OpportunityRepository>()));
  
}
