import 'package:app/features/Search/application/bloc/search_bloc.dart';
import 'package:app/features/Search/data/source/remote/SearchRemoteDataSource.dart';
import 'package:app/features/Search/domain/repositories/search_repostitory.dart';
import 'package:app/features/applications%20status/application/bloc/applications_bloc.dart';
import 'package:app/features/applications%20status/data/remote/remote_data_source.dart';
import 'package:app/features/applications%20status/domain/ApplicationsRepository.dart';
import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/autentication/domain/auth_repository.dart';
import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/notifications/data/source/remote/remoteDataSource.dart';
import 'package:app/features/notifications/domain/repositories/notification_repository.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/data/source/remote_data_source.dart';
import 'package:app/features/opportunities/domain/opportunity_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/features/autentication/data/sources/remote/rest_auth_remote.dart';

final GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  // Auth
  locator.registerLazySingleton<RestAuthRemote>(() => RestAuthRemote());
  locator.registerLazySingleton<LocalSecureStorage>(() => LocalSecureStorage(
        FlutterSecureStorage(
            aOptions: const AndroidOptions(encryptedSharedPreferences: true),
            iOptions: IOSOptions(
                accountName: '2CP',
                accessibility: KeychainAccessibility.passcode)),
      ));
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository(
        restAuthRemote: locator.get<RestAuthRemote>(),
        localSecureStorage: locator.get<LocalSecureStorage>(),
      ));

  // Shared Preferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  locator.registerLazySingleton<LocalStorage>(
      () => LocalStorage(locator.get<SharedPreferences>()));

  // Auth Bloc
  locator
      .registerFactory<AuthBloc>(() => AuthBloc(locator.get<AuthRepository>()));

  // Opportunities
  locator.registerLazySingleton<OpportunityRemoteSource>(
      () => OpportunityRemoteSource());
  locator.registerLazySingleton<OpportunityRepository>(() =>
      OpportunityRepository(
          remoteSource: locator.get<OpportunityRemoteSource>()));
  locator.registerFactory<OpportunitiesBloc>(
      () => OpportunitiesBloc(locator.get<OpportunityRepository>()));
  locator.registerFactory(
      () => OpportunitiesSavedBloc(locator.get<OpportunityRepository>()));

  // Notifications
  locator.registerLazySingleton<NotificationRemoteDataSource>(
      () => NotificationRemoteDataSource());
  locator.registerLazySingleton<NotificationRepository>(() =>
      NotificationRepository(locator.get<NotificationRemoteDataSource>()));
  locator.registerFactory<notificationsBloc>(
      () => notificationsBloc(locator.get<NotificationRepository>()));
  //applications
  locator.registerLazySingleton<RemoteDataSource>(()=>RemoteDataSource());
  locator.registerLazySingleton<Applicationsrepository>(()=>Applicationsrepository(locator.get<RemoteDataSource>()));
  locator.registerFactory<ApplicationBloc>(()=>ApplicationBloc(locator.get<Applicationsrepository>()));

  // Search
  locator.registerLazySingleton<Searchremotedatasource>(
      () => Searchremotedatasource());
  locator.registerLazySingleton<SearchRepository>(() => SearchRepository(
      remoteDataSource: locator.get<Searchremotedatasource>()));
  locator.registerFactory<SearchBloc>(
      () => SearchBloc(locator.get<SearchRepository>()));
}
