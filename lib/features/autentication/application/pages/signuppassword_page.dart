import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/application/bloc/auth_events.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUpPasswordPage extends StatefulWidget {
  final Map<String, dynamic> user;
  const SignUpPasswordPage({super.key, required this.user});

  @override
  State<SignUpPasswordPage> createState() => _SignUpPasswordPageState();
}

bool _passwordObscure = true;
bool _confirmPasswordObscure = true;

bool _termsAndConditionsAccepted = false;

late TextEditingController passwordController;
late TextEditingController confirmPasswordController;

passwordValidator(value) {
  RegExp regExp =
      RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your Password';
  } else if (value.length < 8) {
    return 'the Password must be at least 8 characters';
  } else if (!regExp.hasMatch(value)) {
    return 'the Password must contain at least one uppercase letter,\n one lowercase letter, one number';
  }
  return null;
}

confirmPasswordValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your Confirm Password';
  } else if (value != passwordController.value.text) {
    return 'the Passwords do not match';
  }
  return null;
}

class _SignUpPasswordPageState extends State<SignUpPasswordPage> {
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    print(widget.user);

    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    if (_formKey.currentState != null) _formKey.currentState!.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leadingWidth: 150.w,
        scrolledUnderElevation: 0,
        leading: TextButton(
            onPressed: () {
              GoRouter.of(context).go('/auth/SignUpPage', extra: widget.user);
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                Text('Go Back', style: Theme.of(context).textTheme.titleSmall)
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 27.h,
            ),
            SizedBox(
                height: 300.h,
                width: 300.w,
                child: SvgPicture.asset('assets/images/signuppassword.svg')),
            Text('Enter The informations needed',
                style: Theme.of(context).textTheme.displaySmall),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                'Provide the following informations to create a  new\n account .',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _passwordObscure,
                          style: Theme.of(context).textTheme.bodyMedium,
                          validator: (value) => passwordValidator(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xFF9D9D9D),
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordObscure = !_passwordObscure;
                                });
                              },
                            ),
                            hintText: 'Password',
                            hintStyle: Theme.of(context).textTheme.labelMedium,
                            enabledBorder: Forms.regularBorder,
                            focusedBorder: Forms.regularBorder,
                            errorBorder: Forms.errorBorder,
                            focusedErrorBorder: Forms.errorBorder,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: _confirmPasswordObscure,
                          style: Theme.of(context).textTheme.bodyMedium,
                          validator: (value) => confirmPasswordValidator(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _confirmPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xFF9D9D9D)),
                              onPressed: () {
                                setState(() {
                                  _confirmPasswordObscure =
                                      !_confirmPasswordObscure;
                                });
                              },
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: Theme.of(context).textTheme.labelMedium,
                            enabledBorder: Forms.regularBorder,
                            focusedBorder: Forms.regularBorder,
                            errorBorder: Forms.errorBorder,
                            focusedErrorBorder: Forms.errorBorder,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 40),
                        child: Text(
                          'Your password must be 8+ characters with uppercase, lowercase, a number, and a special character',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Row(
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'i accept the ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  children: [
                                TextSpan(
                                    text: 'Terms and Conditions',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Theme.of(context)
                                                .primaryColor)),
                              ])),
                          Checkbox(
                              value: _termsAndConditionsAccepted,
                              fillColor: WidgetStateProperty.resolveWith(
                                  (states) => _termsAndConditionsAccepted
                                      ? Theme.of(context).primaryColor
                                      : Color(0xFF9D9D9D)),
                              onChanged: (value) {
                                setState(() {
                                  _termsAndConditionsAccepted = value!;
                                });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'please fill all the fields',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.red),
                              ),
                              backgroundColor: Theme.of(context)
                                  .snackBarTheme
                                  .backgroundColor,
                            ));
                          } else if (!_termsAndConditionsAccepted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'please accept the terms and conditions',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.red),
                              ),
                              backgroundColor: Theme.of(context)
                                  .snackBarTheme
                                  .backgroundColor,
                            ));
                          } else {
                            context.read<AuthBloc>().add(AuthSignUpRequested(
                                email: widget.user['email'],
                                password: passwordController.text,
                                name: widget.user['user_name']));
                            print(
                                'user_name: ${widget.user['user_name']}----------------------------------------');
                            print('email: ${widget.user['email']}');
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                Theme.of(context).primaryColor),
                            shape:
                                WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 55.h,
                          child: Text(
                            'Create My account',
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
      ),
    );
  }
}
