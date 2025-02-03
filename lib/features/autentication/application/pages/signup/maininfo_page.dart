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

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool TermsAndConditionsAccepted = false;
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
nameValidator(value) {
  RegExp regExp = RegExp(r'^[a-zA-Z ]+$');
  if (value == null || value.isEmpty) {
    return 'Please enter your Name';
  } else if (value.length < 3) {
    return 'the Name must be at least 3 characters';
  } else if (value.length > 20) {
    return 'the Name must be less than 20 characters';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid Name';
  }
  return null;
}

emailValidator(value) {
  RegExp regExp = RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+');
  if (value == null || value.isEmpty) {
    return 'Please enter your Email';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid Email';
  }
  return null;
}

passwordValidator(value) {
  RegExp regExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*()_+])[A-Za-z\d!@#\$%^&*()_+]{8,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your Password';
  } else if (value.length < 8) {
    return 'the Password must be at least 8 characters';
  } else if (!regExp.hasMatch(value)) {
    return 'the Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
  }
  return null;
}

confirmPasswordValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your Confirm Password';
  } else if (value != passwordController.text) {
    return 'the Passwords do not match';
  }
  return null;
}

class _SignUpMainInfoPageState extends State<SignUpMainInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
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
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: TextFormField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              validator: (value) => nameValidator(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
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
                              style: Theme.of(context).textTheme.bodyMedium,
                              validator: (value) => emailValidator(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
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
                              obscureText: _passwordVisible,
                              style: Theme.of(context).textTheme.bodyMedium,
                              validator: (value) => passwordValidator(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Color(0xFF9D9D9D),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                hintText: 'Password',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
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
                              obscureText: _confirmPasswordVisible,
                              style: Theme.of(context).textTheme.bodyMedium,
                              validator: (value) =>
                                  confirmPasswordValidator(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      _confirmPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color(0xFF9D9D9D)),
                                  onPressed: () {
                                    setState(() {
                                      _confirmPasswordVisible =
                                          !_confirmPasswordVisible;
                                    });
                                  },
                                ),
                                hintText: 'Confirm Password',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                enabledBorder: Forms.regularBorder,
                                focusedBorder: Forms.regularBorder,
                                errorBorder: Forms.errorBorder,
                                focusedErrorBorder: Forms.errorBorder,
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
                                      text: 'i accept the ',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      children: [
                                    TextSpan(
                                        text: 'Terms and Conditions',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    Theme.of(context)
                                                        .primaryColor)),
                                  ])),
                              Checkbox(
                                  value: TermsAndConditionsAccepted,
                                  fillColor: WidgetStateProperty.resolveWith(
                                      (states) => TermsAndConditionsAccepted
                                          ? Theme.of(context).primaryColor
                                          : Color(0xFF9D9D9D)),
                                  onChanged: (value) {
                                    setState(() {
                                      TermsAndConditionsAccepted = value!;
                                    });
                                  }),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('please fill all the fields'),
                                  backgroundColor: Theme.of(context)
                                      .snackBarTheme
                                      .backgroundColor,
                                ));
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    Theme.of(context).primaryColor),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
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
          ),
        ));
  }
}
