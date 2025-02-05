import 'package:app/features/autentication/application/bloc/auth_bolc.dart';
import 'package:app/features/autentication/application/pages/signup_page.dart';
import 'package:app/features/autentication/application/pages/welcome_page.dart';
import 'package:app/features/autentication/data/sources/remots/rest_auth_remote.dart';
import 'package:app/features/autentication/domain/auth_repository.dart';
import 'package:app/firebase_options.dart';
import 'package:app/utils/bloc/theme_provider_bloc.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final AuthBolc authBolc =
    AuthBolc(AuthRepository(restAuthRemote: RestAuthRemote()));

class BlocListenable<AuthBloc> extends ChangeNotifier implements Listenable {
  final AuthBolc bloc;

  BlocListenable(this.bloc) {
    bloc.stream.listen((state) {
      notifyListeners();
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ThemeProviderBloc()),
      BlocProvider(create: (_) {
        return authBolc;
      }),
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
          pageBuilder: (context, state) => MaterialPage(child: SignUpPage()),
        ),
      ],
    ),
    GoRoute(
      pageBuilder: (context, state) => MaterialPage(child: Text("protected")),
      path: '/protected',
      routes: [
        GoRoute(
            path: 'home',
            pageBuilder: (context, state) => MaterialPage(child: Text('home'))),
      ],
    ),
  ],
  redirect: (context, state) {
    print(state.matchedLocation);
    return null;
    // final authState = context.read<AuthBolc>().state;
    // if (authState is Authenticated && state.fullPath!.contains('/auth')) {
    //   return '/protected/home';
    // } else if (authState is Unauthenticated &&
    //     state.fullPath!.contains('/protected')) {
    //   return '/auth/welcome';
    // }
    // return null;
  },
  refreshListenable: BlocListenable(authBolc),
);

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
