import 'package:app/core/connection/connection_Checker.dart';
import 'package:app/features/Search/application/bloc/search_bloc.dart';
import 'package:app/features/Search/data/source/remote/SearchRemoteDataSource.dart';
import 'package:app/features/Search/domain/repositories/search_repostitory.dart';
import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/autentication/domain/auth_repository.dart';
import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/notifications/data/source/remote/remoteDataSource.dart';
import 'package:app/features/notifications/domain/repositories/notification_repository.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/data/source/remote_data_source.dart';
import 'package:app/features/opportunities/domain/opportunity_repository.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app/features/autentication/data/sources/remote/rest_auth_remote.dart';

final GetIt locator = GetIt.instance;
Future<void> setUpLocator() async{
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
  //Welcome page
  final SharedPreferences _sharedPreferences=await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(()=>_sharedPreferences);
  locator.registerLazySingleton<LocalStorage>(()=>LocalStorage(locator.get<SharedPreferences>()));
  locator.registerFactory<AuthBloc>(()=>AuthBloc(locator.get<AuthRepository>()));
  //opportunities
  locator.registerLazySingleton<OpportunityRemoteSource>(()=>OpportunityRemoteSource());
  locator.registerLazySingleton<OpportunityRepository>(()=>OpportunityRepository(remoteSource: locator<OpportunityRemoteSource>()));
  locator.registerFactory<OpportunitiesBloc>(()=>OpportunitiesBloc(locator<OpportunityRepository>()));
  locator.registerFactory(() => OpportunitiesSavedBloc(locator<OpportunityRepository>()));
  
  //Connection Checker
  locator.registerLazySingleton<NetworkInfoImpl>(()=>NetworkInfoImpl(DataConnectionChecker()));
  //Notifications
  locator.registerLazySingleton<NotificationRemoteDataSource>(()=>NotificationRemoteDataSource());
  locator.registerLazySingleton<NotificationRepository>(()=>NotificationRepository(locator.get<NotificationRemoteDataSource>()));
  locator.registerFactory<notificationsBloc>(()=>notificationsBloc(locator.get<NotificationRepository>()));
  //Search
  locator.registerLazySingleton<Searchremotedatasource>(()=>Searchremotedatasource());
  locator.registerLazySingleton<SearchRepostitory>(()=>SearchRepostitory(remoteDataSource: locator.get<Searchremotedatasource>()));
  locator.registerFactory<SearchBloc>(()=>SearchBloc(locator.get<SearchRepostitory>()));
}
