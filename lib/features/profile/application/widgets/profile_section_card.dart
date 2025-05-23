import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String icon;
  final List<Widget> children;
  final Function()? onAdd;
  final bool edit;
  const ProfileCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.children,
      this.edit = false,
      this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w),
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
        children: [
          ListTile(
              tileColor: Colors.transparent,
              leading: SvgPicture.asset(
                'assets/icons/$icon',
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcIn),
              ),
              title: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: title != 'Internship Experience'
                  ? IconButton(
                      onPressed: onAdd ?? () {},
                      icon: SvgPicture.asset(
                        edit ? 'assets/icons/edit.svg' : 'assets/icons/add.svg',
                        width: 40.w,
                        height: 40.h,
                      ),
                    )
                  : null),
          if (children.isNotEmpty)
            Divider(
              color: Theme.of(context).dividerColor,
              thickness: 1,
              indent: 15.w,
              endIndent: 15.w,
            ),
          ...children,
        ],
      ),
    );
  }
}
