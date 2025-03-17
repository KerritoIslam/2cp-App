import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/application/bloc/auth_state.dart';
import 'package:app/features/autentication/domain/entities/user_entity.dart';
import 'package:app/features/profile/application/widgets/profile_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

late List<bool> _isExpanded;
String? test;

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    _isExpanded = List.generate(5, (index) => false);
    super.initState();
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.go('/protected/layout/0');
                    },
                    icon: Icon(
                      Icons.arrow_back,
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
                      padding: EdgeInsets.only(top: 120.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(100.r),
                        ),
                      ),
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
                                '  internships',
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
                          AnimatedContainer(
                            padding: EdgeInsets.symmetric(vertical: 10.w),
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
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
                            child: ExpansionTile(
                              onExpansionChanged: (isExpanded) {
                                setState(() {
                                  _isExpanded[0] = isExpanded;
                                });
                              },
                              shape:
                                  RoundedRectangleBorder(side: BorderSide.none),
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
                              trailing: SvgPicture.asset(
                                _isExpanded[0]
                                    ? 'assets/icons/edit.svg'
                                    : 'assets/icons/add.svg',
                                width: 40.w,
                                height: 40.h,
                              ),
                              children: [
                                Divider(
                                  color: Theme.of(context).dividerColor,
                                  thickness: 1,
                                  indent: 15.w,
                                  endIndent: 15.w,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'data',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ProfileCard(
                            title: 'Internship Experience',
                            icon: 'internship_experience.svg',
                            children: [
                              Text(
                                  test ?? 'data....1'), //TODO: remove this line
                            ],
                            onAdd: () {
                              context.push<String?>(
                                  '/protected/profile/internship_expirience_form');
                            },
                          ),
                          ProfileCard(
                            title: 'Education',
                            icon: 'education.svg',
                            children: [],
                            onAdd: () {
                              context.push<String?>(
                                  '/protected/profile/education_form');
                            },
                          ),
                          ProfileCard(
                            title: 'Skills',
                            icon: 'skills.svg',
                            children: [
                              Text('data....4'),
                            ],
                            onAdd: () {
                              context
                                  .push<String?>('/protected/profile/Skills');
                            },
                          ),
                          ProfileCard(
                            title: 'Resume',
                            icon: 'resume.svg',
                            children: [
                              Text('data....5'),
                            ],
                            onAdd: () {
                              context.push('/protected/profile/resume');
                            },
                          ),
                          SizedBox(height: 47.h),
                        ],
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
