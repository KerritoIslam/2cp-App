import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_events.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/shared/pages/loading_page.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

late TextEditingController emailController;
bool _emailConfirmed = false;
bool _otpConfirmed = false;
int? OTP;
bool _passwordObscure = true;
bool _confirmPasswordObscure = true;
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

emailValidator(value) {
  RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your Email';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid Email';
  }
  return null;
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late GlobalKey<FormState> _formKey;
  late final List<TextEditingController> _otpControllers;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
    _otpControllers = List.generate(6, (index) => TextEditingController());

    super.initState();
  }

  @override
  void dispose() {
    if (_formKey.currentState != null) _formKey.currentState!.dispose();

    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    for (var element in _otpControllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          toastification.show(
            context: context,
            title: Text(state.message),
            type: ToastificationType.error,
          );
        }
        if (state is Unauthenticated) {
          OTP = state.OTP;
          print(OTP);
        }
        if (state is AuthPasswordUpdatedSuccessfully) {
          toastification.show(
            context: context,
            title: Text('Password updated successfully'),
            type: ToastificationType.success,
          );
          GoRouter.of(context).go('/auth/welcome');
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const LoadingPage();
        }
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leadingWidth: 150.w,
            leading: TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/auth/welcome');
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
          ),
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                    height: 300.h,
                    width: 300.w,
                    child: SvgPicture.asset('assets/images/signup_main.svg')),
                Text('Enter The informations needed',
                    style: Theme.of(context).textTheme.displaySmall),
                Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: Text(
                    'Provide the following informations to create a  new\n account .',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Visibility(
                            visible: !_emailConfirmed,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: TextFormField(
                                controller: emailController,
                                style: Theme.of(context).textTheme.bodyMedium,
                                validator: (value) => emailValidator(value),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'enter your email address',
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  enabledBorder: Forms.regularBorder,
                                  focusedBorder: Forms.regularBorder,
                                  errorBorder: Forms.errorBorder,
                                  focusedErrorBorder: Forms.errorBorder,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _otpConfirmed,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: _passwordObscure,
                                style: Theme.of(context).textTheme.bodyMedium,
                                validator: (value) => passwordValidator(value),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                  hintText: 'New Password',
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  enabledBorder: Forms.regularBorder,
                                  focusedBorder: Forms.regularBorder,
                                  errorBorder: Forms.errorBorder,
                                  focusedErrorBorder: Forms.errorBorder,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _otpConfirmed,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                obscureText: _confirmPasswordObscure,
                                style: Theme.of(context).textTheme.bodyMedium,
                                validator: (value) =>
                                    confirmPasswordValidator(value),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  enabledBorder: Forms.regularBorder,
                                  focusedBorder: Forms.regularBorder,
                                  errorBorder: Forms.errorBorder,
                                  focusedErrorBorder: Forms.errorBorder,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _otpConfirmed,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 24, bottom: 40),
                              child: Text(
                                'Your password must be 8+ characters with uppercase, lowercase, a number, and a special character',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                          Visibility(
                              visible: _emailConfirmed,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'your email : ${emailController.text}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )),
                          Visibility(
                            visible: !_otpConfirmed && _emailConfirmed,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(6, (index) {
                                return SizedBox(
                                  width: 40,
                                  child: TextField(
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    controller: _otpControllers[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      enabledBorder: Forms.regularBorder,
                                      focusedBorder: Forms.regularBorder,
                                      errorBorder: Forms.errorBorder,
                                      focusedErrorBorder: Forms.errorBorder,
                                    ),
                                    onChanged: (value) {
                                      if (value.isNotEmpty && index < 5) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
                          Visibility(
                            visible: !_otpConfirmed && _emailConfirmed,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _emailConfirmed = false;
                                  });
                                },
                                child: Text('edit email',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                Theme.of(context).primaryColor,
                                            decorationThickness: 2.5)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 75.h,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (!_emailConfirmed) {
                                if (!_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'please provid a valid email',
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
                                  setState(() {
                                    _emailConfirmed = true;
                                    for (var element in _otpControllers) {
                                      element.clear();
                                    }
                                  });
                                  context.read<AuthBloc>().add(
                                      AuthOTPRequested(emailController.text));
                                }
                                return;
                              } else if (!_otpConfirmed) {
                                String otpString = _otpControllers
                                    .map((e) => e.text)
                                    .toList()
                                    .join();

                                if (otpString.length != 6) {
                                  toastification.show(
                                    context: context,
                                    title: Text('Please enter all 6 digits'),
                                    type: ToastificationType.error,
                                  );
                                  return;
                                }

                                int inputOtp = int.parse(otpString);

                                if (OTP == inputOtp) {
                                  setState(() {
                                    _otpConfirmed = true;
                                    for (var element in _otpControllers) {
                                      element.clear();
                                    }
                                  });
                                } else {
                                  toastification.show(
                                    context: context,
                                    title: Text('wrong OTP'),
                                    type: ToastificationType.error,
                                  );
                                }
                              } else {
                                if (!_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'please provid a valid password',
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
                                  context.read<AuthBloc>().add(
                                      AuthResetPasswordRequested(
                                          email: emailController.text,
                                          password: passwordController.text));
                                }
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
                                _emailConfirmed ? 'Continue' : 'Send email',
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
      },
    );
  }
}
