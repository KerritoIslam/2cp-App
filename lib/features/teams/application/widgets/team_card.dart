import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamCard extends StatefulWidget {
  const TeamCard({super.key});

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 214.h,
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
              blurRadius: 10,
              spreadRadius: 7,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
              width: 200.w,
              child: Stack(
                children: List.generate(5, (index) {
                  return Positioned(
                    left: index * 25, // Controls the overlap
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images/avatar.png',
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Team name",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text('members: 5', style: Theme.of(context).textTheme.labelMedium),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 5.w),
                  padding: EdgeInsets.only(right: 5.w),
                  child: Chip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Text(
                      "Skill $index",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    backgroundColor: Theme.of(context).dividerColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                );
              })
                ..add(
                  Text(
                    "+2 more",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text('actif 25 min ago',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w200,
                    )),
          ],
        ));
  }
}
