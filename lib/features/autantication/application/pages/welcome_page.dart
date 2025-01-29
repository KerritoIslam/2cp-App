import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign in',
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                ],
              ),
              RichText(
                  text: TextSpan(
                      text: 'Welcome to ',
                      style: Theme.of(context).textTheme.titleLarge,
                      children: [
                    TextSpan(
                        text: 'App',
                        style: Theme.of(context).textTheme.titleLarge),
                    TextSpan(
                        text: 'name',
                        style: Theme.of(context).textTheme.titleLarge)
                  ])),
              SvgPicture.asset(
                'assets/images/hero/welcome.svg',
              ),
            ],
          ),
        )),
      ),
    );
  }
}
