import 'package:app/core/dioservices/dio.dart';
import 'package:app/features/Search/application/bloc/search_bloc.dart';
import 'package:app/features/Search/data/source/remote/SearchRemoteDataSource.dart';
import 'package:app/features/Search/domain/repositories/search_repostitory.dart';
import 'package:app/features/applications%20status/application/bloc/applications_bloc.dart';
import 'package:app/features/applications%20status/data/remote/remote_data_source.dart';
import 'package:app/features/applications%20status/domain/ApplicationsRepository.dart';
import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/authentication/data/sources/remote/rest_auth_remote.dart';
import 'package:app/features/authentication/domain/auth_repository.dart';
import 'package:app/features/chat/application/bloc/chat_search/chat_search_bloc.dart';
import 'package:app/features/chat/application/bloc/chats/chats_bloc.dart';
import 'package:app/features/chat/application/bloc/messages/messages_bloc.dart';
import 'package:app/features/chat/data/remote/chat_list_remote_data_source.dart';
import 'package:app/features/chat/data/remote/chat_remote_data_source.dart';
import 'package:app/features/chat/data/remote/ws.service.dart';
import 'package:app/features/chat/data/remote/chat_search_rest_remote.dart';
import 'package:app/features/chat/domain/repositories/chat_search_repository.dart';
import 'package:app/features/chat/domain/repositories/chat_list_repository.dart';
import 'package:app/features/chat/domain/repositories/chat_repository.dart';
import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/notifications/data/source/remote/remoteDataSource.dart';
import 'package:app/features/notifications/domain/repositories/notification_repository.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/data/source/remote_data_source.dart';
import 'package:app/features/opportunities/domain/opportunity_repository.dart';
import 'package:app/features/profile/data/source/remote/profile_remote_data_source.dart';
import 'package:app/features/profile/domain/profile_repository.dart';
import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:app/features/teams/data/sources/teams_rest_remote.dart';
import 'package:app/features/teams/domain/teams_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        localStorage: locator.get<LocalStorage>(),
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
  locator.registerFactory<AuthBloc>(() => AuthBloc(
        authRepository: locator.get<AuthRepository>(),
        localSecureStorage: locator.get<LocalSecureStorage>(),
        localStorage: locator.get<LocalStorage>(),
      ));

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
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
  locator.registerLazySingleton<Applicationsrepository>(
      () => Applicationsrepository(locator.get<RemoteDataSource>()));
  locator.registerFactory<ApplicationBloc>(
      () => ApplicationBloc(locator.get<Applicationsrepository>()));

  // Search
  locator.registerLazySingleton<Searchremotedatasource>(
      () => Searchremotedatasource());
  locator.registerLazySingleton<SearchRepository>(() => SearchRepository(
      remoteDataSource: locator.get<Searchremotedatasource>()));
  locator.registerFactory<SearchBloc>(
      () => SearchBloc(locator.get<SearchRepository>()));
  // teams
  locator.registerLazySingleton<TeamsRestRemote>(() => TeamsRestRemote());
  locator.registerLazySingleton<TeamsRepository>(
      () => TeamsRepository(locator.get<TeamsRestRemote>()));
  locator.registerFactory<TeamsBloc>(
      () => TeamsBloc(locator.get<TeamsRepository>()));
  // chat
  locator.registerLazySingleton<ChatListRemoteDataSource>(
      () => ChatListRemoteDataSource());
  locator.registerLazySingleton<ChatListRepository>(() => ChatListRepository(
        locator.get<ChatListRemoteDataSource>(),
      ));
  locator.registerFactory<ChatsBloc>(() => ChatsBloc(
        locator.get<ChatListRepository>(),
      ));
  // messages
  locator.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSource());
  locator.registerLazySingleton<ChatRepository>(() => ChatRepository(
        locator.get<ChatRemoteDataSource>(),
      ));
  locator.registerLazySingleton<WsService>(() => WsService());
  locator.registerFactory<MessagesBloc>(() => MessagesBloc(
        locator.get<WsService>(),
        locator.get<ChatRepository>(),
      ));

  // Chat Search
  locator.registerLazySingleton<ChatSearchRemote>(
    () => ChatSearchRemote(),
  );
  locator.registerLazySingleton<ChatSearchRepository>(
    () => ChatSearchRepository(locator.get<ChatSearchRemote>()),
  );
  locator.registerFactory<ChatSearchBloc>(
    () => ChatSearchBloc(locator.get<ChatSearchRepository>()),
  );
  // Profile
  locator.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSource());
  locator.registerLazySingleton<ProfileRepository>(
      () => ProfileRepository(locator.get<ProfileRemoteDataSource>()));
}
