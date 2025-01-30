import 'package:app/features/autentication/application/pages/welcome_page.dart';
import 'package:app/utils/bloc/theme_provider_bloc.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => ThemeProviderBloc(context: context), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeProviderBloc,ThemeProviderState>(
      
      builder: (context,state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '2CP App',
          theme: state is LightTheme ? theme.lightTheme : theme.darkTheme,
          home: WelcomePage(),
        );
      }
    );
  }
}
