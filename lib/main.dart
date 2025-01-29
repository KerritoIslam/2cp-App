import 'package:app/features/autantication/application/pages/welcome_page.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2CP App',
      theme: them.lightTheme,
      home: WelcomePage(),
    );
  }
}
