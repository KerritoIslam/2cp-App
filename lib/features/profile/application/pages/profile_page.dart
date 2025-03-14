import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/application/bloc/auth_state.dart';
import 'package:app/features/autentication/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    User user = (context.read<AuthBloc>().state as Authenticated).user;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 22.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(100.r),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 120.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              user.name,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(height: 10.h),
                            Text(user.email,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey,
                                    )),
                            SizedBox(height: 22.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '80',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey[400],
                                      ),
                                ),
                                Text(
                                  user.date_joined,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey[400],
                                      ),
                                ),
                                Text(
                                  '60%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey[400],
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'internships',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey[600],
                                      ),
                                ),
                                Text(
                                  'Member since',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey[600],
                                      ),
                                ),
                                Text(
                                  'Profile Strength',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey[600],
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 49.h),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              height: 78.h,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withValues(alpha: 0.2),
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  'assets/icons/profile_dark.svg',
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).primaryColor,
                                      BlendMode.srcIn),
                                ),
                                title: Text(
                                  'About me',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    //todo : use description to controle the icon once it is valid on backend
                                    icon: SvgPicture.asset(
                                      'assets/icons/add.svg',
                                      width: 40.w,
                                      height: 40.h,
                                    )),
                                tileColor: Colors.transparent,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              height: 78.h,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withValues(alpha: 0.2),
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  'assets/icons/profile_dark.svg',
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).primaryColor,
                                      BlendMode.srcIn),
                                ),
                                title: Text(
                                  'About me',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    //todo : use description to controle the icon once it is valid on backend
                                    icon: SvgPicture.asset(
                                      'assets/icons/add.svg',
                                      width: 40.w,
                                      height: 40.h,
                                    )),
                                tileColor: Colors.transparent,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              height: 78.h,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withValues(alpha: 0.2),
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  'assets/icons/profile_dark.svg',
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).primaryColor,
                                      BlendMode.srcIn),
                                ),
                                title: Text(
                                  'About me',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    //todo : use description to controle the icon once it is valid on backend
                                    icon: SvgPicture.asset(
                                      'assets/icons/add.svg',
                                      width: 40.w,
                                      height: 40.h,
                                    )),
                                tileColor: Colors.transparent,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              height: 78.h,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withValues(alpha: 0.2),
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  'assets/icons/profile_dark.svg',
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).primaryColor,
                                      BlendMode.srcIn),
                                ),
                                title: Text(
                                  'About me',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    //todo : use description to controle the icon once it is valid on backend
                                    icon: SvgPicture.asset(
                                      'assets/icons/add.svg',
                                      width: 40.w,
                                      height: 40.h,
                                    )),
                                tileColor: Colors.transparent,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              height: 78.h,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withValues(alpha: 0.2),
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  'assets/icons/profile_dark.svg',
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).primaryColor,
                                      BlendMode.srcIn),
                                ),
                                title: Text(
                                  'About me',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    //todo : use description to controle the icon once it is valid on backend
                                    icon: SvgPicture.asset(
                                      'assets/icons/add.svg',
                                      width: 40.w,
                                      height: 40.h,
                                    )),
                                tileColor: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 65.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 60.r,
                          backgroundImage: user.profilepic != null
                              ? NetworkImage(user.profilepic!)
                              : AssetImage('assets/images/avatar.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
