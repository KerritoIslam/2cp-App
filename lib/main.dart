import 'dart:io';
import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/notifications/application/bloc/notifications_bloc.dart';
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
  
  //runApp(SplachScreen());
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  //Load the .env file
  //final isOnline=await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    await dotenv.load();

  //Ensure flutter Engine is initialized
    

  //Initialize Firebase
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
  //Run app
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ThemeProviderBloc()),
      BlocProvider(create: (_) {
        return authBloc      ;}),
      BlocProvider(create: (_) => locator.get<notificationsBloc>()
      )
    ], child: MyApp()),
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

//class SplachScreen extends StatelessWidget {
//  const SplachScreen({super.key});
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        body: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//
//              children: [
//                AppLogo(),
//
//                RichText(text: TextSpan(
//                  children: [
//                   TextSpan(text:"Opportunities",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                    color: Theme.of(context).primaryColor,
//                    fontWeight: FontWeight.w700),),
//                    TextSpan(text: ' ?',style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                    color: Theme.of(context).secondaryHeaderColor,
//                    fontWeight: FontWeight.w700),),
//                  ],
//                  text: 'Searching for new',
//                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                    color: Theme.of(context).secondaryHeaderColor,
//                    fontWeight: FontWeight.w700),),
//
//                ),
//
//
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(440, 956),
        builder: (_, child) {
          return BlocBuilder<ThemeProviderBloc, ThemeProviderState>(
              builder: (context, state) {
            return FTheme(
              data: state is LightTheme ? FThemes.green.light : FThemes.green.dark,
              child: MaterialApp.router(
                
                builder: (context, child){
                  ErrorWidget.builder= (FlutterErrorDetails details) {
                    return  CustomError( errorDetails: details, key: null,);                  
                  };
                  return child!;
                }  ,             routerConfig: router,
                debugShowCheckedModeBanner: false,
                title: 'Step in',
                theme: state is LightTheme ? theme.lightTheme : theme.darkTheme,
              ),
            );
          });
        });
  }
}
