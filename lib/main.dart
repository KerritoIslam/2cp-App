import 'dart:io';

import 'package:app/features/autentication/application/pages/signup/maininfo_page.dart';
import 'package:app/features/autentication/application/pages/welcome_page.dart';
import 'package:app/firebase_options.dart';
import 'package:app/utils/bloc/theme_provider_bloc.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:(
    FirebaseOptions(
    
      apiKey: dotenv.env['FIREBASE_API_KEY_${_getPlatform()}']!,
      appId: dotenv.env['FIREBASE_APP_ID_${_getPlatform()}']!,
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_${_getPlatform()}']!,
      projectId: dotenv.env['FIREBASE_PROJECT_ID_${_getPlatform()}']!,
      storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_${_getPlatform()}']!,
      authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN_${_getPlatform()}'] ?? '',
      iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID_${_getPlatform()}'] ?? '',
)
  ) );
  runApp(
    BlocProvider(create: (_) => ThemeProviderBloc(), child: const MyApp()),
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
