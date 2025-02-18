import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  final Key key=Key('CustomError');
   CustomError({
    required this.errorDetails, required super.key,
  })  ;

  @override
  Widget build(BuildContext context) {
    return Center(
    
      child: Card(
        color: Colors.green,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "Something is not right here...",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50.h,),
              Text(errorDetails.exceptionAsString(),)
            ],
          ),
        ),
      ),
    );
  }
}
