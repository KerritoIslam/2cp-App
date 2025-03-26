import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillBubble extends StatelessWidget {
  final String skill;
  const SkillBubble({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Theme.of(context).shadowColor.withOpacity(0.1), // Light gray background
        
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            skill,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
        SizedBox(width: 2.w),
      ],
    );
  }
}
