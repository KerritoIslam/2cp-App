import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OpportunityType extends StatelessWidget {
  final String name;
  final String imagePath;
  final void Function() onTap;
  const OpportunityType({super.key, required this.name, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 120.h,
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
            
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).snackBarTheme.backgroundColor!.withOpacity(0.03) ,            
                  offset: Offset(0, 0.r),
                )
              ],
              color: Theme.of(context).cardColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30.r),
              
          
            ),
            child: SvgPicture.asset(imagePath),
          ),
             Text(name,style: Theme.of(context).textTheme.bodyMedium    )      

        ],
      ),
    );
  }
}
