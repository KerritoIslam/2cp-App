import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_state.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:app/features/opportunities/application/widgets/opportunity_card.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CompanyProfilePage extends StatefulWidget {
  final int id;
  const CompanyProfilePage({super.key, required this.id});

  @override
  State<CompanyProfilePage> createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  late ScrollController _scrollController;
  bool _isLoadingMore = false;
  final List<Opportunity> _opportunites = [
    Opportunity.problem(
      id: '20',
      title: 'Software Engineer Intern',
      description:
          'An exciting opportunity to work with a leading tech company.',
      totalApplications: 10,
      company: Company(
        id: '10',
        name: 'Tech Innovators',
        category: 'Software',
        profilepic: "https://avatars.githubusercontent.com/u/145935984?v=4",
      ),
      applicantsAvatars: [
        'assets/images/avatar.png',
        'assets/images/avatar.png',
        'assets/images/avatar.png',
      ],
      category: 'Software',
      skills: ['Java', 'Python', 'Dart'],
    ),
    Opportunity.problem(
      id: '20',
      title: 'Software Engineer Intern',
      description:
          'An exciting opportunity to work with a leading tech company.',
      totalApplications: 10,
      company: Company(
        id: '10',
        name: 'Tech Innovators',
        category: 'Software',
        profilepic: "https://avatars.githubusercontent.com/u/145935984?v=4",
      ),
      applicantsAvatars: [
        'assets/images/avatar.png',
        'assets/images/avatar.png',
        'assets/images/avatar.png',
      ],
      category: 'Software',
      skills: ['Java', 'Python', 'Dart'],
    ),
    Opportunity.problem(
      id: '20',
      title: 'Software Engineer Intern',
      description:
          'An exciting opportunity to work with a leading tech company.',
      totalApplications: 10,
      company: Company(
        id: '10',
        name: 'Tech Innovators',
        category: 'Software',
        profilepic: "https://avatars.githubusercontent.com/u/145935984?v=4",
      ),
      applicantsAvatars: [
        'assets/images/avatar.png',
        'assets/images/avatar.png',
        'assets/images/avatar.png',
      ],
      category: 'Software',
      skills: ['Java', 'Python', 'Dart'],
    ),
    Opportunity.problem(
      id: '20',
      title: 'Software Engineer Intern',
      description:
          'An exciting opportunity to work with a leading tech company.',
      totalApplications: 10,
      company: Company(
        id: '10',
        name: 'Tech Innovators',
        category: 'Software',
        profilepic: "https://avatars.githubusercontent.com/u/145935984?v=4",
      ),
      applicantsAvatars: [
        'assets/images/avatar.png',
        'assets/images/avatar.png',
        'assets/images/avatar.png',
      ],
      category: 'Software',
      skills: ['Java', 'Python', 'Dart'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 600 &&
        !_isLoadingMore) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    setState(() => _isLoadingMore = true);

    // Simulate fetch
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      // Append fake items for now, or call your BLoC/repo to fetch
      _opportunites.addAll([
        Opportunity.problem(
          id: '20',
          title: 'Software Engineer Intern',
          description:
              'An exciting opportunity to work with a leading tech company.',
          totalApplications: 10,
          company: Company(
            id: '10',
            name: 'Tech Innovators',
            category: 'Software',
            profilepic: "https://avatars.githubusercontent.com/u/145935984?v=4",
          ),
          applicantsAvatars: [
            'assets/images/avatar.png',
            'assets/images/avatar.png',
            'assets/images/avatar.png',
          ],
          category: 'Software',
          skills: ['Java', 'Python', 'Dart'],
        ),
        Opportunity.problem(
          id: '20',
          title: 'Software Engineer Intern',
          description:
              'An exciting opportunity to work with a leading tech company.',
          totalApplications: 10,
          company: Company(
            id: '10',
            name: 'Tech Innovators',
            category: 'Software',
            profilepic: "https://avatars.githubusercontent.com/u/145935984?v=4",
          ),
          applicantsAvatars: [
            'assets/images/avatar.png',
            'assets/images/avatar.png',
            'assets/images/avatar.png',
          ],
          category: 'Software',
          skills: ['Java', 'Python', 'Dart'],
        ),
        Opportunity.problem(
          id: '20',
          title: 'Software Engineer Intern',
          description:
              'An exciting opportunity to work with a leading tech company.',
          totalApplications: 10,
          company: Company(
            id: '10',
            name: 'Tech Innovators',
            category: 'Software',
            profilepic: "https://avatars.githubusercontent.com/u/145935984?v=4",
          ),
          applicantsAvatars: [
            'assets/images/avatar.png',
            'assets/images/avatar.png',
            'assets/images/avatar.png',
          ],
          category: 'Software',
          skills: ['Java', 'Python', 'Dart'],
        ),
      ]);
      _isLoadingMore = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _editing = false;
  @override
  Widget build(BuildContext context) {
    User user = (context.read<AuthBloc>().state as Authenticated).user;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: ListView.builder(
        controller: _scrollController,
        itemCount: _opportunites.length +
            2, // +2 for profile header and loading indicator
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildProfileHeader(user);
          } else if (index <= _opportunites.length) {
            return Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: EdgeInsets.only(top: 10.h),
                child: opportunityCard(opportunity: _opportunites[index - 1]));
          } else {
            return _isLoadingMore
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 100.h),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )))
                : const SizedBox.shrink();
          }
        },
      )),
    );
  }

  Widget _buildProfileHeader(User user) {
    return Column(
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey,
                            )),
                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          user.internships.length.toString(),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey[400],
                                  ),
                        ),
                        Text(
                          user.date_joined,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                        Text(
                          'Member since',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                        Text(
                          'Profile Strength',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ],
                    ),
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
    );
  }
}
