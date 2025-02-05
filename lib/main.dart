import 'package:app/features/autentication/application/pages/signup/maininfo_page.dart';
import 'package:app/features/autentication/application/pages/welcome_page.dart';
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
    BlocProvider(create: (_) => ThemeProviderBloc(), child: const MyApp()),
  );
}

GoRouter _router = GoRouter(initialLocation: '/welcome', routes: [
  GoRoute(
    path: '/welcome',
    pageBuilder: (context, state) => MaterialPage(child: WelcomePage()),
  ),
  GoRoute(
    path: '/SignUpMainInfoPage',
    pageBuilder: (context, state) => MaterialPage(child: SignUpMainInfoPage()),
  )
]);

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
