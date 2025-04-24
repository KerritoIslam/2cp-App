import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamsAlertDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final String? buttonText;
  final Function? onPressed;

  const TeamsAlertDialog({
    super.key,
    this.title,
    this.message,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      title: Text(title ?? 'Alert',
          style: Theme.of(context).textTheme.titleMedium),
      content: Text(message ?? 'Are you sure?',
          style: Theme.of(context).textTheme.bodyMedium),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (onPressed != null) onPressed!();
            Navigator.of(context).pop();
          },
          child: Text(buttonText ?? 'OK',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              )),
        ),
      ],
    );
  }
}
