import 'dart:io';
import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/application/bloc/auth_state.dart';
import 'package:app/features/autentication/application/pages/login_page.dart';
import 'package:app/features/autentication/application/pages/signup_page.dart';
import 'package:app/features/autentication/application/pages/signuppassword_page.dart';
import 'package:app/features/autentication/application/pages/welcome_page.dart';
import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/autentication/data/sources/remots/rest_auth_remote.dart';
import 'package:app/features/autentication/domain/auth_repository.dart';
import 'package:app/features/autentication/domain/entities/user_entity.dart';
import 'package:app/features/opportunities/application/pages/layout.dart';
import 'package:app/utils/bloc/theme_provider_bloc.dart';
import 'package:app/utils/service_locator.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forui/forui.dart' as fr;
import 'package:go_router/go_router.dart';


final authBloc=locator.get<AuthBloc>();
class BlocListenable extends ChangeNotifier implements Listenable {
  final AuthBloc bloc;

  BlocListenable(this.bloc) {
    bloc.stream.listen((state) {
      notifyListeners();
    });
  }
}

void main() async {
  
  setUpLocator();
    await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();
    

  await Firebase.initializeApp(
      options: (FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_${_getPlatform()}']!,
    appId: dotenv.env['FIREBASE_APP_ID_${_getPlatform()}']!,
    messagingSenderId:
        dotenv.env['FIREBASE_MESSAGING_SENDER_ID_${_getPlatform()}']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID_${_getPlatform()}']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_${_getPlatform()}']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN_${_getPlatform()}'] ?? '',
    iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID_${_getPlatform()}'] ?? '',
  )));
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ThemeProviderBloc()),
      BlocProvider(create: (_) {
        return authBloc      ;}),
    ], child: MyApp()),
  );
}

GoRouter _router = GoRouter(
  initialLocation: '/auth/welcome',
  routes: [
    GoRoute(
      pageBuilder: (context, state) => MaterialPage(child: Text("auth")),
      path: '/auth',
      routes: [
        GoRoute(
            path: 'welcome',
            pageBuilder: (context, state) =>
                MaterialPage(child: WelcomePage())),
        GoRoute(
            path: 'SignUpPage',
            pageBuilder: (context, state) => MaterialPage(
                    child: SignUpPage(
                  user: /* state.extra == null
                      \? User(id: 0, name: '', email: '')
                      :  */
                      state.extra as User,
                )),
            routes: [
              GoRoute(
                path: 'password',
                pageBuilder: (context, state) => MaterialPage(
                  child: SignUpPasswordPage(
                    user: state.extra as User,
                  ),
                ),
              )
            ]),
        GoRoute(
            path: 'LoginPage',
            pageBuilder: (context, state) => MaterialPage(child: LogInPage())),
      ],
    ),
    GoRoute(
      pageBuilder: (context, state) => MaterialPage(child: Text("protected")),
      path: '/protected',
      routes: [
        GoRoute(
            path: 'layout',
            pageBuilder: (context, state) => MaterialPage(child: Layout())),
      ],
    ),
  ],
  redirect: (context, state) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    if (state.fullPath!.startsWith('/auth') &&
        authBloc.state is Authenticated) {
      return '/protected/layout';
    } else if (state.fullPath!.startsWith('/protected') &&
        authBloc.state is Unauthenticated) {
      return '/auth/welcome';
    }
    return null;
  },
  refreshListenable: BlocListenable(authBloc),
);

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
          return BlocBuilder<ThemeProviderBloc, ThemeProviderState>(
              builder: (context, state) {
            return MaterialApp.router(
              builder: (context, child) => fr.FTheme(
      data:state is LightTheme ? fr.FThemes.green.light : fr.FThemes.green.light,
      child: child!,
    ),
              routerConfig: _router,
              debugShowCheckedModeBanner: false,
              title: '2CP App',
              theme: state is LightTheme ? theme.lightTheme : theme.darkTheme,
            );
          });
        });
  }
}
