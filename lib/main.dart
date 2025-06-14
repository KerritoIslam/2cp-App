import 'dart:io';

import 'package:app/features/applications%20status/application/bloc/applications_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_events.dart';
import 'package:app/features/chat/application/bloc/chat_search/chat_search_bloc.dart';
import 'package:app/features/chat/application/bloc/chats/chats_bloc.dart';
import 'package:app/features/chat/application/bloc/messages/messages_bloc.dart';
import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
import 'package:app/features/teams/application/bloc/teams_bloc.dart';
import 'package:app/utils/bloc/theme_provider_bloc.dart';
import 'package:app/utils/error.dart';
import 'package:app/utils/routes.config.dart';
import 'package:app/utils/service_locator.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forui/theme.dart';
import 'package:toastification/toastification.dart';

final authBloc = locator.get<AuthBloc>();

class BlocListenable extends ChangeNotifier implements Listenable {
  final AuthBloc bloc;
  BlocListenable(this.bloc) {
    bloc.stream.listen((state) {
      notifyListeners();
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the .env file asynchronously
  await dotenv.load();

  // Initialize Firebase asynchronously
  await _initializeFirebase();

  // Set up the service locator asynchronously
  await setUpLocator();

  // Run the app
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator.get<ApplicationBloc>()),
        BlocProvider(create: (_) => ThemeProviderBloc()),
        BlocProvider(create: (_) => locator.get<TeamsBloc>()),
        BlocProvider(create: (_) => authBloc),
        BlocProvider(create: (_) => locator.get<notificationsBloc>()),
        BlocProvider(create: (_) => locator.get<ChatsBloc>()),
        BlocProvider(create: (_) => locator.get<MessagesBloc>()),
        BlocProvider(create: (_) => locator.get<ChatSearchBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY_${_getPlatform()}']!,
      appId: dotenv.env['FIREBASE_APP_ID_${_getPlatform()}']!,
      messagingSenderId:
          dotenv.env['FIREBASE_MESSAGING_SENDER_ID_${_getPlatform()}']!,
      projectId: dotenv.env['FIREBASE_PROJECT_ID_${_getPlatform()}']!,
      storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_${_getPlatform()}']!,
      authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN_${_getPlatform()}'] ?? '',
      iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID_${_getPlatform()}'] ?? '',
    ),
  );
}

String _getPlatform() {
  if (kIsWeb) {
    return 'WEB';
  } else if (Platform.isAndroid) {
    return 'ANDROID';
  } else if (Platform.isIOS) {
    return 'IOS';
  } else if (Platform.isMacOS) {
    return 'MACOS';
  } else if (Platform.isWindows) {
    return 'WINDOWS';
  }

  return 'WEB'; // Default to Web
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      builder: (_, child) {
        authBloc.add(UserDataLoaded());
        return BlocBuilder<ThemeProviderBloc, ThemeProviderState>(
          builder: (context, state) {
            return FTheme(
              data: state is LightTheme
                  ? FThemes.green.light
                  : FThemes.green.dark,
              child: ToastificationWrapper(
                child: MaterialApp.router(
                  builder: (context, child) {
                    ErrorWidget.builder = (FlutterErrorDetails details) {
                      return CustomError(errorDetails: details, key: null);
                    };
                    return child!;
                  },
                  routerConfig: router,
                  debugShowCheckedModeBanner: false,
                  title: 'Step in',
                  themeMode:
                      (state is LightTheme) ? ThemeMode.light : ThemeMode.dark,
                  theme: theme.lightTheme,
                  darkTheme: theme.darkTheme,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
