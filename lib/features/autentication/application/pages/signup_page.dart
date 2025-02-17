import 'package:app/features/autentication/domain/entities/user_entity.dart';
import 'package:app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  final User user;
  const SignUpPage({super.key, required this.user});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

late TextEditingController nameController;
late TextEditingController emailController;

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
  RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your Email';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid Email';
  }
  return null;
}

class _SignUpPageState extends State<SignUpPage> {
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
        _formKey = GlobalKey<FormState>();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    super.initState();
  }

  @override
  void dispose() {
    if (_formKey.currentState != null) _formKey.currentState!.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 27.h,
              ),
              TextButton(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: TextFormField(
                            controller: nameController,
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
                            controller: emailController,
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
                        SizedBox(
                          height: 75.h,
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
                              context.go('/auth/SignUpPage/password',
                                  extra: widget.user.copyWith(
                                      name: nameController.text,
                                      email: emailController.text));
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
      ),
    );
  }
}
