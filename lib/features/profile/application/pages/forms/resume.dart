import 'dart:io';

import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_events.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/profile/application/widgets/cv_attachment_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  late User user;
  File? cv;
  File? profilepic;

  @override
  void initState() {
    final state = context.read<AuthBloc>().state;
    if (state is Authenticated) {
      user = state.user;
    } else {
      context.read<AuthBloc>().add(AuthLogoutRequested());
      return;
    }
    super.initState();
  }

  void _onFileSelected(File file) {
    setState(() {
      cv = file;
    });
  }

  void _onFileRemoved(File file) {
    setState(() {
      cv = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 134.h),
              child: Text(
                'Add Resume',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            CvAttachmentField(
              onFileSelected: _onFileSelected,
              onFileRemoved: _onFileRemoved,
            ),
            Padding(
                padding: EdgeInsets.only(top: 24.h, bottom: 110.h),
                child: Text(
                  'Upload files in PDF format up to 5 MB. Just upload it once and you can use it in your next application.',
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 2,
                )),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthUserUpdated(
                        user,
                        cv: cv,
                      ));
                  context.pop();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xFF5BA470)),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text('Save',
                      style: Theme.of(context).textTheme.displaySmall),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
