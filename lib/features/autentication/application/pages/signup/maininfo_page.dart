import 'package:app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUpMainInfoPage extends StatefulWidget {
  const SignUpMainInfoPage({super.key});

  @override
  State<SignUpMainInfoPage> createState() => _SignUpMainInfoPageState();
}

bool _passwordVisible = false;
bool _confirmPasswordVisible = false;

class _SignUpMainInfoPageState extends State<SignUpMainInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                      Text('Go Back',
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  )),
              SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child:
                      SvgPicture.asset('assets/images/hero/signup_main.svg')),
              Text('Enter The informations needed',
                  style: Theme.of(context).textTheme.displaySmall),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Provide the following informations to create a  new\n account .',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          enabledBorder: Forms.regularBorder,
                          focusedBorder: Forms.regularBorder,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: TextFormField(
                        obscureText: true,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          enabledBorder: Forms.regularBorder,
                          focusedBorder: Forms.regularBorder,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: TextFormField(
                        obscureText: _passwordVisible,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          hintText: 'Password',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          enabledBorder: Forms.regularBorder,
                          focusedBorder: Forms.regularBorder,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: TextFormField(
                        obscureText: _confirmPasswordVisible,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_confirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordVisible =
                                    !_confirmPasswordVisible;
                              });
                            },
                          ),
                          hintText: 'Confirm Password',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          enabledBorder: Forms.regularBorder,
                          focusedBorder: Forms.regularBorder,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Your password must be 8+ characters with uppercase, lowercase, a number, and a special character',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'By clicking continue, you agree to our ',
                                style: Theme.of(context).textTheme.bodySmall,
                                children: [
                              TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold))
                            ])),
                        Checkbox(value: false, onChanged: (value) {}),
                        Text(
                          'I agree to the terms and conditions',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 55.h,
                        child: Text(
                          'Continue',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
