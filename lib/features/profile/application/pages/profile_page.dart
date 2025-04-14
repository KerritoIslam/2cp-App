import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/profile/application/widgets/profile_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}





class _ProfilePageState extends State<ProfilePage> {
bool _editing = false;
bool _expanded = false;
final ExpansionTileController _controller = ExpansionTileController();
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
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.go('/protected/company_profile/0');
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _editing = !_editing;
                      });
                    },
                    icon: Icon(
                      _editing ? Icons.done : Icons.edit,
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
                                user.internships.length.toString(),
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
                                () {
                                  double strength = 0;
                                  if (user.skills.isNotEmpty) {
                                    strength += 0.2;
                                  }
                                  if (user.education.isNotEmpty) {
                                    strength += 0.2;
                                  }
                                  if (user.internships.isNotEmpty) {
                                    strength += 0.2;
                                  }
                                  if (user.discription != null &&
                                      user.discription!.isNotEmpty) {
                                    strength += 0.2;
                                  }
                                  if (user.profilepic != null) {
                                    strength += 0.2;
                                  }
                                  return '${(strength * 100).toInt()}%';
                                }(),
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
                              controller: _controller,
                              onExpansionChanged: (isExpanded) {
                                if (user.discription == null) {
                                  _controller.collapse();
                                  _expanded = false;
                                  context.go('/protected/profile/about_me');
                                  return;
                                }
                                if (_editing) {
                                  _controller.expand();
                                  _expanded = true;
                                  context.go('/protected/profile/about_me');
                                  return;
                                }
                                setState(() {});
                                _expanded = isExpanded;
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
                              trailing: user.discription == null ||
                                      user.discription!.isEmpty ||
                                      _editing
                                  ? SvgPicture.asset(
                                      user.discription != null &&
                                              user.discription!.isNotEmpty
                                          ? 'assets/icons/edit.svg'
                                          : 'assets/icons/add.svg',
                                      width: 40.w,
                                      height: 40.h,
                                    )
                                  : _expanded
                                      ? Icon(
                                          Icons.expand_less,
                                          color: Theme.of(context).primaryColor,
                                        )
                                      : Icon(Icons.expand_more,
                                          color:
                                              Theme.of(context).primaryColor),
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
                                    user.discription ?? '',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ProfileCard(
                            title: 'Internship Experience',
                            icon: 'internship_experience.svg',
                            children: user.internships.map((e) {
                              late String datedisplay;
                              if (e['startDate'] != null &&
                                  e['endDate'] != null) {
                                try {
                                  DateFormat mainformat =
                                      DateFormat('dd/mm/yyyy');
                                  DateTime startDate =
                                      mainformat.parse(e['startDate']);
                                  DateTime endDate =
                                      mainformat.parse(e['endDate']);
                                  Duration? difference =
                                      endDate.difference(startDate);

                                  if (difference.inDays > 365) {
                                    datedisplay =
                                        '${DateFormat('MMM yyyy').format(startDate)}-${DateFormat('MMM yyyy').format(endDate)}   .${difference.inDays ~/ 365} years';
                                  } else if (difference.inDays > 30) {
                                    datedisplay =
                                        '${DateFormat('MMM dd').format(startDate)}-${DateFormat('MMM dd').format(endDate)}   .${difference.inDays} days';
                                  }
                                } catch (e) {
                                  datedisplay = '';
                                }
                              } else {
                                datedisplay = '';
                              }
                              return ListTile(
                                title: Text(e['title'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                        )),
                                subtitle: Text(
                                  '${e['company']} \n $datedisplay',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                isThreeLine: true,
                                trailing: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/icons/edit.svg',
                                  ),
                                  onPressed: () {
                                    context.go(
                                      '/protected/profile/internship_expirience_form',
                                      extra: user.internships.indexOf(e),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                            onAdd: () {
                              context.go(
                                '/protected/profile/internship_expirience_form',
                              );
                            },
                          ),
                          ProfileCard(
                            title: 'Education',
                            icon: 'education.svg',
                            children: user.education.map((e) {
                              late String datedisplay;
                              if (e['startDate'] != null &&
                                  e['endDate'] != null) {
                                try {
                                  DateFormat mainformat =
                                      DateFormat('dd/mm/yyyy');
                                  DateTime startDate =
                                      mainformat.parse(e['startDate']);
                                  DateTime endDate =
                                      mainformat.parse(e['endDate']);
                                  Duration? difference =
                                      endDate.difference(startDate);

                                  if (difference.inDays > 365) {
                                    datedisplay =
                                        '${DateFormat('MMM yyyy').format(startDate)}-${DateFormat('MMM yyyy').format(endDate)}   .${difference.inDays ~/ 365} years';
                                  } else if (difference.inDays > 30) {
                                    datedisplay =
                                        '${DateFormat('MMM dd').format(startDate)}-${DateFormat('MMM dd').format(endDate)}   .${difference.inDays} days';
                                  }
                                } catch (e) {
                                  datedisplay = '';
                                }
                              } else {
                                datedisplay = '';
                              }
                              return ListTile(
                                title: Text(e['education'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                        )),
                                subtitle: Text(
                                  '${e['school']} \n $datedisplay',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                isThreeLine: true,
                                trailing: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/icons/edit.svg',
                                  ),
                                  onPressed: () {
                                    context.go(
                                      '/protected/profile/internship_expirience_form',
                                      extra: user.internships.indexOf(e),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                            onAdd: () {
                              context.go('/protected/profile/education_form');
                            },
                          ),
                          ProfileCard(
                            title: 'Skills',
                            icon: 'skills.svg',
                            edit: user.skills.isNotEmpty,
                            children: [
                              if (user.skills.isNotEmpty)
                                Wrap(
                                  children: user.skills
                                      .map(
                                        (e) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Chip(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                side: BorderSide(width: 0)),
                                            backgroundColor:
                                                Theme.of(context).dividerColor,
                                            label: Text(e,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                            deleteIcon: null,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                            ],
                            onAdd: () {
                              context.go('/protected/profile/Skills');
                            },
                          ),
                          ProfileCard(
                            title: 'Resume',
                            icon: 'resume.svg',
                            children: [],
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
