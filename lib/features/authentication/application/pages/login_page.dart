import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_events.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  static final locator=GetIt.instance;
  @override
  State<LogInPage> createState() => _LogInPageState();
}

late TextEditingController emailController;
late TextEditingController passwordController;
bool _passwordObscure = true;

emailValidator(value) {
  RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your Email';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid Email';
  }
  return null;
}

passwordValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  return null;
}

class _LogInPageState extends State<LogInPage> {
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    if (_formKey.currentState != null) _formKey.currentState!.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc,AuthState>(
      listener: (context,state){
        if (state is AuthError){ 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
             
              content: Text(state.message,),
            ) 
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          leadingWidth: 150.w,
          leading:            TextButton(
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
                height: 422.h,
                width: 402.w,
                child: SvgPicture.asset('assets/images/login.svg')),
            Text('Enter your informations here',
                style: Theme.of(context).textTheme.displaySmall),
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Text(
                'Already have an account ? enter your email address\nand your password .',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40.h,
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
                          controller: emailController,
                          style: Theme.of(context).textTheme.bodyMedium,
                          validator: (value) => emailValidator(value),
                          autovalidateMode: AutovalidateMode.disabled,
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
                          controller: passwordController,
                          obscureText: _passwordObscure,
                          style: Theme.of(context).textTheme.bodyMedium,
                          validator: (value) => passwordValidator(value),
                          autovalidateMode: AutovalidateMode.disabled,
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
                            hintStyle:
                                Theme.of(context).textTheme.labelMedium,
                            enabledBorder: Forms.regularBorder,
                            focusedBorder: Forms.regularBorder,
                            errorBorder: Forms.errorBorder,
                            focusedErrorBorder: Forms.errorBorder,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go('/auth/forgotpassword');
                        },
                        child: Text('Forgot Password ?',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Theme.of(context).primaryColor,
                                    decorationThickness: 2.5)),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                              content: Text(
                                'please fill all the fields properly',
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
                          context.read<AuthBloc>().add(AuthLoginRequested(email: emailController.text, password: passwordController
                          .text));
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
                            'Log IN',
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
    )
,
    );
      }
}
