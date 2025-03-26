import 'package:app/features/profile/application/widgets/cv_attachment_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
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
            CvAttachmentField(),
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
                  //todo: edit the return value
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
