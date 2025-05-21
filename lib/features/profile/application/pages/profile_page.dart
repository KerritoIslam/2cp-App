import 'dart:io';

import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_events.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/profile/application/widgets/profile_section_card.dart';
import 'package:app/shared/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _editing = false;
  bool _expanded = false;
  late User user;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    user = (context.read<AuthBloc>().state as Authenticated).user;
    super.initState();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });

        // Update user profile with new image
        context.read<AuthBloc>().add(
              AuthUserUpdated(
                user,
                profilepic: _selectedImage,
              ),
            );
      }
    } catch (e) {
      print('Error picking image: $e');
      toastification.show(
        title: Text('Error selecting image'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 2),
      );
    }
  }

  final ExpansionTileController _controller = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUserUpdatedSuccessfully) {
          toastification.show(
            title: Text('${state.message}'),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 2),
          );
        } else if (state is AuthError) {
          toastification.show(
            title: Text('${state.message}'),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 2),
          );
        } else if (state is Authenticated) {
          user = state.user;
        }
      },
      builder: (context, state) {
        if (state is AuthError) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: SafeArea(
              child: Center(
                child: Text(
                  state.message,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.red,
                      ),
                ),
              ),
            ),
          );
        } else if (state is AuthLoading) {
          return LoadingPage();
        } else if (state is Authenticated) {
          user = state.user;
        }
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
                          context.push('/protected/options');
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
                                style:
                                    Theme.of(context).textTheme.displayMedium,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    user.experience.length.toString(),
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
                                      if (user.experience.isNotEmpty) {
                                        strength += 0.2;
                                      }
                                      if (user.description != null &&
                                          user.description!.isNotEmpty) {
                                        strength += 0.2;
                                      }
                                      strength += 0.2;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                child: ExpansionTile(
                                  controller: _controller,
                                  onExpansionChanged: (isExpanded) {
                                    if (user.description == null) {
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
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide.none),
                                  leading: SvgPicture.asset(
                                    'assets/icons/profile_dark.svg',
                                    colorFilter: ColorFilter.mode(
                                        Theme.of(context).primaryColor,
                                        BlendMode.srcIn),
                                  ),
                                  title: Text(
                                    'About me',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  trailing: user.description == null ||
                                          user.description!.isEmpty ||
                                          _editing
                                      ? SvgPicture.asset(
                                          user.description != null &&
                                                  user.description!.isNotEmpty
                                              ? 'assets/icons/edit.svg'
                                              : 'assets/icons/add.svg',
                                          width: 40.w,
                                          height: 40.h,
                                        )
                                      : _expanded
                                          ? Icon(
                                              Icons.expand_less,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            )
                                          : Icon(Icons.expand_more,
                                              color: Theme.of(context)
                                                  .primaryColor),
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
                                        user.description ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ProfileCard(
                                title: 'Internship Experience',
                                icon: 'internship_experience.svg',
                                children: user.experience.map((e) {
                                  late String datedisplay;
                                  if (e['start'] != null && e['end'] != null) {
                                    try {
                                      DateFormat mainformat =
                                          DateFormat('dd/mm/yyyy');
                                      DateTime startDate =
                                          mainformat.parse(e['start']);
                                      DateTime endDate =
                                          mainformat.parse(e['end']);
                                      Duration? difference =
                                          endDate.difference(startDate);

                                      if (difference.inDays > 365) {
                                        datedisplay =
                                            '${DateFormat('MMM yyyy').format(startDate)}-${DateFormat('MMM yyyy').format(endDate)}   .${difference.inDays ~/ 365} years';
                                      } else {
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    isThreeLine: true,
                                    trailing: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              context.go(
                                                '/protected/options',
                                              );
                                            },
                                            icon: Icon(Icons.settings)),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/icons/edit.svg',
                                          ),
                                          onPressed: () {
                                            context.go(
                                              '/protected/profile/internship_expirience_form',
                                              extra: user.experience.indexOf(e),
                                            );
                                          },
                                        ),
                                      ],
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
                                  if (e['start'] != null && e['end'] != null) {
                                    try {
                                      DateFormat mainformat =
                                          DateFormat('yyyy-MM-dd');
                                      DateTime startDate =
                                          mainformat.parse(e['start']);
                                      DateTime endDate =
                                          mainformat.parse(e['end']);

                                      Duration? difference =
                                          endDate.difference(startDate);

                                      if (difference.inDays > 365) {
                                        datedisplay =
                                            '${DateFormat('MMM yyyy').format(startDate)}-${DateFormat('MMM yyyy').format(endDate)}   .${difference.inDays ~/ 365} years';
                                      } else {
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
                                    title: Text(e['institution'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                            )),
                                    subtitle: Text(
                                      '${e['degree']} \n $datedisplay',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    isThreeLine: true,
                                    trailing: IconButton(
                                      icon: SvgPicture.asset(
                                        'assets/icons/edit.svg',
                                      ),
                                      onPressed: () {
                                        context.go(
                                          '/protected/profile/education_form',
                                          extra: user.education.indexOf(e),
                                        );
                                      },
                                    ),
                                  );
                                }).toList(),
                                onAdd: () {
                                  context
                                      .go('/protected/profile/education_form');
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
                                                        BorderRadius.circular(
                                                            50),
                                                    side: BorderSide(width: 0)),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .dividerColor,
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
                                children: [
                                  if (user.cv['link'] != '')
                                    ListTile(
                                      title: Text(user.cv['name'], style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                                      subtitle: Text(
                                          user.cv['size'].toString() + ' bytes' , style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey[400])),
                                      trailing:  SvgPicture.asset('assets/icons/pdf_file.svg'),
                                      onTap: () async {
                                          try {
                                            final Uri url =
                                                Uri.parse(user.cv['link']);
                                            // Use launchUrl directly with error handling
                                            final bool launched =
                                                await launchUrl(
                                              url,
                                              mode: LaunchMode
                                                  .externalApplication,
                                            );

                                            if (!launched) {
                                              toastification.show(
                                                title: Text(
                                                    'Could not open the file'),
                                                type: ToastificationType.error,
                                                autoCloseDuration:
                                                    const Duration(seconds: 2),
                                              );
                                            }
                                          } catch (e) {
                                            print('Error launching URL: $e');
                                            toastification.show(
                                              title: Text('Error opening file'),
                                              type: ToastificationType.error,
                                              autoCloseDuration:
                                                  const Duration(seconds: 2),
                                            );
                                          }
                                        },
                                      ),
                                    
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
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 65.r,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 60.r,
                                  backgroundImage: _selectedImage != null
                                      ? FileImage(_selectedImage!)
                                      : user.profilepic['link'] != ''
                                          ? NetworkImage(
                                              user.profilepic['link'])
                                          : AssetImage(
                                                  'assets/images/avatar.png')
                                              as ImageProvider,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Visibility(
                                    visible: _editing,
                                    child: IconButton(
                                      onPressed: _pickImage,
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 24.r,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      },
    );
  }
}
