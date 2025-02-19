import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 100.w,
        actions: [
          TextButton(
              onPressed: () {
                GoRouter.of(context).go('/auth/LoginPage');
              },
              child: Text(
                'Sign in',
                style: Theme.of(context).textTheme.titleSmall,
              )),
        ],
        leading: TextButton(
            onPressed: () {
              GoRouter.of(context).go('/auth/SignUpPage');
            },
            child: Text(
              'Sign up',
              style: Theme.of(context).textTheme.titleSmall,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 27.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
              child: RichText(
                  text: TextSpan(
                      text: 'Welcome to ',
                      style: Theme.of(context).textTheme.displayMedium,
                      children: [
                    TextSpan(
                        text: 'App',
                        style: Theme.of(context).textTheme.displayMedium),
                    TextSpan(
                        text: 'name',
                        style: Theme.of(context).textTheme.titleMedium)
                  ])),
            ),
            Text(
                'Find personalized internship opportunities and take the next step in your career with ease!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: SvgPicture.asset(
                'assets/images/welcome.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RichText(
                text: TextSpan(
                    text: 'by continuing, you agree to our',
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      TextSpan(
                          text: ' User Agreement ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).primaryColor,
                                  decorationThickness: 2.5)),
                      TextSpan(
                          text: 'and acknowledge that \n you understand the',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: ' Privacy Policy.',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).primaryColor,
                                  decorationThickness: 2.5))
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 55),
              child: SizedBox(
                width: 300.w,
                child: ListTile(
                  title: Center(
                    child: Text(
                      'Continue with Google',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  visualDensity: VisualDensity(vertical: -4),
                  leading: SizedBox(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset('assets/icons/google.svg')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 55.w),
              child: SizedBox(
                width: 300.w,
                child: ListTile(
                  title: Center(
                    child: Text(
                      'Continue with Facebook',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  visualDensity: VisualDensity(vertical: -4),
                  leading: SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: SvgPicture.asset('assets/icons/facebook.svg')),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
