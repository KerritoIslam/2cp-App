import 'package:app/features/autentication/application/bloc/auth_state.dart';
import 'package:app/features/autentication/application/pages/login_page.dart';
import 'package:app/features/autentication/application/pages/noConnection.dart';
import 'package:app/features/autentication/application/pages/onboarding/onboarding_page.dart';
import 'package:app/features/autentication/application/pages/signup_page.dart';
import 'package:app/features/autentication/application/pages/signuppassword_page.dart';
import 'package:app/features/autentication/application/pages/welcome_page.dart';
import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/notifications/application/pages/notifications_page.dart';
import 'package:app/features/opportunities/application/pages/layout.dart';
import 'package:app/main.dart';
import 'package:app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/offline',
        pageBuilder: (context, state) => MaterialPage(child: Noconnection())),
    GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(child: OnboardingPage())),
    GoRoute(
      //This is to fix the bug of the redirect
      redirect: (ctx, state) => null,
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
                  user: state.extra == null
                      ? {"user_name": "", "email": ""}
                      : state.extra as Map<String, dynamic>,
                )),
            routes: [
              GoRoute(
                path: 'password',
                pageBuilder: (context, state) => MaterialPage(
                  child: SignUpPasswordPage(
                    user: state.extra as Map<String, dynamic>,
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
      redirect: (ctx, state) => null,
      path: '/protected',
      routes: [

        GoRoute(
            path: 'layout',
            pageBuilder: (context, state) => MaterialPage(child: Layout()),
      routes:[
          GoRoute(path: 'notifications', pageBuilder: (context, state) => MaterialPage(child: NotificationsPage())),
        ]

        ),
                       ],
    ),
  ],
  redirect: (context, state) async {
    if (state.fullPath=="/"){
    final localstorage=locator.get<LocalStorage>();
      final didViewWeclomePage=await localstorage.DidViewWelcomePage(); 
      if(didViewWeclomePage){
        return '/auth/welcome';
      }
    }
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
