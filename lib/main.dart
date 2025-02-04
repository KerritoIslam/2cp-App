import 'package:app/features/autentication/application/bloc/auth_bolc.dart';
import 'package:app/features/autentication/application/bloc/auth_state.dart';
import 'package:app/features/autentication/application/pages/signup_page.dart';
import 'package:app/features/autentication/application/pages/welcome_page.dart';
import 'package:app/features/autentication/data/remots/rest_auth_remote.dart';
import 'package:app/features/autentication/domain/auth_repository.dart';
import 'package:app/firebase_options.dart';
import 'package:app/utils/bloc/theme_provider_bloc.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ThemeProviderBloc()),
      BlocProvider(
          create: (_) =>
              AuthBolc(AuthRepository(restAuthRemote: RestAuthRemote()))),
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
            path: 'SignUpMainInfoPage',
            pageBuilder: (context, state) =>
                MaterialPage(child: SignUpMainInfoPage()),
          ),
        ],
      ),
      GoRoute(
        pageBuilder: (context, state) => MaterialPage(child: Text("protected")),
        path: '/protected',
        routes: [
          GoRoute(
              path: 'home',
              pageBuilder: (context, state) =>
                  MaterialPage(child: Text('home'))),
        ],
      ),
    ],
    redirect: (context, state) {
      final authState = context.read<AuthBolc>().state;
      if (authState is Authenticated && state.path!.startsWith('/auth')) {
        return '/protected/home';
      } else if (authState is Unauthenticated &&
          state.path!.contains('/protected')) {
        return '/auth/welcome';
      }
      return null;
    });

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
              routerConfig: _router,
              debugShowCheckedModeBanner: false,
              title: '2CP App',
              theme: state is LightTheme ? theme.lightTheme : theme.darkTheme,
            );
          });
        });
  }
}
