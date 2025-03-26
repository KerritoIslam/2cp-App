import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? suffix;
  final String text;
  const SecondaryButton({
    super.key, required this.onPressed, this.suffix, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).shadowColor.withOpacity(0.8)),
                  shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
        
                height: 55.h,
                child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.w500),
                    ),

            SizedBox(width: 10.w,),
            suffix??Container()
                       ],
                ),
              ),
            );
  }
}
